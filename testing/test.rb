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
# p x.test_var
x.update_var('Alma')
# p x.test_var
# End   +++++++++++++++++++++++

# When superclass is able to use subclass methods
# Start +++++++++++++++++++++++
# nil
class Outer1
  attr_reader :hey

  def initialize
    @hey = 'hello'
    @value = 'nil'
    p @value
  end
end

# nil
class Inner1 < Outer1
  def initialize
    super
    @value = 'something'
    p @value
  end
end

p Inner1.new.hey
# End   +++++++++++++++++++++++
