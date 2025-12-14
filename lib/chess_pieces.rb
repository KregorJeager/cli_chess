# frozen_string_literal: false

# Pawn
class Pawn
  attr_reader :role, :character

  def initialize(team)
    @role = 'pawn'
    @team = team
    @character = "\u265F "
  end
end
