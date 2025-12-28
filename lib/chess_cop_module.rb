# frozen_string_literal: false

# Have methods that determines of moves to be made are valid
module ChessCop
  def get_path_pos(curr, new)
    return curr if curr == new

    axis = curr[0] == new[0] ? 1 : 0 # find the axis where it moves
    polarity = curr[axis] > new[axis] ? -1 : 1 # find direction of the move
    path = [] # array of positions the move passes thru
    temp = curr
    count = 0
    until temp[axis] == new[axis]
      count += 1
      path << temp[axis + (count * polarity)]
    end
    path
  end
end
