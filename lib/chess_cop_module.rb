# frozen_string_literal: false

# Have methods that determines of moves to be made are valid
module ChessCop
  def get_path_pos(curr, new)
    return curr if curr == new
    return nil if new[0] > 7 || new[0].negative? || new[1] > 7 || new[1].negative?

    if curr[0] == new[0] || curr[1] == new[1]
      axis = curr[0] == new[0] ? 1 : 0 # find the axis where it moves
      polarity = curr[axis] > new[axis] ? -1 : 1 # find direction of the move
      path = [] # array of positions the move passes thru
      count = 0
      temp = curr
      until temp[axis] == new[axis]
        count += 1
        temp = axis.zero? ? [curr[0] + count * polarity, curr[1]] : [curr[0], curr[1] + count * polarity]
        path << temp
      end
      return path
    end

    x_polarity = curr[1] > new[1] ? -1 : 1
    y_polarity = curr[0] > new[0] ? -1 : 1
    count = 0
    diag_temp = []
    loop do
      count += 1
      diag_temp << [curr[0] + count * y_polarity, curr[1] + count * x_polarity]
      if curr[0] + count * y_polarity > 7 || (curr[0] + count * y_polarity).negative? ||
         curr[1] + count * x_polarity > 7 || (curr[1] + count * x_polarity).negative?
        diag_temp = nil
        break
      end
      break if new == [curr[0] + count * y_polarity, curr[1] + count * x_polarity]
    end
    diag_temp
  end
end
