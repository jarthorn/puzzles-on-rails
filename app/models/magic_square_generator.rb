require 'pry'

class MagicSquareGenerator

  def initialize(dimensions=4)
    @dim = dimensions
  end

  # Generates all possible magic squares of the given dimensions
  def generate_squares
    throw 'illegal dimension' if @dim < 3
    row_sum = square_sum / @dim

    row_candidates = generate_all_rows
    solution_count = 0
    solution = Array.new(@dim)
    row_candidates.each do |candidate|
      solution[0] = candidate
      candidates2 = remove_overlaps(row_candidates, candidate)
      candidates2.each do |candidate2|
        solution[1] = candidate2
        candidates3 = remove_overlaps(candidates2, candidate2)
        candidates3.each do |candidate3|
          solution[2] = candidate3
          candidates4 = remove_overlaps(candidates3, candidate3)
          candidates4.each do |candidate4|
            solution[3] = candidate4
            next unless magic?(solution)
            put_square(solution)
            solution_count += 1
          end
        end
      end
    end
    puts "Found #{solution_count} squares"
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

  def remove_overlaps(candidates, row)
    candidates.select{|c| 
     (c&row).empty?
    }
  end

  def magic?(square)
    # check column sums
    @dim.times do |col|
      sum = 0
      square.each do |row|
        sum += row[col]
      end
      return false unless sum == row_sum
    end
    # check TL->BR diagonal
    sum = 0
    @dim.times do |x|
      sum += square[x][x]
    end
    return false unless sum == row_sum
    # check TR->BL diagonal
    sum = 0
    (1..@dim).each do |x|
      sum += square[@dim-x][x-1]
    end
    return sum == row_sum
  end

  def put_square(square)
    puts "-" * 15
    square.each do |row|
      puts row.to_s
    end
    puts "-" * 15
  end
end
