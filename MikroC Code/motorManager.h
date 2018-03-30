#ifndef MOTOR_MANAGER_H_
#define MOTOR_MANAGER_H_

/**
 * @brief Motor Manager States
 * MOTOR_INIT - initialize the motor
 * MOTOR_OFF - off the motor
 * SLOW_LEFT - turn left at 80% speed
 * SLOW_RIGHT - turn right at 80% speed
 * BACKWARD - backward motion
 * DELAY - preparation for the attack
 * FAST_FORWARD - forward motion with 100% speed
 * FAST_RIGHT - turn right at 100% speed
 * FAST_LEFT - turn left at 100% speed
 * 
 */
typedef enum
{
 MOTOR_INIT=0,
 MOTOR_OFF=1,
 SLOW_LEFT=2,
 SLOW_RIGHT=3,
  BACKWARD=4,
  DELAY=5,
  FAST_FORWARD=6,
  FAST_RIGHT = 7,
  FAST_LEFT = 8
}motor_manager_state_t;

motor_manager_state_t motorManager_GetState(void);
void motorManager_Init(void);
void motorManager_UpdateManager(void);

void motorManager_UpdateManager2(void);

#define motorManager_MotorAMoveForward()    PORTB |= 0x04 // define motor A to move forward

#define motorManager_MotorAMoveBackward()   PORTB &= ~0x04 // define motor A to move backward

#define motorManager_MotorAMoveSlow()  PWM1_Set_Duty(204) // set the speed of the motor A at 80%
#define motorManager_MotorAMoveSlowBackward()  PWM1_Set_Duty(204) // set the speed of the motor A at 80%
#define motorManager_MotorAMoveFast()  PWM1_Set_Duty(255) // set the speed of the motor A at 100%

#define motorManager_MotorBMoveForward()    PORTB |= 0x08 // define motor B to move forward
#define motorManager_MotorBMoveBackward()   PORTB &= ~0x08 // define motor B to move backward

#define motorManager_MotorBMoveSlow()   PWM2_Set_Duty(204) // set the speed of the motor B at 80%
#define motorManager_MotorBMoveSlowBackward()  PWM2_Set_Duty(204) // set the speed of the motor B at 80%
#define motorManager_MotorBMoveFast()   PWM2_Set_Duty(255) // set the speed of the motor B at 100%

#define motorManager_MotorAOff() PWM1_Set_Duty(0) // set the speed of the motor A at 0 - off
#define motorManager_MotorBOff() PWM2_Set_duty(0) // set the speed of the motor B at 0 - off

#endif

/*MOTOR_MANAGER_H*/