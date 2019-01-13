
class Transform

  attr_reader :transformations

  ####################
  def initialize
    @transformations = []
  end

  ####################
  def add(matrix)
    @transformations.insert(0, matrix)
  end

  ####################
  def calculate
    start = index = @transformations.size - 1
    result = nil
    while index > 0
      left = @transformations[index - 1]
      right = index == start ? @transformations[index] : result
      result = left * right
      index -= 1
    end
    result
  end

end