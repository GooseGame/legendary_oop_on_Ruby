def initWithCheck(consoleArr, argsCount)#parseCommandLine
	if consoleArr.length < argsCount
		puts "too few arguments"
		exit
	end	

	if consoleArr.length == 2
		$stdOut = File.open(consoleArr[1], 'w')
		$isAutoTest = true
	else
		$isAutoTest = false
	end		
	upperBound = consoleArr[0]
	return upperBound.to_i 
end	



