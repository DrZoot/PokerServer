=begin
  TODO make the 5 card evaluators run simultaneously in threads
  TODO make sure when they write their results that the output is thread safe (send each thread a number representing a place in an array, each thread only writes to its place. should work but needs to be tested)
=end

require "../FiveCardEvaluator"
require "../../Hand"

class SevenCardBruteForceEvaluator
  attr_reader :rank
  attr_reader :type

  def initialize(hand)
    h.combination(5).each do |c|
      e = FiveCardEvaluator.new(c)
      @type = e.type if not @type
      @rank = e.rank if not @rank
      if e.rank < @rank then
        @rank = e.rank
        @type = e.type
      end
    end
  end
end