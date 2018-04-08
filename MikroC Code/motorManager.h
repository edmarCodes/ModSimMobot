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
 * LINE_LEFT - if the line sensor detect a line on the left while on SLOW_RIGHT state
 * LINE_RIGHT - if the line sensor detect a line on the right while on SLOW_LEFT state
 * LINE_FORWARD - forward motion to recover from line detection and avoid oscillation
 * LINE_BACKWARD - backward motion to recover from line detection and avoid oscillation
 */
typedef enum
{
 MOTOR_INIT=0,
 MOTOR_STANDBY=1,
 SLOW_LEFT=2,
 SLOW_RIGHT=3,
  BACKWARD=4,
  DELAY=5,
  FAST_FORWARD=6,
  LINE_LEFT=7,
  LINE_RIGHT=8,
  LINE_FORWARD=9,
  LINE_BACKWARD=10
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

//motor A is the right side wheels
//motor B is the left side wheels
/*MOTOR_MANAGER_H*/