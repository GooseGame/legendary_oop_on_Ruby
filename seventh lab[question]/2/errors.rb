class StackError < StandardError
	def message
	end	
end

	class EmptyStackError < StackError
		def message
			'Stack is empty'
		end
	end

	class ArgError < StackError
		def message 
			'Error in stack arguments'
		end
	end

		class ArgClassError < ArgError
			def message 
				"Error in stack argument's class"
			end
		end
		class NotEquealDataTypesError < StackError
			def message
				'dataTypes of stacks are not equeal'
			end
		end		

		