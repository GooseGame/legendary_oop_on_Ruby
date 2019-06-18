load "stack.rb"
require 'test/unit'

class TestStack < Test::Unit::TestCase
  def test_push_normal
    testStack = MyStack.new
    testStack.push('5')
    assert_equal('5', testStack.peek)
  end  
  def test_push_argClassErr
    testStack = MyStack.new
    testStack.push('5')
    assert_equal(['5'], testStack.push(1))
  end  
  def test_pop_normal
    testStack = MyStack.new
    testStack.push('5')
    testStack.push('4')
    assert_equal('4', testStack.pop)
  end  
  def test_pop_EmptyStackError
    testStack = MyStack.new
    assert_equal(nil, testStack.pop)
  end  
  def test_eql_normal
    testStack = MyStack.new
    testStack2 = MyStack.new
    testStack.push('3')
    testStack2.push('2')
    assert_equal(['2'], testStack===testStack2)
  end 
  def test_eql_notMyStack
    testStack = MyStack.new
    testStack.push('33')
    assert_equal(['33'], testStack==='3')
  end 
  def test_replace_datatypes_err
    testStack = MyStack.new
    testStack2 = MyStack.new
    testStack.push('33')
    testStack2.push(2)
    assert_equal(nil, testStack.replaceTo(testStack2))
  end    
end     