
#include "inputManager.h"
#include "macro.h"
input_manager_state_t input_manager_state = NO_SIGHT;

input_manager_state_t inputManager_GetState(void)
{
 return input_manager_state;
}

void inputManager_Init(void)
{
}



void inputManager_UpdateManager2(void)
{

      if( inputManager_GetSensorBoolLeft())

      
      {
        PORTB |= 0x01;
      }
      else
      {
          PORTB &= ~0x01;
      }
      

      if( inputManager_GetSensorBoolRight())


      {
        PORTB |= 0x02;
      }
      else
      {
          PORTB &= ~0x02;
      }


}



void inputManager_UpdateManager(void)
{
     switch(input_manager_state)
     {

      case NO_SIGHT:
      
      PORTB &= ~0x01;
      PORTB &= ~0x02;
      
      if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = LEFT_SIGHT;
            PORTB |= 0x01;
      }
      else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
           input_manager_state = RIGHT_SIGHT;
           PORTB |= 0x02;
      }
      break;
      
      case LEFT_SIGHT:
      
      
      if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = NO_SIGHT;
            PORTB &= ~0x02;
            PORTB &= ~0x01;
      }
      else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
            input_manager_state = RIGHT_SIGHT;
            PORTB |= 0x02;
            PORTB &= ~0x01;
      }
      else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
           input_manager_state = BOTH_SIGHT;
            PORTB |= 0x02;
            PORTB |= 0x01;
           
      }
      
      break;
      
      
      case RIGHT_SIGHT:
      
      
      if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = NO_SIGHT;
            PORTB &= ~0x02;
            PORTB &= ~0x01;
      }
      else if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = LEFT_SIGHT;
            PORTB &= ~0x02;
            PORTB |= 0x01;
      }
      else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
           input_manager_state = BOTH_SIGHT;
           PORTB |= 0x02;
           PORTB |= 0x01;
      }
      
      break;
      
      case BOTH_SIGHT:
      
      if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = LEFT_SIGHT;
            PORTB &= ~0x02;
            PORTB |= 0x01;
      }
      else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
           input_manager_state = RIGHT_SIGHT;
           PORTB |= 0x02;
           PORTB &= ~0x01;
      }
      else if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
           input_manager_state = NO_SIGHT;
                      PORTB |= 0x02;
           PORTB |= 0x01;
      }
      break;
      
      default:
              input_manager_state = NO_SIGHT;
                         PORTB &= ~0x02;
           PORTB &= ~0x01;
               break;
     }


}