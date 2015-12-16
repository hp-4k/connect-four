class Board
  
  attr_reader :tokens
  
  def initialize
    @tokens = [nil] * 42
  end
  
  def to_s
    string = "|1|2|3|4|5|6|7|\n"
    5.downto(0) do |i|
      string << "|"
      0.upto(6) do |j|
        string << get_token_for_printing(i, j).to_s
        string << "|"
      end
      string << "\n"
    end
    string
  end
  
  def insert_token(column, token)
    raise ArgumentError if !column.between?(1,7)
    row = 0
    until get_token(row, column).nil?
      row += 1
      raise FullColumnError if row > 5
    end
    set_token(row, column, token)
  end
  
  private
  
    def get_token(row, column)
      tokens[row * 7 + column - 1]
    end
    
    def set_token(row, column, new_value)
      tokens[row * 7 + column - 1] = new_value
    end
    
    def get_token_for_printing(i, j)
      tokens[i * 7 + j] || ' '
    end
  
  class FullColumnError < ArgumentError
    def initialize(default_message = "Selected column is full!")
      super(default_message)
    end
  end
  
end