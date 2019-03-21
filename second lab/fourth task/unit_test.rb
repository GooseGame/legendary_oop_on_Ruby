load "eratosfenPride.rb"
require 'test/unit'
class TestPrimeNumbers < Test::Unit::TestCase
  def test_hundred
    assert_equal("[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]", EratosfenAlgorytm.new.generatePrimeNumberSet(100))   
  end
  def test_ten
    assert_equal("[2, 3, 5, 7]", EratosfenAlgorytm.new.generatePrimeNumberSet(10))   
  end
end     