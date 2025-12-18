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

