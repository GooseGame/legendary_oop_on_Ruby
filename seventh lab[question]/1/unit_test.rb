load "solve4.rb"
require 'test/unit'

class TestSolve4 < Test::Unit::TestCase
  def test_solve4_check_normal_data_with_solution
    assert_equal([nil, nil, 1.0, -2.0], solve4(1.0, 3.0, 3.0, -1.0, -6.0))   
  end
  def test_solve4_check_a_zero
    assert_equal('ArgumentError: an A coefficient cant be 0', solve4(0.0, 3.0, 3.0, -1.0, -6.0))   
  end
  def test_solve4_err_division_by_zero
    assert_equal('ZeroDivisionError: division by zero in C argument', solve4(4.0, 0, 0, 0, 0))   
  end
  def test_solve3_err_result_less_then_zero
    assert_equal('StandardError: Error in sqrt(num); num < 0', solve4(4.0, 0, 0, 4, 0))   
  end
end     