load "classes.rb"
load "run_test.rb"

dataArray = []
while (true and !$stdin.eof()) do  
  commandLine = gets.chomp() 

  command = commandLine[0...commandLine.index(' ')]
  if commandLine.include?(' ')
    data = commandLine[commandLine.index(' ')..commandLine.length].split(' ')
  end
    
  case command
  when 'exit'
    exit
  when 'Line'
    if checkArgs(data, $ExampleLineDataRequest)
      dataArray[dataArray.length] = LineSegments.new(data[0], data[1], data[2], data[3], 
                                             data[4])
      puts dataArray
    end
  when 'Triangle'
    if checkArgs(data, $ExampleTriangleDataRequest)
      dataArray[dataArray.length] = Triangle.new(data[0], data[1], data[2], data[3], 
                                                 data[4], data[5], data[6], data[7])
      puts dataArray
    end
  when 'Rectangle'
    if checkArgs(data, $ExampleRectangleDataRequest)
      dataArray[dataArray.length] = Rectangle.new(data[0], data[1], data[2], data[3], 
                                                  data[4], data[5])
    puts dataArray  
    end  
  when  'Circle'
    if checkArgs(data, $ExampleCircleDataRequest)
      dataArray[dataArray.length] = Circle.new(data[0], data[1], data[2], data[3], 
                                               data[4])
      puts dataArray
    end  
  when 'findMaxArea' 
    puts maxArea(dataArray)
  when 'findMinPerimeter'  
    puts minPerimeter(dataArray)
  else puts 'unknown command'
  end 
end    