# frozen_string_literal: false

require_relative 'chess_board'
# Responsible for running one round of chess.
class GameRound
  def initialize
    @chess_board = ChessBoard.new
    @player_turn = 'white'
  end
end
