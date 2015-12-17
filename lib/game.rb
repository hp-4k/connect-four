require_relative 'board'
require_relative 'token'

class Game
  
  def initialize(board)
    @board = board
    @token_colours = [:blue, :yellow]
    @current_colour = :blue
  end
  
  def start
    until @board.winner
     begin
       puts "#{@current_colour.to_s.capitalize} player's turn."
       puts @board
       print "Choose a column to place your token in (1-7): "
       choice = gets.chomp.to_i
       @board.insert_token(choice, Token.new(@current_colour))
       swap_player
      rescue ArgumentError
       puts "Invalid column, try again."
       retry
      end
    end
  end
  
  private
  
    def swap_player
      @current_colour = @token_colours.select { |c| c != @current_colour }.first
    end
    
end