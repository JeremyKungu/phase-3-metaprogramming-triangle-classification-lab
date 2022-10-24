class Triangle
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 =length3
  end
  def kind
    validate_triangle
      if @length1 == @length2 && @length2 == @length3
        :equilateral
      elsif @length1 == @length2 || @length2 == @length3 || @length1 == @length3 
        :isosceles
      else
        :scalene
      end      
  end
  def greater_than_zero?
    [@length1, @length2, @length3].all?(&:positive?)
  end

  def inequality?
    @length1 + @length2 > @length3 && @length2 + @length3 > @length1 && @length3 + @length1 > @length2
  end

  def validate_triangle
    raise TriangleError unless greater_than_zero? && inequality?
  end

  class TriangleError < StandardError
  end
end
