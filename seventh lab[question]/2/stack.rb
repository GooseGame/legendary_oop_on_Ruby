load 'errors.rb'

class MyStack
	def initialize
		@store = []
		@dataType = nil
	end

	def push(x)
		if @store.empty?
			@dataType = x.class.to_s
		end	 
		begin
		 	if x.class.to_s != @dataType
		 		raise ArgClassError.new
		 	end	
		rescue ArgClassError => e
			puts x.class.to_s, 2
			return @store
		end
		@store.push x
	end

	def pop
		begin 
			if @store.empty?
				raise EmptyStackError.new
			end		
		rescue EmptyStackError => e
			puts e.message  
			return nil
		end	 
		return @store.pop
		if @store.empty?
			@dataType = nil
		end	
	end

	def peek
		begin
			if @store.empty?
				raise EmptyStackError.new
			end		
		rescue EmptyStackError => e
			puts e.message
			return nil  
		end	 
		@store.last
	end

	def empty?
		@store.empty?
	end

	def dataType
		@dataType
	end	

	#оператор присваивания
	def ===(stack)
		begin
			if stack.class.to_s != 'MyStack'
				raise ArgClassError.new
		 	end	
		rescue ArgClassError => e
			puts e.message
			return @store
		end	
		self.clear
		for i in 0...stack.list.length
			self.push(stack.list[i])
		end	
		return self.list
	end	

	def clear
		@store = []
		@dataType = nil
	end	

	def list
		@store
	end	

	def replaceTo(stack)
		begin
			if stack.class.to_s != 'Stack'
				raise ArgClassError.new
		 	end	
		 	if @dataType != stack.dataType
		 		raise NotEquealDataTypesError.new
		 	end	
		rescue NotEquealDataTypesError => e
			puts e.message 	
		rescue ArgClassError => e
			puts e.message
		end

		while !self.empty?
			stack.push(self.pop)
		end
	end		
end