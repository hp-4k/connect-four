require 'cell'

class Board
  
  attr_reader :cells
  
  def initialize
    @cells = [Cell.new] * 42
  end
  
end