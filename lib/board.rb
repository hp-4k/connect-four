class Board
  
  attr_reader :tokens
  
  def initialize
    @tokens = [nil] * 42
  end
  
  def to_s
    string = "|1|2|3|4|5|6|7|\n"
    0.upto(5) do |i|
      string << "|"
      0.upto(6) do |j|
        string << get_token_for_printing(i, j).to_s
        string << "|"
      end
      string << "\n"
    end
    string
  end
  
  private
  
    def get_token_for_printing(i, j)
      tokens[i * 7 + j] || ' '
    end
  
end