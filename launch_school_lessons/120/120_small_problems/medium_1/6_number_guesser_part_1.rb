class PingGame
  LIMITS = (1..100)
  MAX_GUESSES = 7

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

  def display_remaining_guesses
    if @number_of_guesses > 1
      puts "You have #{@number_of_guesses} guesses remaining."
    else
      puts "You have 1 guess remaining."
    end
  end

  def get_guess
    loop do
      print "Enter a number between 1 and 100: "
      @guess = gets.chomp.to_i
      break if LIMITS.include?(@guess)
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
    @number = rand LIMITS
    @number_of_guesses = MAX_GUESSES
  end
end

game = PingGame.new
game.play
game.play