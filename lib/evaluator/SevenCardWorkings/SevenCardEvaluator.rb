cards = [2,3,5,7,11,13,17,19,23,29,31,37,41,2,3,5,7,11,13,17,19,23,29,31,37,41,2,3,5,7,11,13,17,19,23,29,31,37,41,2,3,5,7,11,13,17,19,23,29,31,37,41]
f = File.open('SevenCardHandValues.csv','r+')
e = cards.combination(7)
j = 0
k = 0
e.each do |p|
  p.each do |i|
    f.print("#{i.to_s},")
  end
  f.print("\n")
  f.flush
  j+=1
  k+=1
  if k > 10000 then
    puts j
    k = 0
  end
  if j > 134000000 then
    break
  end
end


