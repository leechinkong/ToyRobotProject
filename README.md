Toy Robot Simulator
===================

Description
-----------
- The application is a simulation of a toy robot moving on a square tabletop of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.
- The application can read the following commands, from a file, or from standard input. 
  - **PLACE X,Y,F**
  - **MOVE**
  - **LEFT**
  - **RIGHT**
  - **REPORT**
  - **QUIT** (only apply to reading commands from standard input)
- **PLACE** will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The first valid command to the robot is a **PLACE** command, after that, any sequence of commands may be issued, in any order, including another **PLACE** command. The application should discard all commands in the sequence until a valid **PLACE** command has been executed. The position (0,0) can be considered to be the SOUTH WEST most corner.
- **MOVE** will move the toy robot one unit forward in the direction it is currently facing.
- **LEFT** and **RIGHT** will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- **REPORT** will announce the X,Y and F of the robot in standard output.
- **QUIT** command can be used to terminate the application gracefully when input is provided via standard input.

Constraints
-----------
- The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.
- Commands are case-insensitive but must follow the exact format (e.g. PLACE00NORTH, PLACE,0,0,NORTH, PLACE0,0,NORTH are invalid).

Implementation Details
----------------------
The entry point of the application is the ToyRobot module. ToyRobot does not contain any logic other than to determine if the inputs are from a file or from standard input based on the command line argument. 

The application is built based on the MVC design pattern. The RobotController class represents the Controller and it is responsible for supplying data to and querying data from the Model components for the View component to display. The Model components, the Table class, the Direction classes and the Robot class are for data manipulation and management. The View component, the RobotView class, captures commands from standard input and displays output when requested.

The reason for choosing MVC design pattern is for code reusability. For example, the View component can be enhanced to include a GUI with no changes to the Controller or Model components as required. The Model components can also be extended to persist data to a database without updating other components.

The Direction classes (North, East, South, West) are within the Direction module and inherit the BaseDirection class. If a new direction, for example a NORTH-EAST direction is needed to enable the robot to move diagonally, a new Direction subclass can be implemented easily without impacting the implementation of the existing Direction classes.

Requirements
------------
- Ruby 2.1+
- RSpec 3.1+
- Bundler 1.7+
- Rake 10.1+

Installation
------------
- Check out the source and run the following from the project root directory:
  - rake install

Execution
---------
- Run the folllwing from the project root directory:
  - toy_robot *[input_file_path]*
  - *[input_file_path]* is for reading input commands from a file. It is optional.

License
---------
- This project is licensed under the MIT license, a copy of which can be found in the LICENSE file.