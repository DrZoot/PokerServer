def rand_range(range)
  d = (range.last - range.first) + 1
  r = rand(d)
  return r + range.first
end

class Deck < Array
  alias :rubyShuffle :shuffle
  alias :rubyShuffle! :shuffle!
  alias :deal :pop
  
  def initialize(args={})
    defaults = {:withJokers => false, :emptyDeck => false, :shuffle => true}
    args.merge!(defaults) {|k,o,n| o}
    super()
    if not args[:emptyDeck] then
      [:spades,:clubs,:hearts,:diamonds].each do |suite|
        [2,3,5,7,11,13,17,19,23,29,31,37,41].each do |value|
          self << Card.new(value,suite)
        end
      end
    end
    if args[:withJokers] then
      self << Card.new(0,:joker)
      self << Card.new(0,:joker)
    end
    if args[:shuffle] then
      2.times do self.shuffle! end
    end
  end
  
  # Knuth Shuffle the deck
  # Mathematically guarantees that all possible deck combinations are achievable
  def shuffle
    i = self.clone
    l = i.length - 1
    i.each_index do |j|
      k = rand_range(j..l)
      i.swap!(j,k)
    end
    return i
  end
  
  def shuffle!
    i = self.shuffle
    self.replace(i)
    return self
  end
  
  def inspect
    self.each do |card|
      puts "#{card.inspect}\n"
    end
  end

  # swap two cards and return a copy of the deck with showing the changes
  def swap(a,b)
    i = self.clone
    av = i[a]
    i[a] = i[b]
    i[b] = av
    return i
  end
  
  # swap two cards in the current deck
  def swap!(a,b)
    av = self[a]
    self[a] = self[b]
    self[b] = av
    return self
  end
end