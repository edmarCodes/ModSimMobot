
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
        inputManager_SensorAOn();
      }
      else
      {
          inputManager_SensorAOff();
      }
      

      if( inputManager_GetSensorBoolRight())
      {
        inputManager_SensorBOn();
      }
      else
      {
          inputManager_SensorBOff();
      }


}



void inputManager_UpdateManager(void)
{
     switch(input_manager_state)
     {

      case NO_SIGHT:

      inputManager_SensorAOff();
      inputManager_SensorBOff();
      
      if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = LEFT_SIGHT;
            inputManager_SensorAOn();
      }
      else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
           input_manager_state = RIGHT_SIGHT;
           inputManager_SensorBOn();
      }
      break;
      
      case LEFT_SIGHT:
      
      
      if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = NO_SIGHT;
            
            inputManager_SensorBOff();
            inputManager_SensorAOff();
            
      }
      else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
            input_manager_state = RIGHT_SIGHT;
            
            inputManager_SensorBOn();
            inputManager_SensorAOff();
            
      }
      else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
           input_manager_state = BOTH_SIGHT;
           inputManager_SensorBOn();
           inputManager_SensorAOn();
           
      }
      
      break;
      
      
      case RIGHT_SIGHT:
      
      
      if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = NO_SIGHT;
            inputManager_SensorBOff();
            inputManager_SensorAOff();
      }
      else if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = LEFT_SIGHT;
            inputManager_SensorBOff();
            inputManager_SensorAOn();
      }
      else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
           input_manager_state = BOTH_SIGHT;
           inputManager_SensorBOn();
           inputManager_SensorAOn();
      }
      
      break;
      
      case BOTH_SIGHT:
      
      if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
            input_manager_state = LEFT_SIGHT;
            inputManager_SensorBOff();
            inputManager_SensorAOn();
      }
      else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
      {
           input_manager_state = RIGHT_SIGHT;
           inputManager_SensorBOn();
           inputManager_SensorAOff();
      }
      else if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
      {
           input_manager_state = NO_SIGHT;
           inputManager_SensorBOff();
           inputManager_SensorAOff();
           #if 1
           PORTB |= 0x02;
           PORTB |= 0x01;
           #endif
      }
      break;
      
      default:
              input_manager_state = NO_SIGHT;
              inputManager_SensorBOff();
              inputManager_SensorAOff();
              break;
     }


}