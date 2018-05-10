require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess.rb'
require 'pry'

class GuessTest < MiniTest::Test
  def test_new_guess_has_card_attached_to_it
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal card, guess.card

  end

  def test_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal "10 of Hearts", guess.response

    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    refute_equal "2 of Diamonds", card
  end

  def test_correct?
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal true, guess.correct?

    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal false, guess.correct?
  end

  def test_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal "Correct!", guess.feedback

    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal "Incorrect.", guess.feedback
  end

end
