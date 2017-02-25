require 'pry'

class Card
  include Comparable

  RANKINGS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    RANKINGS.index(@rank) <=> RANKINGS.index(other_card.rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

# class Deck
#   RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze

#   def initialize
#     generate_deck
#   end

#   def generate_deck
#     @deck = []
#     SUITS.each do |suit|
#       RANKS.each { |rank| @deck << Card.new(rank, suit) }
#     end
#   end

#   def draw
#     generate_deck if @deck.empty?
#     @deck.shuffle!.pop
#   end
# end

# alt LS solution

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    rest if deck.empty?
    @deck.pop
  end

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.