# frozen_string_literal: false

# Pawn
class Pawn
  attr_reader :role, :character

  def initialize(team)
    @role = 'pawn'
    @team = team
    @character = team == 'white' ? "\u2659" : "\u265F"
  end
end

# Rook
class Rook
  attr_reader :role, :character

  def initialize(team)
    @role = 'rook'
    @team = team
    @character = team == 'white' ? "\u2656" : "\u265C"
  end
end

# Horse
class Horse
  attr_reader :role, :character

  def initialize(team)
    @role = 'horse'
    @team = team
    @character = team == 'white' ? "\u2658" : "\u265E"
  end
end

# Bishop
class Bishop
  attr_reader :role, :character

  def initialize(team)
    @role = 'bishop'
    @team = team
    @character = team == 'white' ? "\u2657" : "\u265D"
  end
end

# King
class King
  attr_reader :role, :character

  def initialize(team)
    @role = 'king'
    @team = team
    @character = team == 'white' ? "\u2654" : "\u265A"
  end
end

# Queen
class Queen
  attr_reader :role, :character

  def initialize(team)
    @role = 'queen'
    @team = team
    @character = team == 'white' ? "\u2655" : "\u265B"
  end
end
