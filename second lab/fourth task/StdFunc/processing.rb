
def checkRadix(oldRadix, newRadix, valueString)
	$AllNumbers = ('0'..'9').to_a + ('A'..'Z').to_a
	oldRadix = oldRadix.to_i
	newRadix = newRadix.to_i
	valueString = valueString.upcase	

	if ((oldRadix < 2 or oldRadix > 36) or (newRadix < 2 or newRadix > 36))
		output("incorrect radix")
		exit
	end	
	for i in (0...valueString.length)
		if !$AllNumbers.include?(valueString[i])
			output("value out of 2..36 radix range")
			exit
		end	
		if $AllNumbers.index(valueString[i]) > (oldRadix - 1)
			output("value out of your radix number range")
			exit
		end	
	end
	return oldRadix, newRadix, valueString
end	

def makeDecFromOldRadix(oldRadix, valueString)
	tenRadixOut = 0
	for i in (0...valueString.length)
		tenRadixOut += $AllNumbers.index(valueString[valueString.length - i - 1]) * oldRadix ** i
	end	
	puts tenRadixOut
	return tenRadixOut
end	

def makeNewFromDecRadix(numInDec, newRadix)
	newNumberOut = ''
	if numInDec == 0
		newNumberOut = '0'
	end	
	while numInDec > 0
		newNumberOut = $AllNumbers[numInDec % newRadix] + newNumberOut
		numInDec = numInDec.div(newRadix)
		newNumberOut.reverse
	end
	return newNumberOut
end	

def output(result)
	if $isAutoTest == true
		$stdOut.puts result
	else	
		puts result
	end	
end		
	

