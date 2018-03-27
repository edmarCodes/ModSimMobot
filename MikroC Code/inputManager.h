#ifndef INPUT_MANAGER_H_
#define INPUT_MANAGER_H_

#include "macro.h"

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




#define inputManager_GetSensorBoolLeft()       PORTB.f4
#define inputManager_GetSensorBoolRight()      PORTB.f5

#define inputManager_SensorAOn() PORTB |= 0x01
#define inputManager_SensorAOff() PORTB &= ~0x01

#define inputManager_SensorBOn() PORTB |= 0x02
#define inputManager_SensorBOff() PORTB &= ~0x02

#endif

/* INPUT_MANAGER_H */