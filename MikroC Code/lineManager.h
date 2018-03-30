#ifndef LINE_MANAGER_H_
#define LINE_MANAGER_H_

/**
 * @brief Line Manager states
 * NO_LINE - line managers three sensors don't see a line
 * PARTIAL_LEFT - leftmost sensor of the line manager see a line
 * PARTIAL_RIGHT - rightmost sensor of the line manager see a line
 * HALF_LEFT - leftmost plus the middle sensor see a line
 * HALF_RIGHT - rightmost plus the middle sensor see a line
 * FULL - three sensors see a line
 */
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

#define lineManager_GetLineBoolLeft()        !PORTD.f5 // Left sensor
#define lineManager_GetLineBoolMiddle()      !PORTD.f6 // Middle sensor
#define lineManager_GetLineBoolRight()       !PORTD.f7 // Right sensor

// white 0
// black 1
#endif
 /* LINE_MANAGER_H */