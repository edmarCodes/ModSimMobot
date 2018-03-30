#line 1 "C:/Repository/lineTracerManager/ModSimMobot/MikroC Code/Sumobot_simple.c"
#line 1 "c:/repository/linetracermanager/modsimmobot/mikroc code/inputmanager.h"
#line 1 "c:/repository/linetracermanager/modsimmobot/mikroc code/macro.h"
#line 6 "c:/repository/linetracermanager/modsimmobot/mikroc code/inputmanager.h"
typedef enum
{
 NO_SIGHT =0,
 LEFT_SIGHT=1,
 RIGHT_SIGHT=2,
 BOTH_SIGHT=3
}input_manager_state_t;





input_manager_state_t inputManager_GetState(void);


void inputManager_Init(void);

void inputManager_UpdateManager(void);
 void inputManager_UpdateManager2(void);
#line 1 "c:/repository/linetracermanager/modsimmobot/mikroc code/linemanager.h"
#line 1 "c:/repository/linetracermanager/modsimmobot/mikroc code/macro.h"
#line 6 "c:/repository/linetracermanager/modsimmobot/mikroc code/linemanager.h"
typedef enum{
 NO_LINE = 0,
 PARTIAL_LEFT = 1,
 PARTIAL_RIGHT = 2,
 HALF_LEFT = 3,
 HALF_RIGHT = 4,
 FULL = 5
}line_manager_state_t;

line_manager_state_t lineManager_GetState(void);
void lineManager_Init(void);

void lineManager_UpdateManager(void);
#line 1 "c:/repository/linetracermanager/modsimmobot/mikroc code/motormanager.h"



typedef enum
{
 MOTOR_INIT=0,
 MOTOR_OFF=1,
 SLOW_LEFT=2,
 SLOW_RIGHT=3,

 BACKWARD=4,
 DELAY=5,
 FAST_FORWARD=6,
 FAST_RIGHT = 7,
 FAST_LEFT = 8
}motor_manager_state_t;

motor_manager_state_t motorManager_GetState(void);
void motorManager_Init(void);
void motorManager_UpdateManager(void);

void motorManager_UpdateManager2(void);
#line 1 "c:/repository/linetracermanager/modsimmobot/mikroc code/macro.h"
#line 1 "c:/repository/linetracermanager/modsimmobot/mikroc code/uart_debug.h"




void uart_debug_Init(void);

 void uart_debug_Update(void);
#line 16 "C:/Repository/lineTracerManager/ModSimMobot/MikroC Code/Sumobot_simple.c"
void main() {
  0 ;
 TRISB =0xF0;
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
