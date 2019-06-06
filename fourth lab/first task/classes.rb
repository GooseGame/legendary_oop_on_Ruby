require "interface"

class RubyPoint
	def initialize(x, y)
		@x = x
		@y = y
	end
	def x
		@x
	end
	def y
		@y
	end	

	def getPoint
		return [@x, @y]
	end	
end

Shape = interface{
	required_methods :getArea, :getPerimeter, :getOutlineColor
}	
#here is ShapeInterface that subinterfaces SolidShapeInterface
SolidShape = interface{
	extends Shape
	required_methods :getFilledColor
}	

class LineSegment
	def initialize(x1, y1, x2, y2, outlineColor)
		@startPoint = RubyPoint.new(x1, y1)
		@endPoint = RubyPoint.new(x2, y2)
		@outlineColor = outlineColor
	end	
	def getArea
		return 0
	end	
	def getPerimeter 
		perimeter = Math.sqrt((@endPoint.x-@startPoint.x)**2 - (@endPoint.y-@startPoint.y)**2 )
		return perimeter
	end 		
	def getOutlineColor
		return @outlineColor
	end		
	def getStartPoint
		return @startPoint.getPoint
	end	
	def getEndPoint
		return @endPoint.getPoint
	end	

	implements Shape
end		

class Triangle
	def initialize(x1, y1, x2, y2, x3, y3, outlineColor, filledColor)
		@a = RubyPoint.new(x1, y1)
		@b = RubyPoint.new(x2, y2)
		@c = RubyPoint.new(x3, y3)
		@outlineColor = outlineColor
		@filledColor = filledColor
	end	
	def getArea
		area = (0.5*((@a.x-@c.x) * (@b.y-@c.y) - (@a.y-@c.y) * (@b.y-@c.y))).abs
		if area == 0.0
			return 'your triangle is just a line. Area of a line: ' + area.to_s
		else	
			return area
		end	
	end
	def getPerimeter
		perimeter = getDistanceOfTriangleDots(@a, @b) + getDistanceOfTriangleDots(@b, @c) + getDistanceOfTriangleDots(@a, @c)
		return perimeter
	end
	def getOutlineColor
		return @outlineColor
	end
	def getFilledColor
		return @filledColor
	end	
	def getVertex1
		return @a
	end
	def getVertex2
		return @b
	end	
	def getVertex3
		return @c
	end

	private
	def getDistanceOfTriangleDots(point1, point2)
		side = Math.sqrt(((point2.x-point1.x)**2 - (point2.y-point1.y)**2).abs)
		return side
	end	

	implements SolidShape
end	

class Rectangle

	def initialize(x1, y1, height, width, outlineColor, filledColor)
		@leftTop = RubyPoint.new(x1, y1)
		@height = height
		@width = width
		@outlineColor = outlineColor
		@filledColor = filledColor
	end
	def getArea
		return @height * @width
	end	
	def getPerimeter
		return @height * 2 + @width * 2
	end	
	def getOutlineColor
		return @outlineColor
	end
	def getFilledColor
		return @filledColor
	end	
	def getWidth
		return @width
	end
	def getHeight	
		return @height
	end	
	def getLeftTop
		return @leftTop
	end	
	def getRightBottom
		c = RubyPoint.new(@leftTop.x+@width, @leftTop.y-@height)
		return c
	end	

	implements SolidShape	
end	

class Circle
	def initialize(x0, y0, radius, outlineColor, filledColor)
		@center = RubyPoint.new(x0, y0)
		@radius = radius
		@outlineColor = outlineColor
		@filledColor = filledColor
	end
	def getArea
		area = Math::PI * @radius**2	
		return area
	end	
	def getPerimeter
		perimeter = 2 * Math::PI * @radius
		return perimeter
	end
	def getOutlineColor
		return @outlineColor
	end
	def getFilledColor
		return @filledColor
	end		
	def getCenter
		return @center
	end
	def getRadius
		return @radius
	end		

	implements SolidShape
end	


