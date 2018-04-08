#line 1 "C:/Repository/ModSimMobot/MikroC Code/motorManager.c"
#line 1 "c:/repository/modsimmobot/mikroc code/motormanager.h"
#line 18 "c:/repository/modsimmobot/mikroc code/motormanager.h"
typedef enum
{
 MOTOR_INIT=0,
 MOTOR_STANDBY=1,
 SLOW_LEFT=2,
 SLOW_RIGHT=3,
 BACKWARD=4,
 DELAY=5,
 FAST_FORWARD=6,
 LINE_LEFT=7,
 LINE_RIGHT=8,
 LINE_FORWARD=9,
 LINE_BACKWARD=10
}motor_manager_state_t;

motor_manager_state_t motorManager_GetState(void);
void motorManager_Init(void);
void motorManager_UpdateManager(void);

void motorManager_UpdateManager2(void);
#line 1 "c:/repository/modsimmobot/mikroc code/inputmanager.h"
#line 12 "c:/repository/modsimmobot/mikroc code/inputmanager.h"
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
#line 1 "c:/repository/modsimmobot/mikroc code/linemanager.h"
#line 13 "c:/repository/modsimmobot/mikroc code/linemanager.h"
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
#line 1 "c:/repository/modsimmobot/mikroc code/macro.h"
#line 7 "C:/Repository/ModSimMobot/MikroC Code/motorManager.c"
 motor_manager_state_t motor_manager_state = MOTOR_INIT;
#line 14 "C:/Repository/ModSimMobot/MikroC Code/motorManager.c"
 motor_manager_state_t motorManager_GetState(void)
 {
 return motor_manager_state;
 }
