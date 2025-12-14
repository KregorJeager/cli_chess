# frozen_string_literal: false

# Pawn
class Pawn
  attr_reader :role, :character

  def initialize
    @role = 'pawn'
    @character = "\u265F "
  end
end
