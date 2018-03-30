#include "inputManager.h"
#include "lineManager.h"
#include "motorManager.h"

#include "macro.h"

#include "uart_debug.h"








void main() {
  MINOR_VERSION;
  TRISB =0xF0; // Set to Output   RB0 to RB3 to Output and RB4 to RB7 to  Output
  PWM1_Init(5000);
  PWM2_Init(5000);

  PORTB =0;
  uart_debug_Init();
  inputManager_Init();
  lineManager_Init();
  motorManager_Init();
  PWM1_Start();
  PWM2_Start();
  
  UART1_Init(9600);
  RCSTA |= 0x80;

     Delay_ms(100);

  for(;;)
  {
   inputManager_UpdateManager();
   motorManager_UpdateManager();
   
   uart_debug_Update();
  



  
  }






}