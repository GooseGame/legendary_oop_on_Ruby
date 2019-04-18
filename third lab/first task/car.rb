class Car 
	@@gear = {-1 => (-20..0), 
							0 => (-20..150), 
							1 => (0..30), 
							2 => (20..50), 
							3 => (30..60), 
							4 => (40..90), 
							5 => (50..150)}			

	def initialize()
		@maxSpeed, @maxGear = 150, 5
		@speed = 0
		@engineIsOn = false
		@currentGear = 0
	end	

	def speed
		@speed
	end
		
	def engineIsOn
		@engineIsOn
	end
	
	def currentGear
		@currentGear
	end	

	def engineOn()
		if !@engineIsOn
			@engineIsOn = true
			return true
		else
			return false		
		end	
	end

	def engineOff()
		if @engineIsOn and @currentGear == 0 and @speed == 0
			@engineIsOn = false
			return true
		else 
			puts 'cant off the engine'
			return false
		end	
	end	

	def setSpeed(speedValue)	
		if @engineIsOn
			if @@gear[@currentGear].to_a.include?(speedValue)
				if @currentGear != 0 
					@speed = speedValue
					return true
				elsif @speed == speedValue
					return true
				elsif @speed > 0 and speedValue < @speed
					@speed = speedValue
					return true
				elsif @speed < 0 and speedValue > @speed	
					@speed = speedValue
					return true
				else
					puts 'you cant move faster in neutral'	
					return false
				end
			else
				puts 'not in your current gear range'
				return false
			end	
		else
			puts 'you cant set speed when engine is off'
			return false
		end		
	end

	def setGear(gearValue)
		if (-1..5).include?(gearValue)
			if @engineIsOn
				if @@gear[gearValue].to_a.include?(@speed)
					if @speed == 0 and @currentGear == 0 and gearValue == -1
						@currentGear = gearValue
						return true
					elsif	@speed == 0 and @currentGear == -1 and gearValue == 1
						@currentGear = gearValue
						return true
					elsif @speed == 0 and @currentGear == 0 and gearValue == 1
						@currentGear = gearValue
						return true
					elsif gearValue != -1
						if gearValue != 1	
							@currentGear = gearValue
						end	
						return true
					else 
						puts 'you cant do that'
						return false	
					end			
				else	
					puts 'speed is not in your gear range'
					return false
				end	
				if @speed == 0
					@currentGear = gearValue
					return true
				end	
			elsif gearValue == 0
				@currentGear = gearValue
				return true
			else		
				puts 'you cant set non neutral gear when engine is off'	
				return false
			end	
		else puts 'your car has only -1..5 gears'
			return false
		end	
	end		
end	