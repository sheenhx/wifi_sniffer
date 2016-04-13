/*
 * sniff.h
 *
 *  Created on: 21-Jan-2016
 *      Author: lakshbhatia
 */

#ifndef SNIFF_H_
#define SNIFF_H_

#define OSI_STACK_SIZE      2048

void RxStatisticsCollect( void *pvParameters );
void ChangeChannel(int channel);
void SendMessage(void *pvParameters);
void restartRX(void *pvParameters);


#endif /* SNIFF_H_ */
