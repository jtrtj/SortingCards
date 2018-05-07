require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'

class CardTest < MiniTest::Test

  def test_it_stores_new_card_with_value
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
  end

  def test_it_stores_new_card_with_suit
    card = Card.new("Ace", "Spades")
    assert_equal "Spades", card.suit
  end
  
end
