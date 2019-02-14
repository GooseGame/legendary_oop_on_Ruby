if ARGV.length < 3
	puts "too few arguments"
	exit
end	

oldRadix = ARGV[0].to_i
newRadix = ARGV[1].to_i
value = ARGV[2].to_s
stdOut = File.open("out.txt".to_s, 'w')
if ((oldRadix < 2 or oldRadix > 36) or (newRadix < 2 or newRadix > 36))
	stdOut.puts "no radix"
	exit
end	
radixChecker = ('0'..'9').to_a + ('A'..'Z').to_a#0..Z
for i in (0...value.length)
	if radixChecker.index(value[i]) > (oldRadix - 1)
		stdOut.puts "value out of your radix number range"
		exit
	end	
end
preResult = value.to_i(oldRadix)

result = preResult.to_s(newRadix)
stdOut.puts result.upcase