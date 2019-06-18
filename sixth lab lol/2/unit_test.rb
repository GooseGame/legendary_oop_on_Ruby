load "stack.rb"
require 'test/unit'

class TestStack < Test::Unit::TestCase
  def test_push_normal
    testStack = Stack.new
    testStack.push('5')
    assert_equal('5', testStack.peek)
  end  
  def test_push_argClassErr
    testStack = Stack.new
    testStack.push('5')
    assert_equal(['5'], testStack.push(1))
  end  
  def test_pop_normal
    testStack = Stack.new
    testStack.push('5')
    testStack.push('4')
    assert_equal('4', testStack.pop)
  end  
  def test_pop_EmptyStackError
    testStack = Stack.new
    assert_equal(nil, testStack.pop)
  end  
  def test_eql_normal
    testStack = Stack.new
    testStack2 = Stack.new
    testStack.push('3')
    testStack2.push('2')
    assert_equal(['2'], testStack.copyFrom(testStack2))
  end 
  
  def test_replace_datatypes_err
    testStack = Stack.new
    testStack2 = Stack.new
    testStack.push('33')
    testStack2.push('2')
    assert_equal(nil, testStack.replaceTo(testStack2))
  end    
end     