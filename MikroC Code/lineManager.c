#include "lineManager.h"
#include "macro.h"

line_manager_state_t line_manager_state = NO_LINE;

line_manager_state_t lineManager_GetState(void)
{
return line_manager_state;
}

void lineManager_Init(void)
{
}

void lineManager_UpdateManager(void)
{

     switch(line_manager_state)
     {
     
         case NO_LINE:
         
             if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_LEFT;
             }else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_RIGHT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_LEFT;
             }else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_RIGHT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = FULL;
             }
             
         break;
         
         case PARTIAL_LEFT:
         
              if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
              {
                line_manager_state = NO_LINE;
             }else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_RIGHT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_LEFT;
             }else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_RIGHT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = FULL;
             }
             
         break;
         
         case PARTIAL_RIGHT:
         
              if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
              {
                line_manager_state = NO_LINE;
             }else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_LEFT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_LEFT;
             }else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_RIGHT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = FULL;
             }

         break;
         
         case HALF_LEFT:

              if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
              {
                line_manager_state = NO_LINE;
             }else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_LEFT;
             }else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_RIGHT;
             }else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_RIGHT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = FULL;
             }

         break;
         
         case HALF_RIGHT:

              if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
              {
                line_manager_state = NO_LINE;
             }else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_LEFT;
             }else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_RIGHT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_LEFT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = FULL;
             }

         break;
         
         case FULL:

             if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = NO_LINE;
             }else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_LEFT;
             }else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = PARTIAL_RIGHT;
             }else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_LEFT;
             }else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
             {
                line_manager_state = HALF_RIGHT;
             }

         break;
         
         default:
              line_manager_state = NO_LINE;
         break;
     }
}