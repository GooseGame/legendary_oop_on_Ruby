load "classes.rb"
load "run_test.rb"
require 'test/unit'

class TestShape < Test::Unit::TestCase
  def test_check_getPoint_method_default
  	testPoint = RubyPoint.new(0, 0)
    assert_equal([0.0, 0.0], testPoint.getPoint())   
  end


  def test_check_getArea_method_for_line_default
    testLine = LineSegment.new(0.0, 0.0, 5.5, 0.0, '00FF00')
    assert_equal(0, testLine.getArea)   
  end
  def test_check_getPerimeter_method_for_line_default
    testLine = LineSegment.new(0.0, 0.0, 5.5, 0.0, '00FF00')
    assert_equal(5.5, testLine.getPerimeter)   
  end
  def test_check_getArea_method_for_line_default
    testLine = LineSegment.new(0.0, 0.0, 5.5, 0.0, '00FF00')
    assert_equal(0, testLine.getArea)   
  end
  def test_check_getOutlineColor_method_for_line_with_normal_input
    testLine = LineSegment.new(0.0, 0.0, 5.5, 0.0, '00FF00')
    assert_equal('00FF00', testLine.getOutlineColor)   
  end
  def test_check_getStartPoint_method_for_line_with_normal_input
    testLine = LineSegment.new(0.0, 0.0, 5.5, 0.0, '00FF00')
    assert_equal([0.0, 0.0], testLine.getStartPoint)   
  end


  def test_check_getArea_method_for_triangle_default
    testTriangle = Triangle.new(0.0,0.0, 5.5,5.5, 5.5,0.0, '00FF00', '00FF00')
    assert_equal(15.125, testTriangle.getArea)   
  end
  def test_check_getArea_method_for_triangle_area_zero_must_message
    testTriangle = Triangle.new(0.0,0.0, 3.2,0.0, 5.5,0.0, '00FF00', '00FF00')
    assert_equal('your triangle is just a line. Area of a line: 0.0', testTriangle.getArea)   
  end
  def test_check_getPerimeter_method_for_triangle_default
    testTriangle = Triangle.new(0.0,0.0, 5.5,5.5, 5.5,0.0, '00FF00', '00FF00')
    assert_equal(11.0, testTriangle.getPerimeter)   
  end
  def test_check_getVertex_method_for_triangle_default
    testTriangle = Triangle.new(0.0,0.0, 5.5,5.5, 5.5,0.0, '00FF00', '00FF00')
    assert_equal(RubyPoint.new(0.0, 0.0).getPoint, testTriangle.getVertex1.getPoint)   
  end


  def test_check_getArea_circle_default
    testCircle = Circle.new(3.3,3.3, 2, '00FF00', '00FF00')
    assert_equal(12.566370614359172, testCircle.getArea)
  end 
  def test_check_getCenter_circle_default
    testCircle = Circle.new(3.3,3.3, 2, '00FF00', '00FF00')
    assert_equal(RubyPoint.new(3.3, 3.3).getPoint, testCircle.getCenter.getPoint)
  end
  def test_check_getPerimeter_circle_default
    testCircle = Circle.new(3.3,3.3, 2, '00FF00', '00FF00')
    assert_equal(12.566370614359172, testCircle.getPerimeter)
  end 

  def test_check_getRightBotton_circle_default
    testRectangle = Rectangle.new(0.0,0.0, 4, 6, '00FF00', '00FF00')
    assert_equal(RubyPoint.new(6.0, -4.0).getPoint, testRectangle.getRightBottom.getPoint)
  end

  def test_maxArea
    dataArray = [Rectangle.new(0.0,0.0, 4, 6, '00FF00', '00FF00'),  
                 Circle.new(0.0,0.0, 2, '00FF00', '00FF00'),
                 Triangle.new(0.0,0.0, 5.5,5.5, 5.5,0.0, '00FF00', '00FF00'),
                 LineSegment.new(0.0,0.0, 4.0,0.0, '00FF00')]
    assert_equal(24.0, maxArea(dataArray))
  end  
  def test_minPerimeter
    dataArray = [Rectangle.new(0.0,0.0, 4, 6, '00FF00', '00FF00'),  
                 Circle.new(0.0,0.0, 2, '00FF00', '00FF00'),
                 Triangle.new(0.0,0.0, 5.5,5.5, 5.5,0.0, '00FF00', '00FF00'),
                 LineSegment.new(0.0,0.0, 4.0,0.0, '00FF00')]
    assert_equal(4.0, minPerimeter(dataArray))
  end
  def test_valid_input
    teC = Circle.new(0.0,0.0, 2, '00FF00', '00FF00')
    assert_equal(true, checkArgs([teC.getCenter.x,
                                  teC.getCenter.y,
                                  teC.getRadius,
                                  teC.getOutlineColor,
                                  teC.getFilledColor], $ExampleCircleDataRequest))
  end  
  def test_fail_valid_input
    teC = Circle.new(0.0,0.0, 2, '00FF00', '00FF00')
    assert_equal(false, checkArgs([teC.getCenter.x,
                                  teC.getCenter.y,
                                  teC.getRadius,
                                  teC.getOutlineColor,
                                  teC.getFilledColor], $ExampleRectangleDataRequest))
  end  
end     