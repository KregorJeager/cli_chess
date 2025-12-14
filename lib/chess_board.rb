# frozen_string_literal: false

# board
class ChessBoard
  def initialize
    @board = Array.new(8) { Array.new(8) { nil } }
  end

  def print_board
    puts '  0   1   2   3   4   5   6   7'
    @board.each_index do |i|
      line = []
      @board[i].each do |j|
        line << (j.nil? ? '[  ]' : j.character)
      end
      puts "#{i}#{line.join('')}"
    end
  end
end
