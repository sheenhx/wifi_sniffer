/*
 * sniff.c
 *
 *  Created on: 21-Jan-2016
 *      Author: lakshbhatia
 */

#include "sniff.h"
#include <stdbool.h>
#include "simplelink.h"
#include "gpio_if.h"
#include "common.h"
#include <stdint.h>
#include "rom_map.h"

bool channelChanged = false;
volatile int iChannel = 12;
char acBuffer[1500];
int16_t iSoc;
OsiTaskHandle sendMessageHandle;

//*****************************************************************************
//
//! RxStatisticsCollect
//!
//! This function
//!        1. Function for performing the statistics by listening on the
//!                channel given by the user.
//!
//! \return none
//
//*****************************************************************************
void RxStatisticsCollect(void *pvParameters)
{
    long lRetVal = -1;
    struct SlTimeval_t timeval;

    timeval.tv_sec =  0;             // Seconds
    timeval.tv_usec = 200000;         // Microseconds.

    channelChanged = false;
    UART_PRINT("\n\rStart collecting packets...\n");

    //
    //Open Socket on the channel to listen
    //
    iSoc = sl_Socket(SL_AF_RF,SL_SOCK_RAW,iChannel);

    UART_PRINT("Channel: %d",iChannel);

    // Enable receive timeout
    lRetVal = sl_SetSockOpt(iSoc,SL_SOL_SOCKET,SL_SO_RCVTIMEO, &timeval, \
                                  sizeof(timeval));

	lRetVal = osi_TaskCreate( SendMessage, \
							(const signed char*)"SendMessage", \
								OSI_STACK_SIZE, NULL, 3, NULL );
	if(lRetVal < 0)
	{
		ERR_PRINT(lRetVal);
		LOOP_FOREVER();
	}
}

void ChangeChannel(int channel){
	GPIO_IF_LedOn(MCU_RED_LED_GPIO);
	iChannel = channel;
	channelChanged = true;
}

void SendMessage(void *pvParameters){

	int count = 0;
	//UART_PRINT("\nSending Message\n");

	long lRetVal = -1;

	while(!channelChanged)
	{

		UART_PRINT("\n\rCollecting packets...\n");
		UART_PRINT("%d iSOC for RECV\n",iSoc);
		lRetVal = sl_Recv(iSoc,acBuffer,1470,0);

		if(lRetVal < 0)
		{
			UART_PRINT("Receive error\n");
		}
		else
		{
			for(count=0;count<lRetVal;count++){
				UART_PRINT("%02x", acBuffer[count]);
				GPIO_IF_LedToggle(MCU_RED_LED_GPIO);
			}

		}

	}

	lRetVal = sl_Close(iSoc);

	if(lRetVal < 0)
	{
//		ERR_PRINT(lRetVal);
		LOOP_FOREVER();
	}
	UART_PRINT("\nSocket closed");
	lRetVal = osi_TaskCreate( restartRX, \
				                                (const signed char*)"Statistics Collect Task", \
				                                OSI_STACK_SIZE, NULL, 3, NULL );
	if(lRetVal < 0)
	{
		ERR_PRINT(lRetVal);
		LOOP_FOREVER();
	}
}

void restartRX(void *pvParameters){
	long lRetVal = -1;

	GPIO_IF_LedOn(MCU_GREEN_LED_GPIO);
		//osi_TaskDelete(&sendMessageHandle);
		lRetVal = osi_TaskCreate( RxStatisticsCollect, \
			                                (const signed char*)"Statistics Collect Task", \
			                                OSI_STACK_SIZE, NULL, 2, NULL );
		if(lRetVal < 0)
		{
			ERR_PRINT(lRetVal);
			LOOP_FOREVER();
		}
}
