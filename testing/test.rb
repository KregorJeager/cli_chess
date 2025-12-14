# frozen_string_literal: false

# when subclass is able to change a instance_variable from superclass
# Start +++++++++++++++++++++++
class Outer
  attr_accessor :test_var

  def initialize(string)
    @test_var = string
  end
end

# nil
class Inner < Outer
  def update_var(string)
    @test_var = string
  end
end

x = Inner.new('Al')
p x.test_var
x.update_var('Alma')
p x.test_var
# End   +++++++++++++++++++++++
