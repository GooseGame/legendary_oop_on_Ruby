load "StdFunc/init.rb"

def output(result)
  if $isAutoTest == true
    $stdOut.print result
  else  
    print result
  end 
end  

def generatePrimeNumberSet(upperBound)
	boolArray = Array.new(upperBound) { true }
	i = 2
	while i**2 <= upperBound
		if boolArray[i] == true
			j = i**2
			while j <= upperBound
				boolArray[j] = false
				j += i
			end
		end
		i+=1		
	end
	for k in 2...upperBound
		if boolArray[k] == true
			output(k.to_s + ',  ')
		end	
	end	
end	

upperBound = initWithCheck(ARGV, 1)
generatePrimeNumberSet(upperBound) 


