require 'pry'

class Guesser
  def initialize(lower, upper)
    @max_guesses = determine_number_of_guesses(lower, upper)
    @limits = (lower..upper)
  end

  def play
    reset
    loop do
      display_remaining_guesses
      get_guess
      @number_of_guesses -= 1
      break if @guess == @number || @number_of_guesses.zero?
      display_too_high_or_low
    end
    display_result
  end

  private

  def determine_number_of_guesses(lower, upper)
    Math.log2(upper - lower + 1).to_i + 1
  end

  def display_remaining_guesses
    if @number_of_guesses > 1
      puts "You have #{@number_of_guesses} guesses remaining."
    else
      puts "You have 1 guess remaining."
    end
  end

  def get_guess
    loop do
      print "Enter a number between #{@limits.min} and #{@limits.max}: "
      @guess = gets.chomp.to_i
      break if @limits.include?(@guess)
      print "Invalid guess. "
    end
  end

  def display_too_high_or_low
    if @guess > @number
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
    puts ""
  end

  def display_result
    if @guess == @number
      puts "You win!"
    else
      puts "You are out of guesses. You lose."
    end
    puts "\n"
  end

  def reset
    @number = rand @limits
    @number_of_guesses = @max_guesses
  end
end

game = Guesser.new(7, 430)
game.play
game.play