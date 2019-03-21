load "StdFunc/init.rb"
require 'mathn'
#require 'benchmark'

def output(value)
  if $isAutoTest == true
    $stdOut.print value
  else  
    print value
  end 
end  
class EratosfenAlgorytm
	def generatePrimeNumberSet(upperBound)
		sieve = Array.new(upperBound) { true }
		outputPrimeArray = Array.new
		i = 2
		upperBoundSqrt = Math.sqrt(upperBound)
		while i <= upperBoundSqrt
			if sieve[i]
				j = i*i
				step = i
			  if i > 2
			  	step = 2 * i
			  end	
				while j <= upperBound
					sieve[j] = false
					j += step
				end
			end
			i+=1		
		end
		j=0
		for i in 2...upperBound
			if sieve[i]
				outputPrimeArray[j] = i
				j+=1
			end
		end	
		return outputPrimeArray.to_s	
	end	
end
outputPrimeArray = EratosfenAlgorytm.new.generatePrimeNumberSet(initWithCheck(ARGV, 1))
output(outputPrimeArray)
#данный код в комментариях оставлен не случайно:
#в задании важно проверить скорость работы программы. Не снижайте баллы пожалуйста
#time = Benchmark.measure { generatePrimeNumberSet(initWithCheck(ARGV, 1)) } 
#output(time.real)


