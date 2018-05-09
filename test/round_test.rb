require 'minitest/autorun'
require 'minitest/pride'
require './lib/round.rb'
require 'pry'

class DeckTest < MiniTest::Test

  def test_new_round_has_array_of_new_deck_as_deck_instance
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal round.deck, deck
  end

  def test_new_round_starts_with_empty_guesses_array
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_when_round_starts_current_card_is_first_in_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_round_records_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")

    assert_instance_of Guess, round.guesses[0]
  end

  def test_guesses_count_increases
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")

    assert_equal 1, round.guesses.count
  end

  def test_can_check_first_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_records_number_of_correct_guesses
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")

    assert_equal 1, round.number_correct
  end

  def test_next_card_in_deck_becomes_current_card
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")

    assert_equal card_2, round.current_card
  end

  def test_it_adds_to_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    round.record_guess("5 of Clubs")

    assert_equal 2, round.guesses.count
  end

  def test_it_knows_when_guess_is_incorrect
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    round.record_guess("Jack of Diamonds")

    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_it_does_not_add_incorrect_guess_to_number_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    round.record_guess("Jack of Diamonds")

    assert_equal 1, round.number_correct

  end

  def test_percent_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    round.record_guess("Jack of Diamonds")
binding.pry
    assert_equal 50, round.percent_correct
  end

end
