require_relative 'board'
require_relative 'token'

class Game
  
  def initialize(board)
    @board = board
    @token_colours = [:blue, :yellow]
    @current_colour = :yellow
  end
  
  def start
    loop do
     begin
       puts "\n#{current_player_color} player's turn."
       puts @board
       print "Choose a column to place your token in (1-7): "
       choice = STDIN.gets.chomp.to_i
       @board.insert_token(choice, Token.new(@current_colour))
       break if @board.winner
      rescue ArgumentError
       puts "\n-- Invalid column, try again. --"
       retry
      else
        swap_player
      end
    end
    puts @board
    puts "#{current_player_color} player won!"
  end
  
  private
  
    def swap_player
      @current_colour = @token_colours.select { |c| c != @current_colour }.first
    end
    
    def current_player_color
      @current_colour.to_s.capitalize 
    end
    
end