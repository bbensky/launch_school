CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace].freeze
BUST_LIMIT = 21
STARTING_NUMBER_OF_CARDS = 2

def prompt(string)
  puts ">> #{string}"
end

def initialize_deck
  deck = { hearts: [], clubs: [], diamonds: [], spades: [] }
  deck.each_key do |suit|
    CARDS.each { |card| deck[suit] << card }
  end
  deck
end

def face_card?(card)
  card != card.to_s.to_i
end

def joinor(hand)
  capitalized_cards = hand.map do |card|
    face_card?(card) ? card.capitalize : card
  end

  if hand.size > 2
    hand_string = capitalized_cards.map(&:to_s).join(', ')
    hand_string.insert(hand_string.rindex(' '), ' and')
  else
    capitalized_cards.join(' and ')
  end
end

def get_player_input(message, valid_options)
  input = nil
  loop do
    prompt(message)
    input = gets.chomp.downcase
    break if valid_options[0].include?(input[0]) ||
             valid_options[1].include?(input[0])
    prompt("That is not a valid answer.")
  end
  input[0]
end

def receive_player_move
  move = get_player_input("h to hit, s to stay", [['h', 's'], ['hit', 'stay']])
  move
end

def deal_one_card!(deck, hand)
  suit = deck.keys.sample
  card = deck[suit].sample
  deck[suit].delete(card)
  hand << card
end

def initial_deal!(deck, hands)
  hands.each do |hand|
    STARTING_NUMBER_OF_CARDS.times { deal_one_card!(deck, hand) }
  end
end

def display_player_hand_and_total(player_cards, player_total)
  prompt("Player has: #{joinor(player_cards)} (total of #{player_total})")
end

def calculate_aces_value(total, aces)
  difference_with_bust_limit = BUST_LIMIT - total
  aces_counting_an_11 = 11 + (aces - 1)
  aces_counting_an_11 <= difference_with_bust_limit ? aces_counting_an_11 : aces
end

def update_total(hand)
  total = 0

  hand.each do |card|
    next if card == :ace
    total += if (2..9).cover?(card)
               card
             else
               10
             end
  end

  if hand.include?(:ace)
    total += calculate_aces_value(total, hand.count(:ace))
  end
  total
end

def busted?(player_total)
  player_total > BUST_LIMIT
end

def determine_winner(player_total, dealer_total)
  case player_total <=> dealer_total
  when 1  then :player
  when 0  then :tie
  else         :dealer
  end
end

def display_result(game_result, player_total, dealer_total)
  prompt("Player has #{player_total}, Dealer has #{dealer_total}.")
  case game_result
  when :tie    then prompt("It's a tie!")
  when :player then prompt("Player won the game!")
  else              prompt("Dealer won the game!")
  end
end

def play_again?
  get_player_input("Play again (y or n)?", [['y', 'n'], ['yes', 'no']])
end

loop do
  system('clear') || system('cls')

  deck = initialize_deck

  player_cards = []
  dealer_cards = []

  initial_deal!(deck, [player_cards, dealer_cards])

  player_total = update_total(player_cards)
  dealer_total = update_total(dealer_cards)

  prompt("Welcome to 21!")
  prompt("Dealer has: #{dealer_cards[0].to_s.capitalize} and unknown card")
  display_player_hand_and_total(player_cards, player_total)

  loop do
    player_move = receive_player_move
    if player_move == 'h'
      deal_one_card!(deck, player_cards)
      player_total = update_total(player_cards)
      display_player_hand_and_total(player_cards, player_total)
    end
    break if player_move == 's' || busted?(player_total)
  end

  if busted?(player_total)
    prompt("You busted. Dealer wins!")
  else
    prompt("You chose to stay! Your total is #{player_total}.")
  end

  if !busted?(player_total)
    loop do
      break if dealer_total >= 17
      deal_one_card!(deck, dealer_cards)
      dealer_total = update_total(dealer_cards)
    end

    if busted?(dealer_total)
      prompt("Dealer busted with a total of #{dealer_total}. You win!")
    else
      game_result = determine_winner(player_total, dealer_total)
      display_result(game_result, player_total, dealer_total)
    end
  end

  break if play_again? == 'n'
end

prompt("Thank you for playing 21! Good bye.")
