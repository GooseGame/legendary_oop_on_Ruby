def initAndFillArr(arr) #
  rowsCounter = 0
  $StdIn.each do |line|
    if !(rowsCounter > 2)
      arr[rowsCounter] = Array.new
      arr[rowsCounter] = line.split(/\s/)
      rowsCounter+=1 
    else 
      $StdOut.puts "only work with 3x3 matrix" 
      exit 
    end   
  end       
  for i in 0...arr.length 
    for j in 0...arr[i].length
      if ((arr.length != 3) or (arr[i].length != 3))
        $StdOut.puts "only work with 3x3 matrix"
        exit
      end 
      arr[i][j] = arr[i][j].to_f
    end
  end  
  return arr
end    

  