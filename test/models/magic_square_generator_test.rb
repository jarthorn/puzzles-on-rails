require 'test_helper'

class MagicSquareGeneratorTest < ActionDispatch::IntegrationTest

  setup do
    @generator = MagicSquareGenerator.new 4
  end

  # test "generates_four_dim_squares" do
  # 	result = @generator.generate_squares(4)
  #   assert_equal 880, result.size
  # end

  test 'handles invalid dimensions' do
  	assert_raises {
      MagicSquareGenerator.new(2).generate_squares
  	}
  	assert_raises {
      MagicSquareGenerator.new(1).generate_squares
  	}
  end

  test "computes sum of all squares" do
    assert_equal 1+2+3+4+5+6+7+8+9, MagicSquareGenerator.new(3).square_sum
    assert_equal 8*17, @generator.square_sum
  end
end
