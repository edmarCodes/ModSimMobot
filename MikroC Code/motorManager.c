
#include "motorManager.h"
#include "inputManager.h"
#include "lineManager.h"

 motor_manager_state_t motor_manager_state =  MOTOR_INIT; // initial state of the motor manager
 
 /**
  * @brief get the current state of the motor manager
  * 
  * @return motor_manager_state_t 
  */
 motor_manager_state_t motorManager_GetState(void)
 {
  return motor_manager_state;
 }

 /**
  * @brief initialize motor manager
  * 
  */
void motorManager_Init(void)
{

}

/**
 * @brief Get the motor manager state, then check for the sensors state, decide motor managers move and assign the current manager state
 * 
 */
void motorManager_UpdateManager(void)
{
 switch(motor_manager_state)
 {
    case MOTOR_INIT:
    
         motor_manager_state =  MOTOR_STANDBY;
         break;
         
         
    case MOTOR_STANDBY:
         /*
         motorManager_MotorAMoveBackward();
         motorManager_MotorBMoveBackward();
         motorManager_MotorAOff();
         motorManager_MotorBOff();*/
          
          if(inputManager_GetState() == LEFT_SIGHT || inputManager_GetState() == NO_SIGHT)
          {
               motor_manager_state = SLOW_LEFT;
          }
          else if(inputManager_GetState() == RIGHT_SIGHT)
          {
               motor_manager_state = SLOW_RIGHT;
          }
          else if(inputManager_GetState() == BOTH_SIGHT)
          {
               motor_manager_state = BACKWARD;
          }


         break;
         
    case SLOW_LEFT:
         motorManager_MotorAMoveForward();
         motorManager_MotorBMoveBackward();
         motorManager_MotorAMoveSlow();
         motorManager_MotorBMoveSlow();

          if(inputManager_GetState() == RIGHT_SIGHT)
          {
                 motor_manager_state = SLOW_RIGHT;
          }
          else if(inputManager_GetState() == BOTH_SIGHT)
          {
                  motor_manager_state = BACKWARD;
          }else if(lineManager_GetState() == HALF_LEFT || lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_LEFT){
                  motor_manager_state = LINE_RIGHT;
          }
         break;
          
    case  SLOW_RIGHT:
         motorManager_MotorAMoveBackward();
         motorManager_MotorBMoveForward();
         motorManager_MotorAMoveSlow();
         motorManager_MotorBMoveSlow();

         if(inputManager_GetState() == LEFT_SIGHT)
         {
               motor_manager_state = SLOW_LEFT;
         }
         else if(inputManager_GetState() == BOTH_SIGHT)
         {
                  motor_manager_state = BACKWARD;
         }else if(lineManager_GetState() == HALF_RIGHT || lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_RIGHT){
                  motor_manager_state = LINE_LEFT;
         }
         
         break;
         
    case  BACKWARD:
    
         motorManager_MotorAMoveBackward();
         motorManager_MotorBMoveBackward();
         motorManager_MotorAMoveSlow();
         motorManager_MotorBMoveSlow();

         motor_manager_state = DELAY;

         break;
          
    case DELAY:

         motorManager_MotorAMoveBackward();
         motorManager_MotorBMoveBackward();

         Delay_ms(1000);
         motorManager_MotorAOff();
         motorManager_MotorBOff();
         Delay_ms(1500);

         motor_manager_state = FAST_FORWARD;

         break;
         
    case FAST_FORWARD:

         motorManager_MotorAMoveForward();
         motorManager_MotorBMoveForward();
         motorManager_MotorAMoveFast();
         motorManager_MotorBMoveFast();
          
         if(inputManager_GetState() == NO_SIGHT && lineManager_GetState() == NO_LINE){
            motor_manager_state = MOTOR_STANDBY;
         }else if(inputManager_GetState() == LEFT_SIGHT)
         {
            motor_manager_state = SLOW_LEFT;
         }else if(inputManager_GetState() == RIGHT_SIGHT)
         {
            motor_manager_state = SLOW_RIGHT;
         }else if(inputManager_GetState() == NO_SIGHT && (lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_LEFT 
         || lineManager_GetState() == PARTIAL_RIGHT || lineManager_GetState() == HALF_LEFT || lineManager_GetState() == HALF_RIGHT))
         {
            motor_manager_state = LINE_BACKWARD;
         }
          break;
   
     case LINE_LEFT:
     
         motorManager_MotorAMoveBackward();
         motorManager_MotorBMoveForward();
         motorManager_MotorAMoveSlow();
         motorManager_MotorBMoveSlow();
         
         Delay_ms(1000);
         
         motor_manager_state = LINE_FORWARD;
         
         break;

     case LINE_RIGHT:
     
         motorManager_MotorAMoveForward();
         motorManager_MotorBMoveBackward();
         motorManager_MotorAMoveSlow();
         motorManager_MotorBMoveSlow();

         Delay_ms(1000);
         
         motor_manager_state = LINE_FORWARD;
         
         break;
         
     case LINE_FORWARD:
     
          motorManager_MotorAMoveForward();
          motorManager_MotorBMoveForward();
          motorManager_MotorAMoveSlow();
          motorManager_MotorBMoveSlow();
          
          Delay_ms(1000);
          
          motor_manager_state = MOTOR_STANDBY;
          
          break;
          
     case LINE_BACKWARD:
     
          motorManager_MotorAMoveBackward();
          motorManager_MotorBMoveBackward();
          motorManager_MotorAMoveSlow();
          motorManager_MotorBMoveSlow();
          
          Delay_ms(2000);
          
          motor_manager_state = MOTOR_STANDBY;
          
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
         

          DELAY_MS(3000);
          
         PORTB &= ~0x04;
         PORTB &= ~0x08;
          PWM1_Set_Duty(255);
          PWM2_Set_Duty(255);
          
          DELAY_MS(3000);
         

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
          
         #endif
          //motorManager_MotorAMoveC();
}