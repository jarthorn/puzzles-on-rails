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

    valid_rows = generate_all_rows


    []
  end

  def square_sum
    return @square_sum if @square_sum
    cells = @dim ** 2
    square_sum = cells * (cells+1) / 2
  end

  def row_sum
    square_sum / @dim
  end

  def generate_all_rows
    (1..(@dim**2)).to_a.permutation(@dim).select{|row|
      row.reduce(0, :+) == row_sum
    }
  end
end
