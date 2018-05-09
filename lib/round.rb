require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'

class Round
  attr_reader :deck,
              :guesses,
              :number_correct,
              :current_card

  def initialize(deck)
    @deck           = deck
    @guesses        = []
    @number_correct = 0
    @current_card   = deck.cards[0]
  end

  def record_guess(guess)
    @guesses <<  Guess.new(guess, current_card)
    @deck.cards.rotate!

  end

  def number_correct
    @guesses.map do |guess|
      if guess.feedback == "Correct!"
        @number_correct += 1
      end
    end
    @number_correct
  end

  def current_card
    deck.cards[0]
  end

  def percent_correct
    (number_correct * 100) / @guesses.length
  end

end
