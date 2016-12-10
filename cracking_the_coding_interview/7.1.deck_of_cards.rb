module Base
  class Deck < Array
    class Card < Struct.new(:rank, :suit)
      SUITS = %w(♣ ♦ ♥ ♠)
      RANKS = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)

      def value
        case rank
        when 'Jack', 'Queen', 'King'
          10
        when 'Ace'
          11
        else
          rank.to_i
        end
      end

      def to_s
        return "#{rank} #{suit}"
      end
    end

    def initialize
      Card::RANKS.each do |rank|
        Card::SUITS.each do |suit|
          self << Card.new(rank, suit)
        end
      end
    end

    def deal_hand number
    end

    # def shuffle
    # end

    # def pull

    # end

    # def push
    # end
  end

  def Hand
    attr_accessor :cards

    def add card
      cards << card
    end
  end
end
##############################################
###### BlackJack
##############################################

module BlackJack
  class Hand < Base::Hand
    attr_accessor :cards

    def score #for blackjack i guess
      cards.inject(0) {|sum, card| sum += card.value }
    end

    def busted?

    end

    def black_jack?
      is_21?
    end

    def is_21?
      score == 21
    end
  end

  class Card < Base::Card
    def score

    end
  end

end


deck = Deck.new

puts deck.map(&:to_s)