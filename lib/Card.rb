class Card
  include Comparable
  
  attr_reader :value
  attr_reader :suit
  
  def initialize(value,suit,args={})
    @value = value
    @suit = suit
  end
  
  def <=>(other)
    self.value <=> other.value
  end
  
  def name
    return @name if @name
    @name = case @value
      when 2 then "two"
      when 3 then "three"
      when 5 then "four"
      when 7 then "five"
      when 11 then "six"
      when 13 then "seven"
      when 17 then "eight"
      when 19 then "nine"
      when 23 then "ten"
      when 29 then "jack"
      when 31 then "queen"
      when 37 then "king"
      when 41 then "ace"
      else "joker"
      end
  end
  
  def binaryValue
    return @binaryValue if @binaryValue
    @binaryValue = case @value
      when 2 then 0b0000_0000_0000_0001
      when 3 then 0b0000_0000_0000_0010
      when 5 then 0b0000_0000_0000_0100
      when 7 then 0b0000_0000_0000_1000
      when 11 then 0b0000_0000_0001_0000
      when 13 then 0b0000_0000_0010_0000
      when 17 then 0b0000_0000_0100_0000
      when 19 then 0b0000_0000_1000_0000
      when 23 then 0b0000_0001_0000_0000
      when 29 then 0b0000_0010_0000_0000
      when 31 then 0b0000_0100_0000_0000
      when 37 then 0b0000_1000_0000_0000
      when 41 then 0b0001_0000_0000_0000
      else 0b0000_0000_0000_0000
      end
  end
  
  def binarySuit
    return @binarySuit if @binarySuit
    @binarySuit = case @suit
      when :spades then 0b0001
      when :clubs then 0b0010
      when :hearts then 0b0100
      when :diamonds then 0b1000
      else 0b0000
      end
  end
  
  def inspect
    if @suit != :joker 
      puts "#{self.name.capitalize} of #{@suit.to_s.capitalize}"
    else
      puts "#{self.name.capitalize}"
    end
  end
  
end