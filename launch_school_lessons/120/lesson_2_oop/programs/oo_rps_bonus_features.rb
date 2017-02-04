module VisualEnhancement
  def clear_screen
    system('clear') || system('clr')
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'Spock'].freeze

  attr_reader :value
end

class Rock < Move
  def initialize
    @value = 'rock'
  end

  def >(other_move)
    ['lizard', 'scissors'].include?(other_move.value)
  end

  def <(other_move)
    ['paper', 'Spock'].include?(other_move.value)
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end

  def >(other_move)
    ['rock', 'Spock'].include?(other_move.value)
  end

  def <(other_move)
    ['scissors', 'lizard'].include?(other_move.value)
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end

  def >(other_move)
    ['paper', 'lizard'].include?(other_move.value)
  end

  def <(other_move)
    ['rock', 'Spock'].include?(other_move.value)
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end

  def >(other_move)
    ['Spock', 'paper'].include?(other_move.value)
  end

  def <(other_move)
    ['rock', 'scissors'].include?(other_move.value)
  end
end

class Spock < Move
  def initialize
    @value = 'Spock'
  end

  def >(other_move)
    ['scissors', 'rock'].include?(other_move.value)
  end

  def <(other_move)
    ['paper', 'lizard'].include?(other_move.value)
  end
end

class MoveHistory
  include VisualEnhancement

  attr_reader :move_data

  def initialize
    @move_data = []
  end

  def record_round(human_move, computer_move)
    @move_data << [human_move.value, computer_move.value]
  end

  def display_move_history(human_name, computer_name)
    clear_screen
    puts "Move History:"
    1.upto(@move_data.length) do |round|
      index = round - 1
      puts "Round #{round}: #{human_name} chose " \
           "#{@move_data[index][0]}, " \
           "#{computer_name} chose #{@move_data[index][1]}."
    end
  end
end

class Score
  WINNING_SCORE = 2

  def reset_score
    @value = 0
  end

  def add_point
    @value += 1
  end

  def reached_winning_score?
    @value == WINNING_SCORE
  end

  def to_s
    if @value == 1
      "#{@value} point"
    else
      "#{@value} points"
    end
  end
end

class Player
  include VisualEnhancement

  attr_reader :move, :name, :score

  def initialize
    set_name
    @score = Score.new
  end
end

class Human < Player
  def set_name
    clear_screen
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    @name = n
  end

  def user_enters_choice
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or Spock:"
      choice = gets.chomp.downcase
      choice.capitalize! if choice == 'spock'
      break if Move::VALUES.include? choice
      puts
      puts "Sorry, invalid choice."
    end
    choice
  end

  def choose
    choice = user_enters_choice
    case choice
    when 'rock'     then @move = Rock.new
    when 'paper'    then @move = Paper.new
    when 'scissors' then @move = Scissors.new
    when 'lizard'   then @move = Lizard.new
    when 'Spock'    then @move = Spock.new
    end
  end
end

class ComputerRuleTracker
  def initialize
    @round_history = { human_won: 0, computer_chose_rock: 0 }
  end

  def update_round_history!(computer_move)
    @round_history[:human_won] += 1
    @round_history[:computer_chose_rock] += 1 if computer_move == 'rock'
  end

  def implement_rule?
    if (@round_history[:human_won]).positive?
      (@round_history[:computer_chose_rock] / @round_history[:human_won]) > 0.6
    else
      false
    end
  end
end

