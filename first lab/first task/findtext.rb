i = 0
foundOne = false
if ARGV.length < 2
	puts "too few arguments"
	exit
end	
stdIn = File.open(ARGV[0].to_s, 'r')
stdOut = File.open("out.txt".to_s, 'w')
puts ARGV[0].to_s
if File.readable?(stdIn)
	stdIn.each do |line|
		i+=1
		if line =~ /#{ARGV[1].to_s}/
		 	stdOut.puts i
		 	foundOne = true
		end 		
	end
	if !foundOne
		stdOut.puts "text not found"
	end
end
stdIn.close
stdOut.close
