def det2x2(minor)
  result = minor[0][0]*minor[1][1] - minor[0][1]*minor[1][0]
  return result
end  

def make2x2(arr, minorLine, minorRow)
  array = Array.new

  line = 0
  row = 0
  for i in 0...3 
    if i < 2
      array[i] = Array.new
    end  
    for j in 0...3
      if !(i == minorLine or j == minorRow)
        array[line][row] = arr[i][j]
        if row == 0
          row+=1
        else
          row = 0
          line = 1
        end
      end
    end
  end
  #puts array
  return array
end          

def determinant(arr)
  
  arr11 = make2x2(arr, 0, 0) #вычеркиваем 1 столбец и строки для определителя
  arr12 = make2x2(arr, 0, 1)
  arr13 = make2x2(arr, 0, 2)
  det =  arr[0][0]*det2x2(arr11) - arr[0][1]*det2x2(arr12) + arr[0][2]*det2x2(arr13) 
  if det == 0.0
    $StdOut.puts "determinant = 0"
    exit
  end  
  return det
end

def transpanent(arr)
  for i in 0...3
    for j in i...3
      if i != j
        tmp = arr[i][j]
        arr[i][j] = arr[j][i]
        arr[j][i] = tmp
      end
    end
  end
  return arr
end        

def countAll2x2(arr)
  arrCopy = Array.new
  counter = 0
  for i in 0...3
    arrCopy[i] = Array.new 
    for j in 0...3
      counter += 1
      if (counter % 2 == 0)
        arrCopy[i][j] = -1.0 * det2x2(make2x2(arr,i,j))
      else  
        arrCopy[i][j] = det2x2(make2x2(arr,i,j))
      end  
    end
  end
  return arrCopy
end      

def makeInverted(arr, det)
  for i in 0...3
    for j in 0...3
      arr[i][j] = arr[i][j] / det
    end
  end
  return arr    
end

def makeRound(arr, val)
  for i in 0...3 #округление до 3х знаков
    for j in 0...3
      arr[i][j] = (arr[i][j]*val).round / val.to_f
    end
  end
end  

def makeOutput(arr)
  for i in 0...3
    $StdOut.puts arr[i].join("\t") 
  end
end   