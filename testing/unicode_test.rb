# frozen_string_literal: false

puts "with space A\u2654 A"
puts "no space A\u2654A"
king = "\u2654 "
black = "\u25A0 "
puts "A#{king}#{black}A"
puts "A#{king}#{black}A"
square = [[black, black, black],
          [black, king, black],
          [black, black, black]]

square.each
