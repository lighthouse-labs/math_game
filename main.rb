# Module that allows a match question to be asked
module Question
  def ask_question
    @num1 = rand(20)
    @num2 = rand(20)
  
    actual_answer = @num1 + @num2
    puts "What does #{@num1} + #{@num2} equal?"
    puts "this is the answer to the question #{actual_answer}"
  end
end

class Game
  include Question
end

class Player < Game
  include Question

  @@number_of_lives = 3

  def get_user_input
    get.chomp
  end
end

new_game = Game.new

puts new_game.ask_question

