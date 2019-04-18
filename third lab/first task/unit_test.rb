load "car.rb"
require 'test/unit'

class TestCar < Test::Unit::TestCase
  def test_engineOn_default_must_on
  	testCar = Car.new
    assert_equal(true, testCar.engineOn())   
  end
  def test_setGear_default_must_set
  	testCar = Car.new
  	testCar.engineOn()
    assert_equal(true, testCar.setGear(1))   
  end
  def test_setSpeed_default_must_set
  	testCar = Car.new
  	testCar.engineOn()
  	testCar.setGear(1)
    assert_equal(true, testCar.setSpeed(20))   
  end
  def test_setSpeed_neutral_set_if_less_than_own
  	testCar = Car.new
  	testCar.engineOn()
  	testCar.setGear(-1)
  	testCar.setSpeed(-6)
  	testCar.setGear(0)
    assert_equal(true, testCar.setSpeed(-5))   
  end 
  
  def test_engineOff_while_moving_engine_must_be_on
  	testCar = Car.new
  	testCar.engineOn()
  	testCar.setGear(1)
  	testCar.setSpeed(20)
  	testCar.setGear(0)
    assert_equal(false, testCar.engineOff())   
  end 
  def test_setSpeed_in_neutral_false_if_speed_more_than_own
  	testCar = Car.new
  	testCar.engineOn()
  	testCar.setGear(1)
  	testCar.setSpeed(20)
  	testCar.setGear(0)
    assert_equal(false, testCar.setSpeed(25))   
  end
  def test_setGear_cant_set_backward_gear_while_speed_more_than_zero
  	testCar = Car.new
  	testCar.engineOn()
  	testCar.setGear(1)
  	testCar.setSpeed(20)
  	testCar.setGear(0)
    assert_equal(false, testCar.setGear(-1))   
  end

  def test_setGear_cant_set_backward_gear_while_speed_less_than_zero
  	testCar = Car.new
  	testCar.engineOn()
  	testCar.setGear(-1)
  	testCar.setSpeed(-10)
  	testCar.setGear(0)
    assert_equal(false, testCar.setGear(-1))   
  end
  	
  def test_setSpeed_must_not_generate_mistakes_when_neutral_choose_own_speed
		testCar = Car.new
  	testCar.engineOn()
  	testCar.setGear(-1)
  	testCar.setSpeed(-10)
  	testCar.setGear(0)
    assert_equal(true, testCar.setSpeed(-10))
  end  
  def test_setGear_cant_change_gear_to_first_if_go_bacward_in_neutral
  	testCar = Car.new
  	testCar.engineOn()
  	testCar.setGear(-1)
  	testCar.setSpeed(-10)
  	testCar.setGear(0)
    assert_equal(false, testCar.setGear(1))   
  end
  def test_engineOff_cant_off_the_engine_while_non_neutral
  	testCar = Car.new
  	testCar.setGear(1)
    assert_equal(false, testCar.engineOff())   
  end
  def test_setGear_cant_choose_non_neutral_gear_while_engine_is_off
  	testCar = Car.new
    assert_equal(false, testCar.setGear(4))   
  end	
end     