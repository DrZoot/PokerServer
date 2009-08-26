require "../SevenCardBruteForceEvaluator"

f = File.open('SevenCardHandValues.csv','r+')
i = 0
f.each do |line|
  i+=1
  a = line.split(",")
  a.pop
  unless a.length > 7 then
    s = SevenCardBruteForceEvaluator.new(a)
    puts line.to_s
    puts s.rank
    puts s.type
  end
  if i > 5
    break
  end
end