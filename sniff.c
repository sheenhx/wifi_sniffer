/*
 * sniff.c
 *
 *  Created on: 21-Jan-2016
 *      Author: lakshbhatia
 *      Author: Sheen Xin HU
 */

#include "sniff.h"
#include <stdbool.h>
#include "simplelink.h"
#include "gpio_if.h"
#include "common.h"
#include <stdint.h>
#include "rom_map.h"
#include "uart_if.h"



bool channelChanged = false;
bool cmd = false;
volatile int iChannel = 11;
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
	int seq = 0;
	long lRetVal = -1;

	unsigned char macAddressVal[SL_MAC_ADDR_LEN];
	unsigned char macAddressLen = SL_MAC_ADDR_LEN;

	sl_NetCfgGet(SL_MAC_ADDRESS_GET,NULL,&macAddressLen,(unsigned char *)macAddressVal);


    while(!cmd)
	{

		UART_PRINT("\n\r[{\"ID\":\"%02x%02x\",",macAddressVal[4],macAddressVal[5]);
		UART_PRINT("\"iSOC\":\"%d\",",iSoc);
		lRetVal = sl_Recv(iSoc,acBuffer,1470,0);

		if(lRetVal < 0)
		{
			UART_PRINT("\"Status\":\"ERROR\",");
			//seq = 0;  in case of out of memory
		}
		else
		{
			UART_PRINT("\"Status\":\"OK\",\"Data\":\"");
			for(count=0;count<lRetVal;count++){
				UART_PRINT("%02x", acBuffer[count]);

			}


			UART_PRINT("\",");
			GPIO_IF_LedToggle(MCU_GREEN_LED_GPIO); // indicating the MCU activities
		}
		seq++;

		UART_PRINT("\"Sequence\":\"%d\"}]", seq);



	}

	lRetVal = sl_Close(iSoc);

	if(lRetVal < 0)
	{
		ERR_PRINT(lRetVal);
		LOOP_FOREVER();
	}
	UART_PRINT("\nSocket closed");

	while(cmd); //wait until the configuration is done

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

//****************************************************************************
//
//! Get Configuration form the user over UART
//!
//! \param pcCfgName is a pointer to the array which will contain the Configurations
//!
//! This function
//!    1. gets the Cfg string over uart
//!
//! \return iRetVal is the length of the configuration(user input).
//
//****************************************************************************
int GetCfg(char *pcCfgName, unsigned int uiMaxLen){
  char ucRecvd = 0;
  int  iRetVal = 0;
  char acCmdStore[128];
  do
  {
      ucRecvd = 0;

      //
      // Get the CFG name to connect over the UART
      //
      iRetVal = GetCmd(acCmdStore, sizeof(acCmdStore));
      if(iRetVal > 0)
      {
          // remove start/end spaces if any
          iRetVal = TrimSpace(acCmdStore);

          //
          // Parse the CFG name
          //
          strncpy(pcCfgName, acCmdStore, iRetVal);
          if(pcCfgName != NULL)
          {
              ucRecvd = 1;
              pcCfgName[iRetVal] = '\0';
          }
      }
  }while(ucRecvd == 0);

  return(iRetVal);
}


//****************************************************************************
//
//! Set the cmd flag
//!
//! \param none
//!
//! This function
//!    1. Set the cmd flag
//!
//! \return none
//
//****************************************************************************
void SetCmd(){

		cmd = true;
}



//****************************************************************************
//
//! Clear the cmd flag
//!
//! \param none
//!
//! This function
//!    1. Clear the cmd flag
//!
//! \return none
//
//****************************************************************************
void ClearCmd(){


		/*if (cmd == true)
		{
			DisableInt();
		}*/
		cmd = false;
}
