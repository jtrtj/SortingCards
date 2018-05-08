require './lib/card.rb'

class Guess
  attr_reader :response,
              :card
  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    response_array = response.split(' ')
    if response_array[0] == card.value && response_array[2] == card.suit
      true
    else
      false
    end
  end

  def feedback
    response_array = response.split(' ')
    if response_array[0] == card.value && response_array[2] == card.suit
      "Correct!"
    else
      "Incorrect."
    end
  end
end
