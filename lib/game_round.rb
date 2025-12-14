# frozen_string_literal: false

require_relative 'chess_board'
# Responsible for running one round of chess.
class GameRound
  def initialize
    @chess_board = ChessBoard.new
    @player_turn = 'white'
  end

  def play_round
    instruction
    until check?
      @chess_board.print_board
      # player_move
      @player_turn = @player_turn == 'white' ? 'black' : 'white'
      # save_option
    end
  end

  def instruction
    puts 'Instruction goes here'
  end
end
