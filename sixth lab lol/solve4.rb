def solve4(a, b, c, d, e)
	if a == 0
		raise ArgumentError.new('an A coefficient cant be 0')
	end	
	#solving by Ferrari method
		b, c, d, e = preparingCoefsForFerrari(a, b, c, d, e)
		a = 1
		#кубическая резольвента:
		#y^3 - cy^2 + (bd - 4e)y - b^2e + 4ce - d^2
		#например при 1 2 3 4 имеем
		#y^3 - 3y^2  - 12y - 24 = 0
		#надо найти 1 корень
		y0 = solve3(-c, b*d-4*e, -b*b*e + 4*c*e - d*d)
		if y0.class.to_s == 'Complex'
			raise StandardError.new('Error in sqrt(num); num < 0')
		end	
		#выведем квадратное уравнение
		#найдем коээфициенты
		a2 = 1
		puts b, c, y0
		sqrtArg = (b**2)/4 - c + y0
		if sqrtArg > 0
			bPlus = b/2 + Math.sqrt(sqrtArg)
			bMinus = b/2 - Math.sqrt(sqrtArg)
			cPlus = y0/2+((b/2)*y0 - d)/(2*Math.sqrt(sqrtArg))
			cMinus = y0/2-((b/2)*y0 - d)/(2*Math.sqrt(sqrtArg))
			x1, x2 = solve2(a2, bPlus, cPlus)
			x3, x4 = solve2(a2, bMinus, cMinus)
			return [x1, x2, x3, x4]	
		elsif sqrtArg == 0
			raise ZeroDivisionError.new('division by zero in C argument')
		else raise StandardError.new('Error in sqrt(num); num < 0')	
		end
end	
def preparingCoefsForFerrari(a, b, c, d, e)
	if a != 0
		b = b/a
		c = c/a
		d = d/a
		e = e/a
	end
	return b, c, d, e
end	

def solve3(a, b, c)
	q = (a**2 - 3*b)/9
	r = (2*(a**3) - 9*a*b + 27*c)/54
	s = q**3 - r**2
	if s>0
		fi = 0.33*arccos(r/Math.sqrt(q**3))
		x1 = -2*Math.sqrt(q)*Math.cos(fi) - a/3
	elsif s<0
		if q > 0
			fi = 0.33*Math.acosh(r.abs/Math.sqrt(q**3))
			x1 = -2*sgn(r)*Math.sqrt(q)*Math.cosh(fi) - a/3
		elsif q < 0
			fi = 0.33*Math.asinh(r.abs/Math.sqrt((q**3).abs))
			x1 = -2*sgn(r)*Math.sqrt(q.abs)*Math.sinh(fi) - a/3
		else
			x1 = - (c - (a**3)/27)**0.33 - a/3
		end	
	else
			x1 = sgn(r)*Math.sqrt(q) - a/3
	end
	return x1		
end	

def solve2(a, b, c)
	d = b**2 - 4*a*c
	if d > 0
		x1 = (-b + Math.sqrt(d))/(2*a)
		x2 = (-b - Math.sqrt(d))/(2*a)
	elsif d == 0
		x1 = -b/(2*a)
		x2 = nil
	else
		x1 = nil
		x2 = nil	
	end	
	return x1, x2
end

def arccos(x)
	return Math.atan2(Math.sqrt(1.0 - x*x), x)
end	

def sgn(x)
	if x > 0
		return 1
	elsif x == 0
		return 0
	else
		return -1
	end			
end	