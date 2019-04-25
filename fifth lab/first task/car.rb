
class Vector3d
	def initialize(x, y, z)
		@x = x
		@y = y
		@z = z
	end
	def x
		@x
	end
	def y
		@y
	end	
	def z
		@x
	end
	def +(vec3d2)
		result = Vector3d.new(self.x + vec3d2.x,
													self.y + vec3d2.y, 
													self.z + vec3d2.z)
	end	
	def -(vec3d2)
		result = Vector3d.new(self.x - vec3d2.x,
													self.y - vec3d2.y, 
													self.z - vec3d2.z)
		return result
	end	
	def -@
		result = Vector3d.new(-self.x, -self.y, -self.z)
		return result
	end	
	def +@
		return self
	end	
	def *(num)
		result = Vector3d.new(self.x * num,
													self.y * num, 
													self.z * num)
		return result
	end	
	def /(num)
		result = Vector3d.new(self.x / num,
													self.y / num, 
													self.z / num)
		return result
	end	
	def ==(vec3d2)
		if (Math.sqrt(@x**2+@y**2+@z**2)).eql?(Math.sqrt(vec3d2.x**2+vec3d2.y**2+vec3d2.z**2))
			return true
		else
			return false
		end		
	end	
	def !=(vec3d2)
		if !(Math.sqrt(@x**2+@y**2+@z**2)).eql?(Math.sqrt(vec3d2.x**2+vec3d2.y**2+vec3d2.z**2))
			return true
		else
			return false
		end		
	end	
	def <<
		$StdOut.puts self.getVector.join(' ')
		return self.getVector.join(' ')
	end	
	def >>
		inputArray = $StdOut.gets.chomp.split(' ')
		return Vector3d.new(inputArray[0].to_f, inputArray[1].to_f, inputArray[2].to_f)
	end	
	def dotProduct(vec3d2)
		result=@x*vec3d2.x+@y*vec3d2.y+@z*vec3d2.z
		return result
	end
	def crossProduct(vec3d2)
		result = Vector3d.new((@y*vec3d2.z-@x*vec3d2.y),
													(@z*vec3d2.x-@x*vec3d2.z),
													(@x*vec3d2.y-@y*vec3d2.x))
		return result
	end
	def normalize
		result = Vector3d.new(@x/self.getLength, @y/self.getLength, @z/self.getLength)
		return result
	end	
	def getLength
		result = Math.sqrt(@x**2+@y**2+@z**2).floor()
		return result
	end	
	def getVector
		return [@x, @y, @z]
	end	
end	

hey = Vector3d.new(0,9,0)
lol = Vector3d.new(1,1,1)
copylol = Vector3d.new(9,0,0)
puts hey.normalize

