CARD_RANKINGS = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
HAND_RANKINGS = [:straight_flush?, :four_of_a_kind?, :full_house?, :flush?, 
                 :straight?, :three_of_a_kind?, :two_pair?, :one_pair?,
                 :high_card]

class Hand
  attr_reader :hand, :sorted_hand, :high_card, :card_ranks, :hand_ranking

  def initialize(hand)
    @hand         = hand
    @sorted_hand  = sort_hand
    @high_card    = determine_high_card
    @card_ranks   = get_ranks
    @hand_ranking = calculate_ranking
  end

  def card_rankings_index(card)
    CARD_RANKINGS.index(card[0])
  end

  def cards_with_card_count(num)
    card_ranks.select do |card|
      card_ranks.count(card) == num
    end.max
  end

  private

  def sort_hand
    hand.sort do |a, b|
      card_rankings_index(a) <=> card_rankings_index(b)
    end
  end

  def determine_high_card
    get_ranks.max { |rank| card_rankings_index(rank) }
  end

  def get_ranks
    sorted_hand.map { |card| card[0] }
  end

  def calculate_ranking
    HAND_RANKINGS.each do |ranking|
      return ranking if self.send ranking 
    end
  end

  def card_multiples(num)
    card_ranks.any? do |rank|
      card_ranks.count(rank) == num
    end
  end

  def one_pair?
    card_ranks.uniq.one? do |rank|
      card_ranks.count(rank) == 2
    end
  end

  def two_pair?
    pair_count = 0

    card_ranks.uniq.one? do |rank|
      pair_count += 1 if card_ranks.count(rank) == 2
    end

    pair_count == 2
  end

  def three_of_a_kind?
    card_multiples(3)
  end

  def four_of_a_kind?
    card_multiples(4)
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def sequence?

  end

  def straight?
    if card_ranks == ['2', '3', '4', '5', 'A']
      return true
    end

    current_card_rankings_index = card_rankings_index(sorted_hand.first)

    sorted_hand[1..4].each do |card|
      if card_rankings_index(card) == current_card_rankings_index + 1
        current_card_rankings_index = card_rankings_index(card)
      else
        return false
      end
    end

    true
  end

  def flush?
    suit = hand.first[1]
    hand.all? { |card| card[1] == suit }
  end

  def straight_flush?
    straight? && flush?
  end
end

class Poker
  attr_reader :hands
  attr_accessor :winners

  def initialize(hands)
    @hands = hands.map { |hand| Hand.new(hand) }
    @winners = []
  end

  def best_hand
    top_ranking = determine_top_ranking
    
    add_to_winners { |hand| hand.hand_ranking == top_ranking }

    if winners.size > 1
      self.winners = break_tie(top_ranking)
    end

    winners.map { |hand| hand.hand }
  end

  private

  def break_tie(top_ranking)
    case top_ranking
    when :four_of_a_kind?
      select_winner_high_card_from_card_count(4)
    when :full_house?
      select_winner_high_card_from_card_count(3)
    when :three_of_a_kind?
      select_winner_high_card_from_card_count(3)
    when :two_pair?
      select_winner_high_card_from_card_count(2)
    when :one_pair?
      select_winner_high_card_from_card_count(2)
    else
      select_winner_high_card
    end
  end

  def determine_top_ranking
    hands.min do |a, b|
      HAND_RANKINGS.index(a.hand_ranking) <=> HAND_RANKINGS.index(b.hand_ranking)
    end.hand_ranking
  end

  def top_high_card
    top_card_index = winners[0].card_rankings_index(winners[0].high_card)

    winners.each do |hand|
      if hand.card_rankings_index(hand.high_card) > top_card_index
        top_card_index = hand.card_rankings_index(hand.high_card)
      end
    end

    CARD_RANKINGS[top_card_index]
  end

  def add_to_winners
    hands.each do |hand|
      winners << hand if yield(hand)
    end
  end

  def select_winner_high_card
    winners.select { |hand| hand.high_card == top_high_card } 
  end

  def select_winner_high_card_from_card_count(num)
    top_rank = winners.map { |hand| hand.cards_with_card_count(num) }.max
    winners.select { |hand| hand.cards_with_card_count(num) == top_rank}
  end
end
