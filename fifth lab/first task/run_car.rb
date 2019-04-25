load "car.rb"

solarisVCredit = Car.new

def showInfo(solarisVCredit)
  moveDirection = ''
  if solarisVCredit.speed < 0
    moveDirection = 'going backward'
  elsif solarisVCredit.speed > 0
    moveDirection = 'going forward'
  else 
    moveDirection = 'stay'
  end
        
  puts 'engine is on: ', solarisVCredit.engineIsOn
  puts 'car current speed: ', solarisVCredit.speed
  puts 'car current gear: ', solarisVCredit.currentGear
  puts 'car current direction: ', moveDirection
end

while true do
  commandLine = gets.chomp
  command, num = commandLine.split(' ')[0], commandLine.split(' ')[1]
  case command
  when 'exit'
    exit
  when 'Info'
    showInfo(solarisVCredit)
  when 'EngineOn'
    solarisVCredit.engineOn()
  when 'EngineOff'
    solarisVCredit.engineOff()
  when  'SetGear'
    solarisVCredit.setGear(num.to_i)
  when 'SetSpeed'
    solarisVCredit.setSpeed(num.to_i) 
  else puts 'unknown command'
  end 
end    