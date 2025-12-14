# frozen_string_literal: false

# board
class ChessBoard
  def initialize
    @board = Array.new(8) { Array.new(8) { '[ ]' } }
  end

  def print_board
    @board.each do |i|
      puts i.join('')
    end
  end
end
