#ifndef INPUT_MANAGER_H_
#define INPUT_MANAGER_H_

/**
 * @brief States of the input manager
 * NO_SIGHT - if the proximity sensor dont see any object
 * LEEFT_SIGHT - proximity sensors left eye see an object
 * RIGHT_SIGHT - proximity sensors right eye see an object
 * BOTH_SIGHT - both eyes of the proximity sensor see an object
 * 
 */
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




#define inputManager_GetSensorBoolLeft()       PORTB.f4 // assign the pin for the left eye of the sensor
#define inputManager_GetSensorBoolRight()      PORTB.f5 // assign the pin for the right eye of the sensor

#define inputManager_SensorAOn() PORTB |= 0x01 // LED_A on
#define inputManager_SensorAOff() PORTB &= ~0x01 // LED_A off

#define inputManager_SensorBOn() PORTB |= 0x02 // LED_B on
#define inputManager_SensorBOff() PORTB &= ~0x02 // LED_B off

#endif

/* INPUT_MANAGER_H */