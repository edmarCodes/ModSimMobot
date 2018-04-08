#line 1 "C:/Repository/ModSimMobot/MikroC Code/lineManager.c"
#line 1 "c:/repository/modsimmobot/mikroc code/linemanager.h"
#line 13 "c:/repository/modsimmobot/mikroc code/linemanager.h"
typedef enum{
 NO_LINE = 0,
 PARTIAL_LEFT = 1,
 PARTIAL_RIGHT = 2,
 HALF_LEFT = 3,
 HALF_RIGHT = 4,
 FULL = 5
}line_manager_state_t;

line_manager_state_t lineManager_GetState(void);
void lineManager_Init(void);

void lineManager_UpdateManager(void);
#line 1 "c:/repository/modsimmobot/mikroc code/macro.h"
#line 4 "C:/Repository/ModSimMobot/MikroC Code/lineManager.c"
line_manager_state_t line_manager_state = NO_LINE;
#line 11 "C:/Repository/ModSimMobot/MikroC Code/lineManager.c"
line_manager_state_t lineManager_GetState(void)
{
return line_manager_state;
}
#line 20 "C:/Repository/ModSimMobot/MikroC Code/lineManager.c"
void lineManager_Init(void)
{
}
#line 28 "C:/Repository/ModSimMobot/MikroC Code/lineManager.c"
void lineManager_UpdateManager(void)
{

 switch(line_manager_state)
 {

 case NO_LINE:

 if( ( !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_LEFT;
 }else if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_RIGHT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && (! !PORTD.f7 ))
 {
 line_manager_state = HALF_LEFT;
 }else if( (! !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = HALF_RIGHT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = FULL;
 }

 break;

 case PARTIAL_LEFT:

 if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = NO_LINE;
 }else if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_RIGHT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = HALF_LEFT;
 }else if( (! !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = HALF_RIGHT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = FULL;
 }

 break;

 case PARTIAL_RIGHT:

 if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = NO_LINE;
 }else if( ( !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_LEFT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = HALF_LEFT;
 }else if( (! !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = HALF_RIGHT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = FULL;
 }

 break;

 case HALF_LEFT:

 if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = NO_LINE;
 }else if( ( !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_LEFT;
 }else if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_RIGHT;
 }else if( (! !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = HALF_RIGHT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = FULL;
 }

 break;

 case HALF_RIGHT:

 if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = NO_LINE;
 }else if( ( !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_LEFT;
 }else if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_RIGHT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = HALF_LEFT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = FULL;
 }

 break;

 case FULL:

 if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = NO_LINE;
 }else if( ( !PORTD.f5 ) && (! !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_LEFT;
 }else if( (! !PORTD.f5 ) && (! !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = PARTIAL_RIGHT;
 }else if( ( !PORTD.f5 ) && ( !PORTD.f6 ) && (! !PORTD.f7 ) )
 {
 line_manager_state = HALF_LEFT;
 }else if( (! !PORTD.f5 ) && ( !PORTD.f6 ) && ( !PORTD.f7 ) )
 {
 line_manager_state = HALF_RIGHT;
 }

 break;

 default:
 break;
 }
}
