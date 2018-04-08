
#include "inputManager.h"
#include "macro.h"

input_manager_state_t input_manager_state = NO_SIGHT; // initial state of the input manager

/**
 * @brief  return the current state of the input manager
 * 
 * @return input_manager_state_t 
 */
input_manager_state_t inputManager_GetState(void)
{
 return input_manager_state;
}

/**
 * @brief initialize input manager
 * 
 */
void inputManager_Init(void)
{
}

/**
 * @brief This function is for debugging purposes only
 * 
 */
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


/**
 * @brief Get the input manager state, then check for the sensors and assign the current manager state
 * 
 */
void inputManager_UpdateManager(void)
{
     switch(input_manager_state)
     {

      case NO_SIGHT:

      inputManager_SensorAOff();
      inputManager_SensorBOff();
      
      if((inputManager_GetSensorBoolLeft()) && (!inputManager_GetSensorBoolRight()))
      {
            input_manager_state = LEFT_SIGHT;
            inputManager_SensorAOn();
      }
      else if((!inputManager_GetSensorBoolLeft()) && (inputManager_GetSensorBoolRight()))
      {
           input_manager_state = RIGHT_SIGHT;
           inputManager_SensorBOn();
      }else if((inputManager_GetSensorBoolLeft()) && (inputManager_GetSensorBoolRight()))
      {
           input_manager_state = BOTH_SIGHT;
           inputManager_SensorAOn();
           inputManager_SensorBOn();
      }
      break;
      
      case LEFT_SIGHT:
      
      
      if((!inputManager_GetSensorBoolLeft()) && (!inputManager_GetSensorBoolRight()))
      {
            input_manager_state = NO_SIGHT;
            
            inputManager_SensorBOff();
            inputManager_SensorAOff();
            
      }
      else if((!inputManager_GetSensorBoolLeft()) && (inputManager_GetSensorBoolRight()))
      {
            input_manager_state = RIGHT_SIGHT;
            
            inputManager_SensorBOn();
            inputManager_SensorAOff();
            
      }
      else if((inputManager_GetSensorBoolLeft()) && (inputManager_GetSensorBoolRight()))
      {
           input_manager_state = BOTH_SIGHT;
           inputManager_SensorBOn();
           inputManager_SensorAOn();
      }
      
      break;
      
      
      case RIGHT_SIGHT:
      
      
      if((!inputManager_GetSensorBoolLeft()) && (!inputManager_GetSensorBoolRight()))
      {
            input_manager_state = NO_SIGHT;
            inputManager_SensorBOff();
            inputManager_SensorAOff();
      }
      else if((inputManager_GetSensorBoolLeft()) && (!inputManager_GetSensorBoolRight()))
      {
            input_manager_state = LEFT_SIGHT;
            inputManager_SensorBOff();
            inputManager_SensorAOn();
      }
      else if((inputManager_GetSensorBoolLeft()) && (inputManager_GetSensorBoolRight()))
      {
           input_manager_state = BOTH_SIGHT;
           inputManager_SensorBOn();
           inputManager_SensorAOn();
      }
      
      break;
      
      case BOTH_SIGHT:
      
      if((inputManager_GetSensorBoolLeft()) && (!inputManager_GetSensorBoolRight()))
      {
            input_manager_state = LEFT_SIGHT;
            inputManager_SensorBOff();
            inputManager_SensorAOn();
      }
      else if((!inputManager_GetSensorBoolLeft()) && (inputManager_GetSensorBoolRight()))
      {
           input_manager_state = RIGHT_SIGHT;
           inputManager_SensorBOn();
           inputManager_SensorAOff();
      }
      else if((!inputManager_GetSensorBoolLeft()) && (!inputManager_GetSensorBoolRight()))
      {
           input_manager_state = NO_SIGHT;
           inputManager_SensorBOff();
           inputManager_SensorAOff();
      }
      break;
      
      default:
              input_manager_state = NO_SIGHT;
              inputManager_SensorBOff();
              inputManager_SensorAOff();
              break;
     }


}