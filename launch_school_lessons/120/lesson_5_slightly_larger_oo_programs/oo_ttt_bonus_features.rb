module Displayable
  def clear
    system('clear') || system('cls')
  end

  def joinor(arr, delimiter=', ', word='or')
    joinor_arr = arr.map { |el| el }

    joinor_arr[-1] = "#{word} #{joinor_arr.last}" if joinor_arr.size > 1

    joinor_arr.size > 2 ? joinor_arr.join(delimiter) : joinor_arr.join(' ')
  end

  def display_welcome_message(game, rounds_to_win)
    puts "Welcome to #{game}!"
    puts "The first player to win #{rounds_to_win} rounds wins the game!"
    puts ""
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def display_goodbye_message(game)
    puts "Thanks for playing #{game}! Goodbye!"
  end

  def press_enter_to_continue
    puts "Press enter to continue."
    gets.chomp
  end

  def ask_user_to_decide_first_player(human_name, computer_name)
    answer = nil
    loop do
      puts "Who would you like to start first (1 or 2)?"
      puts "1) #{human_name}"
      puts "2) #{computer_name} (your opponent)"
      answer = gets.chomp.to_i
      break if [1, 2].include?(answer)
      puts "Sorry, that's not a valid answer."
      puts ""
    end
    answer == 1 ? :human : :computer
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def [](num)
    @squares[num].marker
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker
end

class Human < Player
  include Displayable

  attr_accessor :name

  def assign_name
    name = nil
    loop do
      puts "Please enter your name."
      name = gets.chomp
      break unless name[0] == ' ' || name.length.zero?
      puts "Sorry, not a valid option."
    end
    self.name = name
    puts ""
  end

  def choose_marker
    marker = nil
    loop do
      puts "Please choose a letter between A and Z to be your marker."
      marker = gets.chomp.upcase
      break if ('A'..'Z').cover?(marker) && marker.length == 1
      puts "Sorry, not a valid option."
    end
    self.marker = marker
    puts ""
  end

  def move(unmarked_keys)
    puts "Choose a square #{joinor(unmarked_keys)}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    square
  end
end

class Computer < Player
  COMPUTER_NAMES = %w(Chico Harpo Groucho Zeppo)

  attr_reader :name

  def initialize
    @name = COMPUTER_NAMES.sample
  end

  def ai_detection(board, marker1, marker2)
    Board::WINNING_LINES.each do |line|
      squares = {}
      line.each do |number|
        squares[number] = board.squares[number].marker
      end
      if squares.values.count(marker1) == 2 &&
         squares.values.count(marker2).zero?
        return squares.key(Square::INITIAL_MARKER)
      end
    end
    nil
  end

  def detect_threat(board, human_marker, computer_marker)
    ai_detection(board, human_marker, computer_marker)
  end

  def detect_opportunity(board, human_marker, computer_marker)
    ai_detection(board, computer_marker, human_marker)
  end

  def move(board, human_marker, computer_marker)
    move = detect_opportunity(board, human_marker, computer_marker)

    move = detect_threat(board, human_marker, computer_marker) if !move

    move = 5 if board[5] == Square::INITIAL_MARKER

    move = board.unmarked_keys.sample if !move

    move
  end
end

class Score
  include Displayable

  def reset(human, computer)
    @human = human
    @computer = computer
    @score = { human: 0, computer: 0 }
  end

  def update_score!(winning_marker)
    case winning_marker
    when @human.marker then @score[:human] += 1
    when @computer.marker then @score[:computer] += 1
    end
  end

  def format_score(score)
    if score == 1
      "#{score} point"
    else
      "#{score} points"
    end
  end

  def display_score
    puts "#{@human.name} has #{format_score(@score[:human])}. " \
      "#{@computer.name} has #{format_score(@score[:computer])}."
  end

  def game_winner?
    @score.values.include?(5)
  end

  def display_game_result
    clear
    winner = (@score.key(5) == :human ? @human : @computer)
    puts "#{winner.name} won the game!"
  end
end

class TTTGame
  include Displayable

  FIRST_TO_MOVE = :choose
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
  end

  def play
    clear
    display_welcome_message('Tic Tac Toe', 5)
    set_up_initial_game_data
    clear

    loop do
      play_round
      @score.display_game_result
      break unless play_again?
      reset_round
      @score.reset(human, computer)
      display_play_again_message
    end

    display_goodbye_message('Tic Tac Toe')
  end

  private

  def assign_markers
    human.choose_marker
    computer.marker = (human.marker == 'O' ? 'X' : 'O')
  end

  def determine_first_player
    case FIRST_TO_MOVE
    when :human then @initial_game_marker = human.marker
    when :computer then @initial_game_marker = computer.marker
    else
      first_player = ask_user_to_decide_first_player(human.name, computer.name)
      @initial_game_marker = if first_player == :human
                               human.marker
                             else
                               computer.marker
                             end
    end
    @current_marker = @initial_game_marker
  end

  def set_up_initial_game_data
    human.assign_name
    assign_markers
    @score.reset(human, computer)
    determine_first_player if FIRST_TO_MOVE == :choose
  end

  def play_round
    loop do
      display_board
      player_turns
      @score.update_score!(board.winning_marker)
      display_round_result
      break if @score.game_winner?
      reset_round
    end
  end

  def player_turns
    loop do
      current_player_moves
      alternate_player
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_board
    puts "#{human.name} is a #{human.marker}. " \
         "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    board[human.move(board.unmarked_keys)] = human.marker
  end

  def computer_moves
    board[computer.move(board, human.marker, computer.marker)] = computer.marker
  end

  def current_player_moves
    human_turn? ? human_moves : computer_moves
  end

  def human_turn?
    @current_marker == human.marker
  end

  def alternate_player
    @current_marker = if @current_marker == human.marker
                        computer.marker
                      else
                        human.marker
                      end
  end

  def display_round_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won the round!"
    when computer.marker
      puts "#{computer.name} won the round!"
    else
      puts "It's a tie!"
    end

    @score.display_score
    press_enter_to_continue
  end

  def reset_round
    board.reset
    clear
    @current_marker = @initial_game_marker
  end
end

game = TTTGame.new
game.play
