=begin
  TODO make the 5 card evaluators run simultaneously in threads
  TODO make sure when they write their results that the output is thread safe (send each thread a number representing a place in an array, each thread only writes to its place. should work but needs to be tested)
=end

require "FiveCardEvaluator"
require "Hand"

class SevenCardBruteForceEvaluator
  attr_reader :rank
  attr_reader :type
  
  Permutations = [
    [ 0, 1, 2, 3, 4 ],
    [ 0, 1, 2, 3, 5 ],
    [ 0, 1, 2, 3, 6 ],
    [ 0, 1, 2, 4, 5 ],
    [ 0, 1, 2, 4, 6 ],
    [ 0, 1, 2, 5, 6 ],
    [ 0, 1, 3, 4, 5 ],
    [ 0, 1, 3, 4, 6 ],
    [ 0, 1, 3, 5, 6 ],
    [ 0, 1, 4, 5, 6 ],
    [ 0, 2, 3, 4, 5 ],
    [ 0, 2, 3, 4, 6 ],
    [ 0, 2, 3, 5, 6 ],
    [ 0, 2, 4, 5, 6 ],
    [ 0, 3, 4, 5, 6 ],
    [ 1, 2, 3, 4, 5 ],
    [ 1, 2, 3, 4, 6 ],
    [ 1, 2, 3, 5, 6 ],
    [ 1, 2, 4, 5, 6 ],
    [ 1, 3, 4, 5, 6 ],
    [ 2, 3, 4, 5, 6 ]]
    
  def initialize(hand)
    Permutations.each do |p|
      ch = []
      p.each do |n|
        ch << hand.cards[n]
      end
      h = Hand.new(ch)
      e = FiveCardEvaluator.new(h)
      @type = e.type if not @type
      @rank = e.rank if not @rank
      if e.rank < @rank then
        @rank = e.rank
        @type = e.type
      end
    end
  end
end