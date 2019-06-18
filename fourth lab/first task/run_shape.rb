load "run_test.rb"

canvas = CCanvas.new
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
      dataArray[dataArray.length] = LineSegment.new(data[0].to_f, data[1].to_f, data[2].to_f, data[3].to_f, 
                                             data[4])
      puts dataArray
  when 'Triangle'
      dataArray[dataArray.length] = Triangle.new(data[0].to_f, data[1].to_f, data[2].to_f, data[3].to_f, 
                                                 data[4].to_f, data[5].to_f, data[6], data[7])
      puts dataArray
  when 'Rectangle'
    dataArray[dataArray.length] = Rectangle.new(data[0].to_f, data[1].to_f, data[2].to_f, data[3].to_f, 
                                                data[4], data[5])
    puts dataArray  
  when  'Circle'
      dataArray[dataArray.length] = Circle.new(data[0].to_f, data[1].to_f, data[2].to_f, data[3], 
                                               data[4])
  when 'findMaxArea' 
    puts maxArea(dataArray)
  when 'findMinPerimeter'  
    puts minPerimeter(dataArray)
  when 'draw'
    for i in 0...dataArray.length
      dataArray[i].draw(canvas)
    end    
  else puts 'unknown command'
  end 
end   
Tk.mainloop   