class Computer < Player
  attr_reader :rules

  def initialize
    super
    @rules = ComputerRuleTracker.new
    @strategy = set_strategy
  end

  def set_name
    @name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def set_strategy
    clear_screen
    choice = nil
    loop do
      puts "Would you like the computer to play with (please choose 1 or 2):"
      puts "1) adaptive rules"
      puts "2) a fixed personality?"
      choice = gets.chomp.to_i
      break if [1, 2].include?(choice)
      puts "Sorry, invalid choice."
      puts
    end
    choice == 1 ? :adaptive : :personality
  end

  def determine_personality_behavior
    case @name
    when 'R2D2'     then { 'rock' => (0..100) }
    when 'Hal'      then { 'rock' => (0..5), 'scissors' => (6..50),
                           'lizard' => (51..75), 'Spock' => (76..100) }
    when 'Chappie'  then { 'rock' => (0..33), 'paper' => (34..66),
                           'scissors' => (67..100) }
    when 'Sonny'    then { 'rock' => (0..20), 'paper' => (21..40),
                           'scissors' => (41..60), 'lizard' => (61..80),
                           'Spock' => (81..100) }
    when 'Number 5' then { 'paper' => (0..50), 'Spock' => (51..100) }
    end
  end

  def standard_choice
    Move::VALUES.sample
  end

  def personality_based_choice
    choices = determine_personality_behavior
    random_value = rand(0..100)
    choices.each do |move, range|
      return move if range.include?(random_value)
    end
  end

  def rule_based_choice
    moves = []
    Move::VALUES.each do |move|
      if move != 'rock'
        (moves << move << move)
      else
        moves << move
      end
    end
    moves.sample
  end

  def determine_choice
    if @strategy == :adaptive
      if rules.implement_rule?
        rule_based_choice
      else
        standard_choice
      end
    else
      personality_based_choice
    end
  end

  def choose
    choice = determine_choice
    case choice
    when 'rock'     then @move = Rock.new
    when 'paper'    then @move = Paper.new
    when 'scissors' then @move = Scissors.new
    when 'lizard'   then @move = Lizard.new
    when 'Spock'    then @move = Spock.new
    end
  end
end

class RPSGame
  include VisualEnhancement

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = MoveHistory.new
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "The first player to win #{Score::WINNING_SCORE} " \
         "rounds wins the match!"
  end

  def reset_score
    @human.score.reset_score
    @computer.score.reset_score
  end

  def display_goodbye_message
    puts
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def player_moves
    @human.choose
    @computer.choose
  end

  def display_moves
    puts "#{@human.name} chose #{@human.move.value}, " \
         "#{@computer.name} chose #{@computer.move.value}."
  end

  def determine_round_winner
    if @human.move > @computer.move
      @human
    elsif @human.move < @computer.move
      @computer
    elsif @human.move == @computer.move
      nil
    end
  end

  def display_round_winner(player)
    if [@human, @computer].include?(player)
      puts "#{player.name} won!"
    else
      puts "It's a tie!"
    end
    puts
  end

  def display_score
    puts "#{@human.name} has #{@human.score}. #{@computer.name} has " \
         "#{@computer.score}."
  end

  def match_winner?
    @human.score.reached_winning_score? ||
      @computer.score.reached_winning_score?
  end

  def display_match_winner
    if @human.score.reached_winning_score?
      puts "You won the match!"
    else
      puts "#{@computer.name} won the match!"
    end
  end

  def yes_or_no?(question)
    puts
    answer = nil
    loop do
      puts question + ' (y/n)'
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    return false if answer.casecmp('n').zero?
    return true if answer.casecmp('y').zero?
  end

  def play_round
    loop do
      player_moves
      @history.record_round(@human.move, @computer.move)
      display_moves
      round_winner = determine_round_winner
      display_round_winner(round_winner)
      round_winner.score.add_point if round_winner
      @computer.rules.update_round_history!(@computer.move.value) if
        round_winner == @human
      display_score
      break if match_winner?
    end
  end

  def play_match
    display_welcome_message
    loop do
      reset_score
      play_round
      display_match_winner
      break unless yes_or_no?('Would you like to play again?')
      clear_screen
    end
    @history.display_move_history(@human.name, @computer.name) if
      yes_or_no?('Would you like to see a history of moves before you leave?')
    display_goodbye_message
  end
end

RPSGame.new.play_match
