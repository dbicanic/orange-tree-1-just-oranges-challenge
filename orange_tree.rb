class OrangeTree
  attr_accessor :age, :height
  attr_reader :oranges

  # Define a custom exception class
  class NoOrangesError < StandardError
  end

  def initialize(age: 0, height: 0, oranges: [])
    @age = age
    @height = height
    @oranges = oranges
  end

  def pass_growing_season
    @age += 1
    @height += grow
    rand(100..300).times { @oranges << Orange.new } if mature?
  end

  def grow
    return 0 if @height == 25
    @height + 2.5 < 25 ? 2.5 : 25 - @height
  end

  # Returns true if the tree is old enough to bear fruit (6), false otherwise
  def mature?
    age >= 6
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def has_oranges?
    @oranges.any?
  end

  def dead?
    @age >= 100
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange
    raise NoOrangesError, "This tree has no oranges" unless self.has_oranges?
    @oranges.pop
    # orange-picking logic goes here
  end
end
