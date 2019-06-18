load "classes.rb"

$ExampleLineDataRequest = [0.0,0.0, 3.3,3.3, '00FF00']
$ExampleTriangleDataRequest = [0.0,0.0, 3.3,3.3, 6.6,0.0, '00FF00', '00FF00']
$ExampleRectangleDataRequest = [0.0,0.0, 5, 5, '00FF00', '00FF00']
$ExampleCircleDataRequest = [0.0,0.0, 3.3, '5DFA90', 'FFFFFF']
 
def checkRGB(rgb)
    isRightRGB = true
    for i in 0...rgb.length
      if !(('0'..'9').to_a + ('A'..'F').to_a).include?(rgb[i]) 
        isRightRGB = false
      end
    end
    return isRightRGB
  end

def checkArgs(argsNow, argsMustBe)
  if argsNow.length == argsMustBe.length
    for i in 0..argsMustBe.length
      if argsNow[i].class == argsMustBe[i].class
        if argsNow[i].class == String
          return checkRGB(argsNow[i])
        end  
      end
    end    
  end
  return false
end    

def maxArea(arr)
  area = []
  for i in 0...arr.length
    area[i] = arr[i].getArea      
  end  
  return area.max
end  

def minPerimeter(arr)
  perimeter = []
  for i in 0...arr.length
    perimeter[i] = arr[i].getPerimeter     
  end  
  return perimeter.min
end  

dataArray = []
