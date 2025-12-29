# frozen_string_literal: false

require './lib/chess_cop_module'

class Test
  include ChessCop
end

test = Test.new

p test.get_path_pos([7, 5], [4, 2])
