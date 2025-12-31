# frozen_string_literal: false

require_relative '../lib/chess_board'
require_relative '../lib/chess_pieces'

ChessBoard.new.print_board

pieces = [Pawn, Rook, Horse, Bishop, King, Queen]

pieces.each do |piece|
  a = piece.new('black')
  puts "#{a.role}:#{a.character} "
end

pieces.each do |piece|
  a = piece.new('white')
  puts "#{a.role}:#{a.character} "
end

hash = [{ Pawn => [1, 2] }]
hash[0].each_key { |key| p key.new('white') }

a = ChessBoard.new
a.print_board
a.set_to_default
a.print_board
a.move([1, 0], [3, 0])
a.print_board
p a.valid?([3, 0], [6, 0])

p a.valid?([3, 0], [4, 0])
p a.valid?([3, 0], [5, 0])
p a.valid?([1, 3], [3, 3])

a.print_board
p a.valid?([7, 6], [5, 5])
