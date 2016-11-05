SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8',
          '9', '10', 'J', 'Q', 'K', 'A'].freeze
WINNING_SCORE = 5
BUST_LIMIT = 21
DEALER_HIT_LIMIT = BUST_LIMIT - 4

def prompt(msg)
  puts "=> #{msg}"
end

def initialze_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == 'A'
             11
           elsif value.to_i.zero?
             10
           else
             value.to_i
           end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > BUST_LIMIT
  end

  sum
end

def busted?(cards)
  total(cards) > BUST_LIMIT
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > BUST_LIMIT
    :player_busted
  elsif dealer_total > BUST_LIMIT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  else
    prompt "It's a tie!"
  end
end

def grand_output(dealer_cards, dealer_total, player_cards, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  display_result(dealer_cards, player_cards)
end

def detect_winner(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)
  if [:player, :dealer_busted].include?(result)
    :player
  elsif [:dealer, :player_busted].include?(result)
    :dealer
  end
end

def update_score!(score, dealer_cards, player_cards)
  winner = detect_winner(dealer_cards, player_cards)
  case winner
  when :player then score[:player] += 1
  when :dealer then score[:dealer] += 1
  end
end

def display_score(score)
  puts "=============="
  prompt "Player has #{score[:player]} wins."
  prompt "Dealer has #{score[:dealer]} wins."
end

def match_winner?(score)
  score.values.include?(5)
end

def determine_match_winner(score)
  score.key(5)
end

def display_winner(score)
  winner = determine_match_winner(score)
  prompt "#{winner.to_s.capitalize} won the match!"
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  prompt "Welcome to #{BUST_LIMIT}!"
  prompt "Whoever reaches #{WINNING_SCORE} winning rounds first wins!"

  score = { player: 0, dealer: 0 }

  loop do
    deck = initialze_deck
    player_cards = []
    dealer_cards = []

    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    prompt "Dealer has #{dealer_cards[0]} and ?"
    prompt "Player has #{player_cards[0]} and #{player_cards[1]}, " \
           "for a total of #{total(player_cards)}."

    loop do
      player_turn = nil
      loop do
        prompt "Would you like to (h)it or (s)tay?"
        player_turn = gets.chomp
        break if ['h', 's'].include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'."
      end

      if player_turn == 'h'
        player_cards << deck.pop
        prompt "You chose to hit!"
        prompt "Your cards are now #{player_cards}"
        prompt "Your total is now #{total(player_cards)}"
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    player_total = total(player_cards)
    dealer_total = total(dealer_cards)
    if busted?(player_cards)
      grand_output(dealer_cards, dealer_total, player_cards, player_total)
    else
      prompt "You stayed at #{total(player_cards)}"
    end

    prompt "Dealer turn..."

    loop do
      break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_HIT_LIMIT

      prompt "Dealer hits!"
      dealer_cards << deck.pop
      prompt "Dealer's cards are now: #{dealer_cards}"
    end

    dealer_total = total(dealer_cards)
    if busted?(dealer_cards)
      grand_output(dealer_cards, dealer_total, player_cards, player_total)
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    grand_output(dealer_cards, dealer_total, player_cards, player_total)
    update_score!(score, dealer_cards, player_cards)
    display_score(score)
    break if match_winner?(score)
  end

  display_winner(score)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
