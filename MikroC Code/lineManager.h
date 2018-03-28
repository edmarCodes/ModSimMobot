#ifndef LINE_MANAGER_H_
#define LINE_MANAGER_H_

#include "macro.h"

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

#define lineManager_GetLineBoolLeft()        PORTB.f6
#define lineManager_GetLineBoolRight()       PORTB.f5
#define lineManager_GetLineBoolMiddle()      PORTB.f7

#endif
 /* LINE_MANAGER_H */