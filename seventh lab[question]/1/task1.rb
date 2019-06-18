def sort2(*args)

	for i in 0...args.length 
		if args[i].class.to_s != args[0].class.to_s
			raise 'not equeal argument types' 
		end
	end
	
	return args if args.size <= 1 # already sorted
  swapped = true
  while swapped do
    swapped = false
    0.upto(args.size-2) do |i|
      if args[i] > args[i+1]
        args[i], args[i+1] = args[i+1], args[i] # swap values
        swapped = true
      end
    end  
  end   
  return args 
end

puts sort2('2','3', '1')	