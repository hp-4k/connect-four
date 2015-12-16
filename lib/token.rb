class Token
  
  attr_accessor :color
  
  def initialize(color)
    @color = color
  end
  
  def to_s
    case color
    when :blue then 'B'
    when :yellow then 'Y'
    else ' '
    end
  end
  
end