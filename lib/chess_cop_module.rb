# frozen_string_literal: false

# Have methods that determines of moves to be made are valid
module ChessCop
  def get_path_positions(curr, new)
    orientation = diagonal?(curr, new)

    orientation ? get_diagonal(curr, new) : get_straight(curr, new)
  end

  def diagonal?(curr, new)
    return true if curr[0] != new[0] && curr[0] != new[1]

    false
  end
end
