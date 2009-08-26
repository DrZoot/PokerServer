class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards.flatten! || cards
  end
  
  def inspect
    @cards.each do |c|
      c.inspect
    end
  end
end