#include "uart_debug.h"
#include "inputManager.h"
#include "lineManager.h"
#include "motorManager.h"
#include "macro.h"

/**
 * @brief initialize uart
 * 
 */
void uart_debug_Init(void)
{

}

/**
 * @brief write the current states of the manager for debugging purposes
 * 
 */
void uart_debug_Update(void)
{
 //char a[2] = {'A','A'};

 Delay_ms(50);
 UART1_Write(0x65);

 Delay_ms(50);
 UART1_Write(1);
 Delay_ms(50);
 UART1_Write(inputManager_GetState());

 Delay_ms(50);
 UART1_Write(0x65);
 Delay_ms(50);
 UART1_Write(2);
 Delay_ms(50);
 UART1_Write(motorManager_GetState());
 /*
 Delay_ms(50);
 UART1_Write(0x65);
 Delay_ms(50);
 UART1_Write(3);
 Delay_ms(50);
 UART1_Write(inputManager_GetSensorBoolLeft());
 
 Delay_ms(50);
 UART1_Write(0x65);
 Delay_ms(50);
 UART1_Write(4);
 Delay_ms(50);
 UART1_Write(inputManager_GetSensorBoolRight()); */

 Delay_ms(50);
 UART1_Write(0x65);
 Delay_ms(50);
 UART1_Write(3);
 Delay_ms(50);
 UART1_Write(lineManager_GetState());

 /*Delay_ms(50);
 UART1_Write(0x65);
 Delay_ms(50);
 UART1_Write(9);
 Delay_ms(50);
 UART1_Write(MAJOR_VERSION);
 Delay_ms(50);
 UART1_Write(MINOR_VERSION); */

}