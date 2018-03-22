#line 1 "C:/Users/Edmar/Documents/School Related/ModSim/Sir ran/motorManager.c"
#line 1 "c:/users/edmar/documents/school related/modsim/sir ran/motormanager.h"



typedef enum
{
 MOTOR_INIT=0,
 MOTOR_OFF=1,
 SLOW_LEFT=2,
 SLOW_RIGHT=3,

 BACKWARD=4,
 DELAY=5,
 FAST_FORWARD=6
}motor_manager_state_t;

motor_manager_state_t motorManager_GetState(void);
void motorManager_Init(void);
void motorManager_UpdateManager(void);

void motorManager_UpdateManager2(void);
#line 1 "c:/users/edmar/documents/school related/modsim/sir ran/inputmanager.h"
#line 1 "c:/users/edmar/documents/school related/modsim/sir ran/macro.h"
#line 6 "c:/users/edmar/documents/school related/modsim/sir ran/inputmanager.h"
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
#line 5 "C:/Users/Edmar/Documents/School Related/ModSim/Sir ran/motorManager.c"
 motor_manager_state_t motor_manager_state = MOTOR_INIT;


 motor_manager_state_t motorManager_GetState(void)
 {
 return motor_manager_state;
 }
void motorManager_Init(void)
{

}

void motorManager_UpdateManager(void)
{
 switch(motor_manager_state)
 {
 case MOTOR_INIT:

 motor_manager_state = MOTOR_OFF;
 break;


 case MOTOR_OFF:

 PORTB &= ~0x04;
 PORTB &= ~0x08;
 PWM1_Set_Duty(0);
 PWM2_Set_Duty(0);

 if(inputManager_GetState() ==LEFT_SIGHT)
 {
 motor_manager_state = SLOW_LEFT;
 }
 else if(inputManager_GetState() ==RIGHT_SIGHT)
 {
 motor_manager_state = SLOW_RIGHT;
 }
 else if(inputManager_GetState() ==BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }


 break;

 case SLOW_LEFT:

 PORTB &= ~0x04;
 PORTB &= ~0x08;
 PWM1_Set_Duty(51);
 PWM2_Set_Duty(51);

 if(inputManager_GetState() ==NO_SIGHT)
 {
 motor_manager_state = MOTOR_OFF;
 }
 else if(inputManager_GetState() ==RIGHT_SIGHT)
 {
 motor_manager_state = SLOW_RIGHT;
 }
 else if(inputManager_GetState() ==BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }
 break;

 case SLOW_RIGHT:

 PORTB |= 0x04;
 PORTB |= 0x08;
 PWM1_Set_Duty(51);
 PWM2_Set_Duty(51);

 if(inputManager_GetState() ==NO_SIGHT)
 {
 motor_manager_state = MOTOR_OFF;
 }
 else if(inputManager_GetState() ==LEFT_SIGHT)
 {
 motor_manager_state = SLOW_LEFT;
 }
 else if(inputManager_GetState() ==BOTH_SIGHT)
 {
 motor_manager_state = BACKWARD;
 }



 break;


 case BACKWARD:

 PORTB &= ~0x04;
 PORTB |= 0x08;
 PWM1_Set_Duty(128);
 PWM2_Set_Duty(128);


 motor_manager_state = DELAY;

 break;

 case DELAY:

 PORTB &= ~0x04;
 PORTB |= 0x08;


 Delay_ms(1000);
 PWM1_Set_Duty(0);
 PWM2_Set_Duty(0);
 Delay_ms(1500);

 motor_manager_state = FAST_FORWARD;

 break;

 case FAST_FORWARD:

 PORTB |= 0x04;
 PORTB &= ~0x08;
 PWM1_Set_Duty(255);
 PWM2_Set_Duty(255);

 if(inputManager_GetState() ==NO_SIGHT)
 {
 motor_manager_state = MOTOR_OFF;
 }

 break;

 default:
 break;



 }
}

void motorManager_UpdateManager2(void)
{
#line 176 "C:/Users/Edmar/Documents/School Related/ModSim/Sir ran/motorManager.c"
 PORTB |= 0x04;
 PORTB &= ~0x08;
 PWM1_Set_Duty(204);
 PWM2_Set_Duty(204);

 DELAY_MS(3000);

 PORTB &= ~0x04;
 PORTB |= 0x08;
 PWM1_Set_Duty(204);
 PWM2_Set_Duty(204);

 DELAY_MS(3000);



}
