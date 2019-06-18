load 'errors.rb'

class Stack
	def initialize
		@store = []
	end

	def push(x) 
		begin
		 	if x.class.to_s != 'String'
		 		raise ArgClassError.new
		 	end	
		rescue ArgClassError => e
			puts e.message
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

		@store.pop
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

	def copyFrom(stack)
		begin
			if stack.class.to_s != 'Stack'
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
		return @store
	end	

	def clear
		@store = []
	end	

	def list
		@store
	end	

	def replaceTo(stack)
		begin
			if stack.class.to_s != 'Stack'
				raise ArgClassError.new
		 	end	
		rescue ArgClassError => e
			puts e.message
			return @store
		end

		while !self.empty?
			stack.push(self.pop)
		end
	end		
end

st = Stack.new
nd = Stack.new

st.push('1')
st.push('2')
nd.push('3')
nd.push('4')


st.copyFrom(nd)
st.replaceTo(nd)
puts nd.list