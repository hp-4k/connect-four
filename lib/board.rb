class Board
  
  ROWS = 6
  COLUMNS = 7
  
  attr_reader :tokens
  
  def initialize
    @tokens = [nil] * 42
  end
  
  def to_s
    string = "|1|2|3|4|5|6|7|\n"
    (ROWS - 1).downto(0) do |i|
      string << "|"
      0.upto(COLUMNS - 1) do |j|
        string << get_token_for_printing(i, j).to_s
        string << "|"
      end
      string << "\n"
    end
    string
  end
  
  def insert_token(column, token)
    raise ArgumentError if !column.between?(1,7)
    row = 1
    until get_token(row, column).nil?
      row += 1
      raise FullColumnError if row > 6
    end
    set_token(row, column, token)
  end
  
  def winner
    1.upto(ROWS) do |row|
      1.upto(COLUMNS) do |column|
        if winner = winning_line_starting_at(row,column)
          return winner 
        end
      end
    end
    nil
  end
  
  private
  
    def get_token(row, column)
      tokens[(row - 1) * 7 + column - 1]
    end
    
    def set_token(row, column, new_value)
      tokens[(row - 1) * 7 + column - 1] = new_value
    end
    
    def get_token_for_printing(i, j)
      tokens[i * 7 + j] || ' '
    end
    
    def winning_line_starting_at(row1, column1)
      return false if get_token(row1, column1).nil?
      other_end_candidates = find_other_end_candidates(row1, column1)
      other_end_candidates.each do |row2, column2|
        if winning_color = check_if_line_wins(row1, column1, row2, column2)
          return winning_color 
        end
      end
      false
    end
    
    def find_other_end_candidates(row, column)
      [
        [row + 3, column],
        [row + 3, column + 3],
        [row, column + 3],
        [row - 3, column + 3],
        [row - 3, column],
        [row - 3, column - 3],
        [row, column - 3],
        [row + 3, column - 3]
      ].select do |row, column|
        row.between?(1,6) && column.between?(1,7)
      end
    end
    
    def check_if_line_wins(row1, column1, row2, column2)
      token = get_token(row1, column1)
      
      row = row1
      column = column1
      until row == row2 && column == column2
        return false if get_token(row, column) != token
        row = row2 > row1 ? row + 1 : row - 1 if row1 != row2
        column = column2 > column1 ? column + 1 : column - 1 if column1 != column2
      end
        
      token
    end
  
  class FullColumnError < ArgumentError
    def initialize(default_message = "Selected column is full!")
      super(default_message)
    end
  end
  
end