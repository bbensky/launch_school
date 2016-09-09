WINNING_CONDITIONS = { 'rock' => %w(scissors lizard),
                       'paper' => %w(rock spock),
                       'scissors' => %w(paper lizard),
                       'lizard' => %w(spock paper),
                       'spock' => %w(scissors rock) }

VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'l' => 'lizard',
                  'sp' => 'spock' }

POINTS_TO_WIN = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_choice_options
  prompt("Please enter the abbreviation for your choice:")
  VALID_CHOICES.each do |abr, shape|
    prompt("#{abr} = #{shape}")
  end
end

def valid_choice?(input)
  VALID_CHOICES.key?(input)
end

def set_player_choice
  loop do
    display_choice_options
    input = Kernel.gets().chomp().downcase()
    return VALID_CHOICES[input] if valid_choice?(input)
    prompt("That's not a valid choice.")
  end
end

def round_win?(first, second)
  WINNING_CONDITIONS[first].include?(second)
end

def calculate_round_results(player, computer)
  if round_win?(player, computer)
    'player'
  elsif round_win?(computer, player)
    'computer'
  else
    'tie'
  end
end

def display_round_results(score, winner)
  if winner == 'player'
    prompt('You won this round!')
  elsif winner == 'computer'
    prompt('Computer won this round!')
  else
    prompt("It's a tie!")
  end
  prompt("You have #{score['player']} points.")
  prompt("Computer has #{score['computer']} points.")
  prompt('')
end

def add_point(score, winner)
  score[winner] = score[winner] + 1
end

def display_match_results(score)
  if score['player'] == POINTS_TO_WIN
    prompt('You won the match!')
  else
    prompt('Computer won the match!')
  end
end

loop do
  score = { 'player' => 0, 'computer' => 0 }

  prompt("Welcome to Rock Paper Scissors Lizard Spock!")
  prompt("First to #{POINTS_TO_WIN} points wins.")

  until (score['player'] == POINTS_TO_WIN) ||
        (score['computer'] == POINTS_TO_WIN)

    player_choice = set_player_choice

    computer_choice = VALID_CHOICES.values().sample()

    prompt("You chose #{player_choice}; Computer chose #{computer_choice}")

    round_winner = calculate_round_results(player_choice, computer_choice)
    add_point(score, round_winner) if round_winner != 'tie'
    display_round_results(score, round_winner)
  end

  display_match_results(score)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing. Good Bye!')
