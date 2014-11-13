Toy Robot Simulator
===================

Description
-----------
- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.
- The application can read in commands of the following form, from a file, 
  or from standard input:
  - **PLACE X,Y,F**
  - **MOVE**
  - **LEFT**
  - **RIGHT**
  - **REPORT**
  - **QUIT** (only apply to reading commands from standard input)
- **PLACE** will put the toy robot on the table in position X,Y and facing NORTH, 
  SOUTH, EAST or WEST. The first valid command to the robot is a **PLACE** command, 
  after that, any sequence of commands may be issued, in any order, including another 
  **PLACE** command. The application should discard all commands in the sequence until
  a valid **PLACE** command has been executed. The position (0,0) can be considered 
  to be the SOUTH WEST most corner.
- **MOVE** will move the toy robot one unit forward in the direction it is
  currently facing.
- **LEFT** and **RIGHT** will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- **REPORT** will announce the X,Y and F of the robot. This can be in any form,
  but standard output is sufficient.
- **QUIT** command can be used to terminate the application gracefully when input is 
  provided via standard input.

Constraints
-----------
- The toy robot must not fall off the table during movement. This also includes the 
  initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.

Requirements
------------
- Ruby 2.1+
- RSpec 3.1+
- Bundler 1.7+
- Rake 10.1+

Installation
------------
- Checkout the source run the folllwing from project's root directory:
  - rake install

Execution
---------
- Run the folllwing from project's root directory:
  - toy_robot *[input_file_path]*
  - *[input_file_path]* is for reading input commands from a file. It is optional.

Tests
---------
- Run the folllwing from project's root directory:
  - rake spec