#line 23 "C:/Repository/ModSimMobot/MikroC Code/motorManager.c"
void motorManager_Init(void)
{

}
#line 32 "C:/Repository/ModSimMobot/MikroC Code/motorManager.c"
void motorManager_UpdateManager(void)
{
 switch(motor_manager_state)
 {
 case MOTOR_INIT:

 motor_manager_state = MOTOR_STANDBY;
 break;


 case MOTOR_STANDBY:
#line 50 "C:/Repository/ModSimMobot/MikroC Code/motorManager.c"
 if(inputManager_GetState() == BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }
 else if( (inputManager_GetState() == LEFT_SIGHT) || (inputManager_GetState() == NO_SIGHT) || (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_RIGHT) || (lineManager_GetState() == FULL) )
 {
 motor_manager_state = SLOW_LEFT;
 }
 else if( (inputManager_GetState() == RIGHT_SIGHT) || (lineManager_GetState() == PARTIAL_LEFT) || (lineManager_GetState() == HALF_LEFT) )
 {
 motor_manager_state = SLOW_RIGHT;
 }else{
 motor_manager_state = SLOW_LEFT;
 }



 break;

 case SLOW_LEFT:
  PORTB |= 0x04 ;
  PORTB &= ~0x08 ;
  PWM1_Set_Duty(204) ;
  PWM2_Set_Duty(204) ;

 if(inputManager_GetState() == RIGHT_SIGHT)
 {
 motor_manager_state = SLOW_RIGHT;
 }
 else if(inputManager_GetState() == BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }
 else if( (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT) ){
 motor_manager_state = LINE_RIGHT;
 }
 break;

 case SLOW_RIGHT:
  PORTB &= ~0x04 ;
  PORTB |= 0x08 ;
  PWM1_Set_Duty(204) ;
  PWM2_Set_Duty(204) ;

 if(inputManager_GetState() == LEFT_SIGHT)
 {
 motor_manager_state = SLOW_LEFT;
 }
 else if(inputManager_GetState() == BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }else if( (lineManager_GetState() == HALF_RIGHT) || (lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_RIGHT) ){
 motor_manager_state = LINE_LEFT;
 }

 break;

 case BACKWARD:
#line 114 "C:/Repository/ModSimMobot/MikroC Code/motorManager.c"
 motor_manager_state = DELAY;

 break;

 case DELAY:





  PWM1_Set_Duty(0) ;
  PWM2_Set_duty(0) ;
 Delay_ms(500);
 motor_manager_state = FAST_FORWARD;

 break;

 case FAST_FORWARD:

  PORTB |= 0x04 ;
  PORTB |= 0x08 ;
  PWM1_Set_Duty(255) ;
  PWM2_Set_Duty(255) ;


 if(inputManager_GetState() == BOTH_SIGHT && (lineManager_GetState() == NO_LINE))
 {
 motor_manager_state = FAST_FORWARD;
 }else if( (inputManager_GetState()) == BOTH_SIGHT && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
 || (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
 {
 motor_manager_state = LINE_BACKWARD;
 }
 else if( (inputManager_GetState() == NO_SIGHT) && (lineManager_GetState() == NO_LINE) ){
 motor_manager_state = MOTOR_STANDBY;
 }else if(inputManager_GetState() == LEFT_SIGHT)
 {
 motor_manager_state = SLOW_LEFT;
 }else if(inputManager_GetState() == RIGHT_SIGHT)
 {
 motor_manager_state = SLOW_RIGHT;
 }else if( (inputManager_GetState() == NO_SIGHT) && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
 || (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
 {
 motor_manager_state = LINE_BACKWARD;
 }
 break;

 case LINE_LEFT:

  PORTB |= 0x04 ;
  PORTB &= ~0x08 ;
  PWM1_Set_Duty(204) ;
  PWM2_Set_Duty(204) ;

 Delay_ms(1000);

 motor_manager_state = LINE_FORWARD;

 break;

 case LINE_RIGHT:
  PORTB &= ~0x04 ;
  PORTB |= 0x08 ;
  PWM1_Set_Duty(204) ;
  PWM2_Set_Duty(204) ;

 Delay_ms(1000);

 motor_manager_state = LINE_FORWARD;

 break;

 case LINE_FORWARD:

  PORTB |= 0x04 ;
  PORTB |= 0x08 ;
  PWM1_Set_Duty(204) ;
  PWM2_Set_Duty(204) ;

 Delay_ms(2000);

 motor_manager_state = MOTOR_STANDBY;

 break;

 case LINE_BACKWARD:

  PORTB &= ~0x04 ;
  PORTB &= ~0x08 ;
  PWM1_Set_Duty(204) ;
  PWM2_Set_Duty(204) ;

 Delay_ms(2000);

 motor_manager_state = MOTOR_STANDBY;

 break;

 default:
 break;

 }
}

void motorManager_UpdateManager2(void)
{
 switch(motor_manager_state)
 {
 case MOTOR_INIT:

 motor_manager_state = MOTOR_STANDBY;
 break;


 case MOTOR_STANDBY:
#line 236 "C:/Repository/ModSimMobot/MikroC Code/motorManager.c"
 motor_manager_state = SLOW_LEFT;

 if(inputManager_GetState() == BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }else if((inputManager_GetState() == LEFT_SIGHT) || (inputManager_GetState() == NO_SIGHT) )
 {
 motor_manager_state = SLOW_LEFT;
 }
 else if(inputManager_GetState() == RIGHT_SIGHT)
 {
 motor_manager_state = SLOW_RIGHT;
 }


 break;

 case SLOW_LEFT:
  PORTB |= 0x04 ;
  PORTB &= ~0x08 ;
  PWM1_Set_Duty(204) ;
  PWM2_Set_Duty(204) ;

 if(inputManager_GetState() == BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }else if(inputManager_GetState() == RIGHT_SIGHT)
 {
 motor_manager_state = SLOW_RIGHT;
 }

 break;

 case SLOW_RIGHT:
  PORTB &= ~0x04 ;
  PORTB |= 0x08 ;
  PWM1_Set_Duty(204) ;
  PWM2_Set_Duty(204) ;

 if(inputManager_GetState() == BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }
 else if(inputManager_GetState() == LEFT_SIGHT)
 {
 motor_manager_state = SLOW_LEFT;
 }else if(inputManager_GetState() == RIGHT_SIGHT)
 {
 motor_manager_state = SLOW_RIGHT;
 }

 break;

 case BACKWARD:






 motor_manager_state = DELAY;

 break;

 case DELAY:




 Delay_ms(500);
  PWM1_Set_Duty(0) ;
  PWM2_Set_duty(0) ;
 Delay_ms(500);

 motor_manager_state = FAST_FORWARD;

 break;

 case FAST_FORWARD:

  PORTB |= 0x04 ;
  PORTB |= 0x08 ;
  PWM1_Set_Duty(255) ;
  PWM2_Set_Duty(255) ;

 if(inputManager_GetState() == NO_SIGHT){
 motor_manager_state = MOTOR_STANDBY;
 }
 else if(inputManager_GetState() == LEFT_SIGHT)
 {
 motor_manager_state = SLOW_LEFT;
 }else if(inputManager_GetState() == RIGHT_SIGHT)
 {
 motor_manager_state = SLOW_RIGHT;
 }
 break;
 default:
 break;
 }

}
