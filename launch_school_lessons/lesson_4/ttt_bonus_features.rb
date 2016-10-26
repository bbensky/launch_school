INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

FIRST_PLAYER = 'choose'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system('clear') || system('cls')
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { player: 0, computer: 0 }
end

def choose_first_player
  first_player = ""
  loop do
    prompt "Who should go first?"
    prompt "'p' for Player, 'c' for Computer?"
    first_player = gets.chomp.downcase
    break if ['p', 'c'].include?(first_player[0])
    prompt "Sorry, that is not a valid answer."
  end
  first_player == 'p' ? :player : :computer
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(squares, mark = ', ', connector = 'or')
  if squares.size > 2
    squares.join(mark).insert(-2, "#{connector} ")
  else
    squares.join(" #{connector} ")
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd, marker)
  WINNING_LINES.each_with_object(nil) do |line, square|
    next unless brd.values_at(*line).count(marker) == 2
    square = line.find { |square| brd[square] == INITIAL_MARKER }
    break(square) if square
  end
end

def computer_places_piece!(brd)
  square = find_at_risk_square(brd, COMPUTER_MARKER)

  if !square
    square = find_at_risk_square(brd, PLAYER_MARKER)
  end

  if !square
    square = 5 if brd[5] == ' '
  end

  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == :player
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == :player ? :computer : :player
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return :player
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return :computer
    end
  end
  nil
end

def update_score!(score, winner)
  score[winner] += 1
end

def match_winner?(score)
  !!detect_match_winner(score)
end

def detect_match_winner(score)
  score.key(5)
end

loop do
  score = initialize_score
  system 'clear'
  prompt "Welcome to Tic Tac Toe!"
  prompt "The first player to win 5 rounds wins the match."

  first_player = if FIRST_PLAYER == 'choose'
                   choose_first_player
                 else
                   FIRST_PLAYER == 'player' ? :player : :computer
                 end

  prompt "#{first_player.to_s.capitalize} goes first. Press Enter to begin."
  gets.chomp

  loop do
    board = initialize_board
    current_player = first_player
    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winner = detect_winner(board)
      update_score!(score, winner)
      prompt "#{winner.to_s.capitalize} won this round!"
    else
      prompt "It's a tie!"
    end

    prompt "Player: #{score[:player]} wins. Computer: #{score[:computer]} wins."
    break if match_winner?(score)
    prompt "Press Enter to continue."
    gets.chomp
  end

  prompt "#{detect_match_winner(score).capitalize} won the match!"

  play_again = ''
  loop do
    prompt "Play again? (y or n)"
    play_again = gets.chomp.downcase
    break if ['y', 'n'].include?(play_again[0])
    prompt "That is not a valid answer."
  end
  break if play_again.start_with?('n')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
