# frozen_string_literal: false

require_relative 'chess_board'
require 'pry-byebug'
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

  def game_loop
    @chess_board.set_to_default
    turn = 'white'
    loop do
      make_move(turn)
      turn = turn == 'white' ? 'black' : 'white'
    end
  end

  def make_move(team)
    stat = false
    loop do
      @chess_board.print_board
      print "[#{team} to move] input here ->"
      filtered = filter_input(gets.chomp)
      stat = @chess_board.valid?(filtered[0], filtered[1])
      own_piece = team == @chess_board.board[filtered[0][0]][filtered[0][1]].team if stat
      next unless stat == true && own_piece && !@chess_board.check?(team)

      @chess_board.move(filtered[0], filtered[1])

      break
    end
  end

  def filter_input(input)
    if coordinate_format?(input)
      input = input.split('|')
      return [input[0].split(',').map!(&:to_i), input[1].split(',').map!(&:to_i)]
    end
    p input
    input
  end

  def coordinate_format?(str)
    return false unless str.length == 7

    coor?(str[0]) && str[1] == ',' && coor?(str[2]) && str[3] == '|' &&
      coor?(str[4]) && str[5] == ',' && coor?(str[6])
  end

  def coor?(str)
    %w[0 1 2 3 4 5 6 7].include?(str)
  end
end
