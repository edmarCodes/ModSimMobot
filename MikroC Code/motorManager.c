
#include "motorManager.h"
#include "inputManager.h"

 motor_manager_state_t motor_manager_state =  MOTOR_INIT;
 
 
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
    
         motor_manager_state =  MOTOR_OFF;
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
          PWM1_Set_Duty(204);
          PWM2_Set_Duty(204);

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
          
    case  SLOW_RIGHT:
    
         PORTB |= 0x04;
         PORTB |= 0x08;
          PWM1_Set_Duty(204);
          PWM2_Set_Duty(204);

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
          
          
    case  BACKWARD:

         PORTB &= ~0x04;
         PORTB |= 0x08;
          PWM1_Set_Duty(204);
          PWM2_Set_Duty(204);


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

        // PORTB &= ~0x04;
        // PORTB &= ~0x08;
         #if 0
         if(inputManager_GetSensorBoolRight()){
              PORTB |= 0x04;    //forward
         PORTB |= 0x08;                  //forward
          PWM1_Set_Duty(255);     //speed
          PWM2_Set_Duty(255);            //speed
         }else{
           PORTB &= ~0x04;      //backward
           PORTB &= ~0x08;                //backward
          PWM1_Set_Duty(255);       //speed
          PWM2_Set_Duty(255);              //speed
         }
          #endif

         #if 0
          DELAY_MS(3000);
          
         PORTB &= ~0x04;
         PORTB &= ~0x08;
          PWM1_Set_Duty(255);
          PWM2_Set_Duty(255);
          
          DELAY_MS(3000);
         #endif
         

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
          

          //motorManager_MotorAMoveC();
}