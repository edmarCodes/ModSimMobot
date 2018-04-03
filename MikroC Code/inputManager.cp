#line 1 "C:/Repository/ModSimMobot/MikroC Code/inputManager.c"
#line 1 "c:/repository/modsimmobot/mikroc code/inputmanager.h"
#line 12 "c:/repository/modsimmobot/mikroc code/inputmanager.h"
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
#line 1 "c:/repository/modsimmobot/mikroc code/macro.h"
#line 5 "C:/Repository/ModSimMobot/MikroC Code/inputManager.c"
input_manager_state_t input_manager_state = NO_SIGHT;
#line 12 "C:/Repository/ModSimMobot/MikroC Code/inputManager.c"
input_manager_state_t inputManager_GetState(void)
{
 return input_manager_state;
}
#line 21 "C:/Repository/ModSimMobot/MikroC Code/inputManager.c"
void inputManager_Init(void)
{
}
#line 29 "C:/Repository/ModSimMobot/MikroC Code/inputManager.c"
void inputManager_UpdateManager2(void)
{

 if(  PORTB.f4 )
 {
  PORTB |= 0x01 ;
 }
 else
 {
  PORTB &= ~0x01 ;
 }


 if(  PORTB.f5 )
 {
  PORTB |= 0x02 ;
 }
 else
 {
  PORTB &= ~0x02 ;
 }


}
#line 59 "C:/Repository/ModSimMobot/MikroC Code/inputManager.c"
void inputManager_UpdateManager(void)
{
 switch(input_manager_state)
 {

 case NO_SIGHT:

  PORTB &= ~0x01 ;
  PORTB &= ~0x02 ;

 if( PORTB.f4  && ! PORTB.f5 )
 {
 input_manager_state = LEFT_SIGHT;
  PORTB |= 0x01 ;
 }
 else if(! PORTB.f4  &&  PORTB.f5 )
 {
 input_manager_state = RIGHT_SIGHT;
  PORTB |= 0x02 ;
 }else if( PORTB.f4  &&  PORTB.f5 )
 {
 input_manager_state = BOTH_SIGHT;
  PORTB |= 0x01 ;
  PORTB |= 0x02 ;
 }
 break;

 case LEFT_SIGHT:


 if(! PORTB.f4  && ! PORTB.f5 )
 {
 input_manager_state = NO_SIGHT;

  PORTB &= ~0x02 ;
  PORTB &= ~0x01 ;

 }
 else if(! PORTB.f4  &&  PORTB.f5 )
 {
 input_manager_state = RIGHT_SIGHT;

  PORTB |= 0x02 ;
  PORTB &= ~0x01 ;

 }
 else if( PORTB.f4  &&  PORTB.f5 )
 {
 input_manager_state = BOTH_SIGHT;
  PORTB |= 0x02 ;
  PORTB |= 0x01 ;
 }

 break;


 case RIGHT_SIGHT:


 if(! PORTB.f4  && ! PORTB.f5 )
 {
 input_manager_state = NO_SIGHT;
  PORTB &= ~0x02 ;
  PORTB &= ~0x01 ;
 }
 else if( PORTB.f4  && ! PORTB.f5 )
 {
 input_manager_state = LEFT_SIGHT;
  PORTB &= ~0x02 ;
  PORTB |= 0x01 ;
 }
 else if( PORTB.f4  &&  PORTB.f5 )
 {
 input_manager_state = BOTH_SIGHT;
  PORTB |= 0x02 ;
  PORTB |= 0x01 ;
 }

 break;

 case BOTH_SIGHT:

 if( PORTB.f4  && ! PORTB.f5 )
 {
 input_manager_state = LEFT_SIGHT;
  PORTB &= ~0x02 ;
  PORTB |= 0x01 ;
 }
 else if(! PORTB.f4  &&  PORTB.f5 )
 {
 input_manager_state = RIGHT_SIGHT;
  PORTB |= 0x02 ;
  PORTB &= ~0x01 ;
 }
 else if(! PORTB.f4  && ! PORTB.f5 )
 {
 input_manager_state = NO_SIGHT;
  PORTB &= ~0x02 ;
  PORTB &= ~0x01 ;
 }
 break;

 default:
 input_manager_state = NO_SIGHT;
  PORTB &= ~0x02 ;
  PORTB &= ~0x01 ;
 break;
 }


}
