require './lib/game_round'

a = GameRound.new

b = Array.new(8) { Array.new(8) { 1 } }
b_copy = a.when_check('team', b)

size = (0..7)
size.each do |i|
  size.each do |j|
    print " #{b[i][j]} |"
  end
  print '  ||  '
  size.each do |j|
    print " #{b_copy[i][j]} |"
  end
  print "\n"
end

size.each { |i| b_copy[i][i] = 2 }

size.each do |i|
  size.each do |j|
    print " #{b[i][j]} |"
  end
  print '  ||  '
  size.each do |j|
    print " #{b_copy[i][j]} |"
  end
  print "\n"
end
