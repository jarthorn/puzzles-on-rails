require 'pry'

class MagicSquareGenerator

  # Generates all possible magic squares of the given dimensions
  def generate_squares(dim)
  	throw 'illegal dimension' if dim < 3
  	full_sum = square_sum(dim)
  end

  def square_sum(dim)
  	cells = dim ** 2
  	cells * (cells+1) / 2
  end
end
