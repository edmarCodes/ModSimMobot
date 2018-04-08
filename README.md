
# Mobot
## v0.4
- Integrating all the managers together
- Test the code on hardware and change the states base on results
- Modify state table on motor manager
- Add new states on motor manager (LINE_LEFT, LINE_RIGHT, LINE_BACKWARD, LINE_FORWARD) to deal with line sensors
- Modify the code base on the new state table
- uart_Debug_Update() function call on infinite loop in Sumobot_simple.c is just for debugging purposes, it can be used on simulation using Proteus. Comment that line to remove the delay for the action of each manager if you will test the code on actual sumobot.
- Add an action when motor manager was on Standby mode, it should go to state SLOW_LEFT and search for an opponent by turning slowly turning left.
- Added parenthesis on conditions for compiler readability.
## v0.3
- Define line tracer manager
- Modify state table for motor manager, integrating line manager
- Define new states on motor manager (fast_right and fast_left)
- Modify uart_debug.c, integrating line manager
- Modify simple_sumobot.c
- Added comments on the code
## v0.2
- Define macros on each manager.h
- Replace speed of motor, move slow is now 80%(204) and move fast is still 100%(255). no medium speed
## v0.1
- Initial Code
- Final Project for ModSim
