# frozen_string_literal: false

require './lib/chess_cop_module'
# board
class ChessBoard
  include ChessCop
  def initialize
    @board = Array.new(8) { Array.new(8) { nil } }
  end

  def print_board
    puts '  0   1   2   3   4   5   6   7'
    @board.each_index do |i|
      line = []
      @board[i].each do |j|
        line << (j.nil? ? '[  ]' : "[#{j.character} ]")
      end
      puts "#{i}#{line.join('')}"
    end
  end

  def set_to_default
    @board = Array.new(8) { Array.new(8) { nil } }
    white = white_default_values
    black = black_defaul_values
    init_pieces(white, 'white')
    init_pieces(black, 'black')
  end

  def move(cur, new)
    @board[new[0]][new[1]] = @board[cur[0]][cur[1]]
    @board[cur[0]][cur[1]] = nil
  end

  def valid?(cur, new)
    return false if curr == new
    return false if new[0] > 7 || new[0].negative? || new[1] > 7 || new[1].negative?
    return false if @board[cur[0]][cur[1]].nil?
    return pawn(cur, new, @board[cur[0]][cur[1]]) if @board[cur[0]][cur[1]].role == 'pawn'

    path = get_path_pos(cur, new)
    stat = true
    path.each { |pos| stat = false unless @board[pos[0]][pos[1]].nil? }
    stat
  end

  private

  def pawn(cur, new, piece)
    team = piece.team == 'white' ? 1 : -1
    if cur[0] == 1 && team == 1 || cur[0] == 6 && team == -1
      [[cur[0] + 2 * team, cur[1]], [cur[0] + 1 * team, cur[1]]].include?(new)
    else
      [[cur[0] + 1 * team, cur[1]]].include?(new)
    end
  end

  def knight(cur, new)
  end

  def init_pieces(values, team)
    values.each_index do |i|
      values[i].each_key do |key|
        values[i][key].each { |pos| @board[pos[0]][pos[1]] = key.new(team) }
      end
    end
  end

  def white_default_values
    pawns = Array.new(8)
    pawns.each_index { |i| pawns[i] = [1, i] }
    [{ Pawn => pawns },
     { Rook => [[0, 0], [0, 7]] },
     { Horse => [[0, 1], [0, 6]] },
     { Bishop => [[0, 2], [0, 5]] },
     { King => [[0, 3]] },
     { Queen => [[0, 4]] }]
  end

  def black_defaul_values
    pawns = Array.new(8)
    pawns.each_index { |i| pawns[i] = [6, i] }
    [{ Pawn => pawns },
     { Rook => [[7, 0], [7, 7]] },
     { Horse => [[7, 1], [7, 6]] },
     { Bishop => [[7, 2], [7, 5]] },
     { King => [[7, 3]] },
     { Queen => [[7, 4]] }]
  end
end
