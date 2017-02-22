module Displayable
  def clear
    system('clear') || system('cls')
  end

  def joinor(arr, delimiter=', ', word='or')
    joinor_arr = arr.map { |el| el }

    joinor_arr[-1] = "#{word} #{joinor_arr.last}" if joinor_arr.size > 1

    joinor_arr.size > 2 ? joinor_arr.join(delimiter) : joinor_arr.join(' ')
  end

  def display_welcome_message(game)
    puts "Welcome to #{game}!"
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
end

class Participant
  attr_accessor :cards, :staying, :busted

  def initialize
    reset
  end

  def hit(deck)
    @cards << deck.deal_one_card
  end

  def stay
    @staying = true
  end

  def busted?
    total > Game::WINNING_TOTAL
  end

  def total
    if cards.any? { |card| card.name == 'Ace' }
      total_with_aces
    else
      cards.inject(0) { |sum, card| sum + card.value }
    end
  end

  def reset
    self.cards = []
    self.staying = false
    self.busted = false
  end

  private

  def total_with_aces
    non_aces = cards.reject { |card| card.name == 'Ace' }
    non_aces_total = non_aces.inject(0) { |sum, card| sum + card.value }

    number_of_aces = cards.count { |card| card.name == 'Ace' }
    value_of_aces = number_of_aces

    difference = Game::WINNING_TOTAL - non_aces_total

    number_of_aces.times do
      if value_of_aces + 10 <= difference
        value_of_aces += 10
      end
    end

    value_of_aces + non_aces_total
  end
end

class Card
  attr_accessor :name, :value, :dealt

  def initialize(name, value)
    @name = name
    @value = value
    @dealt = false
  end

  def to_s
    @name
  end
end

class Deck
  CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  attr_accessor :cards

  def initialize
    @cards = []
    build_deck
  end

  def build_deck
    CARDS.each do |card|
      4.times do
        cards << if card.to_i.to_s == card
                   Card.new(card, card.to_i)
                 elsif card == 'Ace'
                   Card.new(card, 1)
                 else
                   Card.new(card, 10)
                 end
      end
    end
  end

  def deal_one_card
    if cards.all? { |card| card.dealt == true }
      cards.each { |card| card.dealt = false }
    end

    dealt_card = cards.select do |card|
      card.dealt == false
    end.sample

    dealt_card.dealt = true

    dealt_card
  end
end

class Game
  include Displayable

  WINNING_TOTAL = 21
  INITIAL_CARDS = 2
  DEALER_STAY_VALUE = 17

  attr_accessor :deck

  def initialize
    @deck = Deck.new
    @player = Participant.new
    @dealer = Participant.new
  end

  def start
    clear
    display_welcome_message('Twenty-One')

    loop do
      gameplay
      show_result
      break unless play_again?
      clear
      reset_hands
      display_play_again_message
    end

    display_goodbye_message('Twenty-One')
  end

  private

  def gameplay
    deal_cards
    display_cards
    player_turn
    return if @player.busted
    dealer_turn
  end

  def deal_cards
    INITIAL_CARDS.times { @player.cards << @deck.deal_one_card }
    INITIAL_CARDS.times { @dealer.cards << @deck.deal_one_card }
  end

  def display_cards
    puts "Dealer has: #{@dealer.cards[0]} and unknown card."
    puts "You have: #{joinor(@player.cards, ', ', 'and')}."
    puts ""
  end

  def player_turn
    loop do
      choice = player_hit_or_stay

      case choice[0]
      when 'h' then @player.hit(deck)
      when 's' then @player.stay
      end

      @player.busted = true if @player.busted?
      break if @player.staying || @player.busted
      clear
      display_cards
    end
  end

  def player_hit_or_stay
    answer = nil
    loop do
      puts "(h)it or (s)tay?"
      answer = gets.chomp
      break if ['h', 's'].include?(answer[0])
      puts "Sorry, not a valid choice."
    end
    answer
  end

  def dealer_turn
    until @dealer.total >= DEALER_STAY_VALUE
      @dealer.hit(deck)
    end

    if @dealer.total > WINNING_TOTAL
      @dealer.busted = true
    else
      @dealer.stay
    end
  end

  def display_final_cards
    clear
    puts "Dealer has: #{joinor(@dealer.cards, ', ', 'and')}."
    puts "You have: #{joinor(@player.cards, ', ', 'and')}."
    puts ""
    puts "Dealer total: #{@dealer.total}. Your total: #{@player.total}"
    puts
  end

  def show_result
    display_final_cards
    if @player.busted
      puts "You busted! Dealer won!"
    elsif @dealer.busted
      puts "Dealer busted! You won!"
    elsif @player.total > @dealer.total
      puts "You won!"
    elsif @player.total < @dealer.total
      puts "Dealer won!"
    else
      puts "It's a draw!"
    end
    puts ""
  end

  def reset_hands
    @player.reset
    @dealer.reset
  end
end

Game.new.start
