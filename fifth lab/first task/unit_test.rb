load "vector3d.rb"
require 'test/unit'

class TestCar < Test::Unit::TestCase
  def test_plus_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    test_vector2 = Vector3d.new(2.0,2.0,2.0)
    assert_equal(Vector3d.new(2.0,11.0,2.0).getArrayFromVector, 
                (test_vector+test_vector2).getArrayFromVector)
  end  
  def test_minus_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    test_vector2 = Vector3d.new(2.0,2.0,2.0)
    assert_equal(Vector3d.new(-2.0,7.0,-2.0).getArrayFromVector, 
                (test_vector-test_vector2).getArrayFromVector)
  end
  def test_binary_minus_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    assert_equal(Vector3d.new(0.0,-9.0,0.0).getArrayFromVector, 
                (-test_vector).getArrayFromVector)
  end
  def test_multiply_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    test_num = 3
    assert_equal(Vector3d.new(0.0,27.0,0.0).getArrayFromVector, 
                (test_vector*3).getArrayFromVector)
  end
  def test_multiply_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    test_num = 3
    assert_equal(Vector3d.new(0.0,27.0,0.0).getArrayFromVector, 
                (3*test_vector).getArrayFromVector)
  end
  def test_partition_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    test_num = 3
    assert_equal(Vector3d.new(0.0,3.0,0.0).getArrayFromVector, 
                (test_vector/3).getArrayFromVector)
  end
  def test_equal_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    test_vector2 = Vector3d.new(2.0,2.0,2.0)
    assert_equal(false, test_vector==test_vector2)
  end
  def test_notEqual_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    test_vector2 = Vector3d.new(2.0,2.0,2.0)
    assert_equal(true, test_vector != test_vector2)
  end
  def test_output_vector_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    $StdOut = File.open("in.txt", "w")
    test_vector.<<
    $StdOut.close()
    $StdOut = File.open("in.txt", "r")
    line = $StdOut.gets.chomp
    assert_equal('0.0 9 0.0', line)
  end
  def test_input_vector_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    outVector = Vector3d.new(0.0, 0.0, 0.0)
    $StdOut = File.open("in.txt", "w")
    test_vector.<<
    $StdOut.close()
    $StdOut = File.open("in.txt", "r")
    assert_equal(test_vector.getArrayFromVector, 
                outVector.>>.getArrayFromVector)
  end
  def test_dotProduct_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    test_vector2 = Vector3d.new(2.0,2.0,2.0)
    assert_equal(18.0, test_vector.dotProduct(test_vector2))
  end
  def test_crossProduct_modified
    test_vector = Vector3d.new(1.0,9,1.0)
    test_vector2 = Vector3d.new(2.0,2.0,2.0)
    assert_equal(Vector3d.new(16.0, 0.0, -16.0).getArrayFromVector, 
                test_vector.crossProduct(test_vector2).getArrayFromVector)
  end
  def test_normalize_modified
    test_vector = Vector3d.new(0.0,9,0.0)
    assert_equal(Vector3d.new(0.0, 1.0, 0.0).getArrayFromVector, 
                test_vector.normalize.getArrayFromVector)
  end
end     