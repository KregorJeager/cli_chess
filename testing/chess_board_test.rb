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
