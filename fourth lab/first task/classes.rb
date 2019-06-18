require "interface"
require "tk"

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

ICanvasDrawable = interface{
	required_methods :draw
}

ICanvas = interface{
	required_methods :drawLine, :fillPolygon, :drawCircle, :fillCircle
}


Shape = interface{
	required_methods :getArea, :getPerimeter, :getOutlineColor
}	
#here is ShapeInterface that subinterfaces SolidShapeInterface
SolidShape = interface{
	extends Shape
	extends ICanvasDrawable
	required_methods :getFilledColor
}	

class CCanvas
	def initialize()
		@root = TkRoot.new
		@canvas = TkCanvas.new(@root)
		@canvas.pack
	end	
	def drawLine(pointFrom, pointTo, lineColor)
		x1, y1 = pointFrom.x, pointFrom.y
		x2, y2 = pointTo.x, pointTo.y
		return TkcLine.new(@canvas,x1,y1,x2,y2, :fill => lineColor) 
	end
	def drawPolygon(points, outlineColor, filled = nil)
		if filled != nil
			filledColor = filled
		end	
		if points.length == 3
			vert1 = points[0]
			vert2 = points[1]
			vert3 = points[2]
			return TkcPolygon.new(@canvas,vert1.x,vert1.y,vert2.x,vert2.y,vert3.x,vert3.y, :outline => outlineColor, :fill => filledColor)
		elsif points.length == 2
			vert1 = points[0]
			vert2 = points[1]
			return TkcRectangle.new(@canvas,vert1.x,vert1.y,vert2.x,vert2.y, :outline => outlineColor, :fill => filledColor)
		end	
	end	
	def fillPolygon(polygon, fillColor)
		polygon[:fill] = fillColor
	end	
	def drawCircle(center, radius, line, filled = nil)
		if filled != nil
			filledColor = filled
		end
		x,y = center.x, center.y
		return TkcOval.new(@canvas, x-radius, y, x, y+radius, :outline => line, :fill => filledColor)
	end
	def fillCircle(circle, fillColor)
		circle[:fill] = fillColor
	end
	implements ICanvas
end	

class LineSegment
	def initialize(x1, y1, x2, y2, outlineColor)
		@startPoint = RubyPoint.new(x1, y1)
		@endPoint = RubyPoint.new(x2, y2)
		@isDrawable = true
		@outlineColor = outlineColor
	end	
	def getDrawableInfo
		return @isDrawable
	end	
	def getArea()
		return 0
	end	
	def getPerimeter() 
		perimeter = Math.sqrt((@endPoint.x-@startPoint.x)**2 - (@endPoint.y-@startPoint.y)**2 )
		return perimeter
	end 		
	def getOutlineColor()
		return @outlineColor
	end		
	def getStartPoint()
		return @startPoint.getPoint
	end	
	def getEndPoint()
		return @endPoint.getPoint
	end	
	def draw(canvas)
		@isDrawable = false
		return canvas.drawLine(@startPoint, @endPoint, @outlineColor)
	end	
	implements Shape
end		

class Triangle
	def initialize(x1, y1, x2, y2, x3, y3, outlineColor, filledColor)
		@a = RubyPoint.new(x1, y1)
		@b = RubyPoint.new(x2, y2)
		@c = RubyPoint.new(x3, y3)
		@isDrawable = true
		@outlineColor = outlineColor
		@filledColor = filledColor
	end	
	def getArea()
		area = (0.5*((@a.x-@c.x) * (@b.y-@c.y) - (@a.y-@c.y) * (@b.y-@c.y))).abs
		if area == 0.0
			return 'your triangle is just a line. Area of a line: ' + area.to_s
		else	
			return area
		end	
	end
	def getPerimeter()
		perimeter = getDistanceOfTriangleDots(@a, @b) + getDistanceOfTriangleDots(@b, @c) + getDistanceOfTriangleDots(@a, @c)
		return perimeter
	end
	def getOutlineColor()
		return @outlineColor
	end
	def getFilledColor()
		return @filledColor
	end	
	def getVertex1()
		return @a
	end
	def getVertex2()
		return @b
	end	
	def getVertex3()
		return @c
	end

	def draw(canvas)
		@isDrawable = false
		return canvas.drawPolygon([@a,@b,@c], @outlineColor, @filledColor)
	end

	def fill(canvas)
		if !@isDrawable
			canvas.fillPolygon([@a,@b,@c],@outlineColor, @filledColor)
		end	
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
		@isDrawable = true
		@outlineColor = outlineColor
		@filledColor = filledColor
	end
	def getArea()
		return @height * @width
	end	
	def getPerimeter()
		return @height * 2 + @width * 2
	end	
	def getOutlineColor()
		return @outlineColor
	end
	def getFilledColor()
		return @filledColor
	end	
	def getWidth()
		return @width
	end
	def getHeight()	
		return @height
	end	
	def getLeftTop()
		return @leftTop
	end	
	def getRightBottom()
		rightBottom = RubyPoint.new(@leftTop.x+@width, @leftTop.y-@height)
		return rightBottom
	end

	def draw(canvas)
		@isDrawable = false
		return canvas.drawPolygon([@leftTop,self.getRightBottom], @outlineColor, @filledColor)
	end

	def fill(canvas)
		if !@isDrawable
			canvas.fillPolygon([@leftTop,self.getRightBottom], @filledColor)
		end	
	end	

	implements SolidShape	
end	

class Circle
	def initialize(x0, y0, radius, outlineColor, filledColor)
		@center = RubyPoint.new(x0, y0)
		@radius = radius
		@outlineColor = outlineColor
		@isDrawable = true
		@filledColor = filledColor
	end
	def getArea()
		area = Math::PI * @radius**2	
		return area
	end	
	def getPerimeter()
		perimeter = 2 * Math::PI * @radius
		return perimeter
	end
	def getOutlineColor()
		return @outlineColor
	end
	def getFilledColor()
		return @filledColor
	end		
	def getCenter()
		return @center
	end
	def getRadius()
		return @radius
	end		
	def fill(canvas)
		if !@isDrawable
			canvas.fillCircle(@center,radius, self, @filledColor)
		end	
	end	
	def draw(canvas)
		@isDrawable = false
		return canvas.drawCircle(@center,@radius, @outlineColor, @filledColor)
	end

	implements SolidShape
end	


