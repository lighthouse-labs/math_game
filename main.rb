# Module that allows a match question to be asked
module Question
  def ask_question
    @num1 = rand(20)
    @num2 = rand(20)
  
    actual_answer = @num1 + @num2
    puts "What does #{@num1} + #{@num2} equal?"
    return actual_answer
    # puts "this is the answer to the question #{actual_answer}"
  end
end

class Game
  attr_accessor :player1, :player2
  include Question

  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

  def play_the_game
    current_lives = @player1.number_of_lives

    while current_lives > 0 do
      answer = ask_question
      user_input = @player1.get_user_input

      if user_input.to_i == answer.to_i
        puts "This is right"
      
      else 
        puts "This is not right"
        current_lives -= 1
        puts "#{current_lives} remaining"
        reduce_life = @player1.reduce_lives
      end
    end
  end
end

class Player < Game
  include Question

  attr_accessor :number_of_lives

  def initialize
    @number_of_lives = 3
  end

  def get_user_input
    "What is your answer?"
    gets.chomp
  end

  def reduce_lives
    @number_of_lives -= 1
    return @number_of_lives
  end
end

new_game = Game.new

# player1 = Player.new
# player1.reduce_lives

new_game.play_the_game

# new_game.get_player