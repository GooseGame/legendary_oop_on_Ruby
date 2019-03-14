load "stdFunc/init.rb"

def fillingVector(vector)
  line = $StdIn.readline 
  vector = line.split(' ')
  for i in 0...vector.length
    vector[i] = vector[i].to_f
  end
  return vector
end  

def findMin(vector)
  minimal = vector[0]
  for i in 1...vector.length
    if vector[i] <= minimal
      minimal = vector[i]
    end
  end  
  return minimal  
end  

def manipulateVector(vector) 
  minV = findMin(vector)
  for i in 0...vector.length
    vector[i] = vector[i] * minV
  end   
end 

def printVector(vector) 
  for i in 0..vector.length
  	output(vector[i].to_s + ' ')
  end	
end

def output(result)
  if $isAutoTest == true
    $stdOut.print result
  else  
    print result
  end 
end   

initFiles(ARGV, 1)
vectorArr = Array.new
vectorArr = fillingVector(vectorArr)
manipulateVector(vectorArr)
printVector(vectorArr)