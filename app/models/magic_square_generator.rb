require 'pry'

class MagicSquareGenerator

  def initialize(dimensions=4)
    @dim = dimensions
  end

  # Generates all possible magic squares of the given dimensions
  def generate_squares
    throw 'illegal dimension' if @dim < 3
    full_sum = square_sum
    row_sum = full_sum / @dim

    valid_rows = generate_rows
  end

  def square_sum
    cells = @dim ** 2
  	cells * (cells+1) / 2
  end
end
