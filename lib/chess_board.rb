# frozen_string_literal: false

require './lib/chess_cop_module'
require './lib/chess_pieces'
# board
class ChessBoard
  include ChessCop
  attr_accessor :board

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
    return false if cur == new || @board[cur[0]][cur[1]].nil? ||
                    new[0] > 7 || new[0].negative? || new[1] > 7 || new[1].negative?

    piece = @board[cur[0]][cur[1]]
    return pawn_revamp(cur, new, piece) if piece.role == 'pawn'
    return knight(cur, new) if piece.role == 'horse'
    return rook(cur, new) if piece.role == 'rook'

    path = get_path_pos(cur, new)
    return false if path.nil?

    stat = true
    path.each do |pos|
      stat = false unless @board[pos[0]][pos[1]].nil? ||
                          @board[pos[0]][pos[1]].team != @board[cur[0]][cur[0]].team
    end
    stat
  end

  private

  def path_clear?(path, team)
    p "path: #{path}"
    new = path.pop.at(0)
    return false unless @board[new[0]][new[1]].nil? || @board[new[0]][new[1]].team != team

    path.each do |pos|
      return false unless @board[pos[0]][pos[1]].nil?
    end
    true
  end

  def rook(cur, new)
    path = straight_move(cur, new)
    team = @board[cur[0]][cur[1]]
    result = path_clear?(path, team)
    p "path_clear?: #{result})}"
    result
  end

  def pawn_revamp(cur, new, piece)
    team = piece.team == 'white' ? 1 : -1
    pawn_next_moves(cur, team).include?(new)
  end

  def pawn_next_moves(cur, team)
    moves = []
    moves << [cur[0] + 1 * team, cur[1]] if @board[cur[0] + 1 * team][cur[1]].nil?
    moves << [cur[0] + 1 * team, cur[1] - 1] if enemy?([cur[0] + 1 * team, cur[1] - 1], team)
    moves << [cur[0] + 1 * team, cur[1] + 1] if enemy?([cur[0] + 1 * team, cur[1] + 1], team)
    moves << [cur[0] + 2 * team, cur[1]] if pawn_1stmove(cur, team) && @board[cur[0] + 1 * team][cur[1]].nil?
    moves
  end

  def enemy?(pos, team)
    !@board[pos[0]][ pos[1]].nil? && @board[pos[0]][ pos[1]].team != team
  end

  def pawn_1stmove(cur, team)
    return true if cur[0] == 1 && team ==  1
    return true if cur[0] == 6 && team == -1

    false
  end

  def knight(cur, new)
    p 'horse'
    [[cur[0] - 1, cur[1] - 2],
     [cur[0] + 1, cur[1] - 2],
     [cur[0] - 2, cur[1] - 1],
     [cur[0] + 2, cur[1] - 1],
     [cur[0] + 1, cur[1] + 2],
     [cur[0] - 1, cur[1] + 2],
     [cur[0] - 2, cur[1] + 1],
     [cur[0] + 2, cur[1] + 1]].include?(new) &&
      (@board[new[0]][new[1]].nil? || @board[cur[0]][cur[1]].team != @board[new[0]][new[1]].team)
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
