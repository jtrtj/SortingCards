require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck.rb'
require 'pry'

class DeckTest < MiniTest::Test

  def test_can_add_cards_to_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_can_count_cards_in_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Jack", "Hearts")
    card_5 = Card.new("5", "Spades")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

    assert_equal 5, deck.count
  end

  def test_deck_can_be_sorted
    skip
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_2, card_1, card_3], deck.sort
  end

end
