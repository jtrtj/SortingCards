require './lib/card.rb'
require './lib/guess.rb'

class Deck
  attr_reader :cards,
              :count

  def initialize(cards)
    @cards = cards
    @count = @cards.length
  end

  def sort
    cards_amount = @cards.length
    cards_value_array = 
    loop do
      swapped = false

      @cards.(cards_amount - 1).times do |card|
        if card.value > card.value[[card.value] +1]
          card.value , card.value[[card.value] +1] = card.value[[card.value] +1], card.value
          swapped = true
        end
      end

      break if swapped = false
    end
    @cards
  end

end
