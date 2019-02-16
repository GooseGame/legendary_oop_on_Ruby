def initAndFillArr(arr)
  

rowsCounter = 0

if File.readable?(stdIn)
	stdIn.each do |line|
		arr[rowsCounter] = Array.new
		arr[rowsCounter] = line.split(/\s/)
		rowsCounter+=1		
	end			
end		
if arr.empty?
	stdOut.puts "there is no array in input file"
	exit
end
for i in 0...arr.length 
  for j in 0...arr[i].length
  	if arr.length != arr[i].length
  		stdOut.puts "bad input (not square matrix)"
  		exit
  	end	
  	arr[i][j] = arr[i][j].to_f
  end
end  
matrix = Matrix[*arr].inv
arr = matrix.to_a
for i in 0...arr.length #округление до 3х знаков
  for j in 0...arr[i].length
  	arr[i][j] = (arr[i][j]*1000).round / 1000.0
  end
end
stdOut.puts Matrix[*arr]  	
stdIn.close
stdOut.close

