#include "uart_debug.h"
#include "inputManager.h"
#include "motorManager.h"

void uart_debug_Init(void)
{

}

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


}