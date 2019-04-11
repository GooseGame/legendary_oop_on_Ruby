load "car.rb"
require 'test/unit'

class TestCar < Test::Unit::TestCase
  def test_engine_default
    assert_equal(true, Car.new.engineOn())   
  end
  def test_setGear_default
  	testCar = Car.new
  	testCar.engineOn()
    assert_equal(true, testCar.setGear(1))   
  end
  def test_setSpeed_default
  	testCar2 = Car.new
  	testCar2.engineOn()
  	testCar2.setGear(1)
    assert_equal(true, testCar2.setSpeed(20))   
  end
  def test_setSpeed_neutral
  	testCar3 = Car.new
  	testCar3.engineOn()
    assert_equal(false, testCar3.setSpeed(20))   
  end 
  def test_setSpeed_neutral
  	testCar4 = Car.new
  	testCar4.engineOn()
    assert_equal(false, testCar4.setSpeed(20))   
  end 
  def test_engineOff_while_moving
  	testCar5 = Car.new
  	testCar5.engineOn()
  	testCar5.setGear(1)
  	testCar5.setSpeed(20)
  	testCar5.setGear(0)
    assert_equal(false, testCar5.engineOff())   
  end 
  def test_setSpeed_while_neutral
  	testCar6 = Car.new
  	testCar6.engineOn()
  	testCar6.setGear(1)
  	testCar6.setSpeed(20)
  	testCar6.setGear(0)
    assert_equal(false, testCar6.setSpeed(25))   
  end
  def test_setGear_backward
  	testCar7 = Car.new
  	testCar7.engineOn()
  	testCar7.setGear(1)
  	testCar7.setSpeed(20)
  	testCar7.setGear(0)
    assert_equal(false, testCar7.setGear(-1))   
  end
  def test_setGear_first
  	testCar8 = Car.new
  	testCar8.engineOn()
  	testCar8.setGear(-1)
  	testCar8.setSpeed(-10)
  	testCar8.setGear(0)
    assert_equal(false, testCar8.setGear(1))   
  end
  def test_setGear_first_while_go_backward
  	testCar9 = Car.new
  	testCar9.engineOn()
  	testCar9.setGear(-1)
  	testCar9.setSpeed(-10)
  	testCar9.setGear(0)
    assert_equal(false, testCar9.setGear(1))   
  end
  def test_engineOff_non_neutral
  	testCar10 = Car.new
  	testCar10.setGear(1)
    assert_equal(false, testCar10.engineOff())   
  end
end     