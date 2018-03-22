#ifndef MOTOR_MANAGER_H_
#define MOTOR_MANAGER_H_

typedef enum
{
 MOTOR_INIT=0,
 MOTOR_OFF=1,
 SLOW_LEFT=2,
 SLOW_RIGHT=3,
//  SLOW_FORWARD,
  BACKWARD=4,
  DELAY=5,
  FAST_FORWARD=6
}motor_manager_state_t;

motor_manager_state_t motorManager_GetState(void);
void motorManager_Init(void);
void motorManager_UpdateManager(void);

void motorManager_UpdateManager2(void);

#define motorManager_MotorAMoveC()    PORTB |= 0x04

#define motorManager_MotorAMoveCW()   PORTB &= ~0x04

#define motorManager_MotorAMoveSlow()  PWM1_Set_Duty(51)
#define motorManager_MotorAMoveSlowBackward()  PWM1_Set_Duty(128)
#define motorManager_MotorAMoveFast()  PWM1_Set_Duty(255)

#define motorManager_MotorBMoveC()    PORTB |= 0x08
#define motorManager_MotorBMoveCW()   PORTB &= ~0x08

#define motorManager_MotorBMoveSlow()   PWM2_Set_Duty(51)
#define motorManager_MotorBMoveSlowBackward()  PWM2_Set_Duty(128)
#define motorManager_MotorBMoveFast()   PWM2_Set_Duty(255)

#endif

/*MOTOR_MANAGER_H*/