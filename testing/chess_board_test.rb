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
a.move([1, 1], [3, 1])
a.print_board
