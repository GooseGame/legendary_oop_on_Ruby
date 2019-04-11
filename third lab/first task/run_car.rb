load "car.rb"

solarisVCredit = Car.new
while true do
  commandLine = gets.chomp
  command, num = commandLine.split(' ')[0], commandLine.split(' ')[1]
  case command
  when 'exit'
    exit
  when 'info'
    solarisVCredit.showInfo()
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