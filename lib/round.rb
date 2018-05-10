require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'

class Round
  attr_accessor :deck,
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
    add_new_guess_to_guesses(guess)
    next_card
  end

  def add_new_guess_to_guesses(guess)
    @guesses <<  Guess.new(guess, current_card)
  end

  def next_card
    deck.cards.rotate
  end

  def number_correct
    is_guess_correct
    @number_correct
  end

  def is_guess_correct
      if check_if_guesses_contains_any_correct_guesses == true
        increase_number_correct
      end
  end

  def check_if_guesses_contains_any_correct_guesses
    @guesses.map do |guess|
      if guess.feedback == "Correct!"
        return true
      end
    end
  end

  def increase_number_correct
    @number_correct += 1
  end


  def percent_correct
    (number_correct * 100) / @guesses.length
  end

end
