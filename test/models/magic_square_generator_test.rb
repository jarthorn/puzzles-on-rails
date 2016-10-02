require 'test_helper'

class MagicSquareGeneratorTest < ActionDispatch::IntegrationTest

  setup do
    @generator = MagicSquareGenerator.new
  end

  # test "generates_four_dim_squares" do
  # 	result = @generator.generate_squares(4)
  #   assert_equal 880, result.size
  # end

  test 'handles invalid dimensions' do
  	assert_raises {
  	  @generator.generate_squares(2)
  	}
  	assert_raises {
  	  @generator.generate_squares(1)
  	}
  end

  test "computes sum of all squares" do
  	assert_equal 1+2+3+4, @generator.square_sum(2)
  	assert_equal 1+2+3+4+5+6+7+8+9, @generator.square_sum(3)
  	assert_equal 8*17, @generator.square_sum(4)
  end
end
