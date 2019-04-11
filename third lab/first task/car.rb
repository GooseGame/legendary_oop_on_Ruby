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
		@moveDirection = 0 #-1 назад, 0 стоим, 1 вперед		
	end	
	def moveDirectionCheck()
		@moveDirection = -1 if @speed < 0
		@moveDirection = 1 if @speed > 0
		@moveDirection = 0 if @speed == 0
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
		if @engineIsOn and @moveDirection == 0 and @currentGear == 0
			@engineIsOn = false
			return true
		else 
			return false
		end	
	end	

	def setSpeed(speedValue)
		if @engineIsOn
			if @@gear[@currentGear].to_a.include?(speedValue)
				if @currentGear != 0 
					@speed = speedValue
					moveDirectionCheck()
					return true
				elsif speedValue < @speed
					@speed = speedValue
					moveDirectionCheck()
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
				elsif gearValue != -1 or gearValue != 1	
					@currentGear = gearValue
					return true
				else 
					puts 'you cant do that'
					return false	
				end			
			else	
				puts 'speed is not in your gear range'
				return false
			end	
		elsif @speed == 0
			@currentGear = gearValue
			return true
		else	
			puts 'you cant set non neutral gear when engine is off'	
			return false
		end	
	end	

	def showInfo()
		puts 'engine is on: ', @engineIsOn
		puts 'car current speed: ', @speed
		puts 'car current gear: ', @currentGear
		puts 'car current direction: ', @moveDirection
	end	
end	


	