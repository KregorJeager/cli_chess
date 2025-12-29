# cli_chess
A chess game that runs in the command line

What we have
 A board with methods to move pieces and init a board to starting condition
 Chess pieces with role and charater attr
 a class that runs the game

What we need
 a method to determine if a given move is valid
   This will be use to verify if the move is valid first beofre moving the piece

valid_move?(curr, new)
  first determine what kind of move the piece can make
  make a checker if the straight move is valid
  a checker when diagonal is valid. 
  and a horse

[0,0] [0,1] [0,2] [0,3] [0,4] [0,5] [0,6] [0,7]
[1,0] [1,1] [1,2] [1,3] [1,4] [1,5] [1,6] [1,7]
[2,0] [2,1] [2,2] [2,3] [2,4] [2,5] [2,6] [2,7]
[3,0] [3,1] [3,2] [3,3] [3,4] [3,5] [3,6] [3,7]
[4,0] [4,1] [4,2] [4,3] [4,4] [4,5] [4,6] [4,7]
[5,0] [5,1] [5,2] [5,3] [5,4] [5,5] [5,6] [5,7]
[6,0] [6,1] [6,2] [6,3] [6,4] [6,5] [6,6] [6,7]
[7,0] [7,1] [7,2] [7,3] [7,4] [7,5] [7,6] [7,7]

