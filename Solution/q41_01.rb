n = 5

# 초기값을 설정
cards = [(1..n*2).to_a]
answer = (1..n*2).to_a.reverse

depth = 1
while true do
  # 탐색
  cards = cards.each_with_object([]) do |c, result|
    1.upto(n){|i| result << c[i, n] + c[0, i] + c[i + n..-1]}
  end
  break if cards.include?(answer)
  depth += 1
end

puts depth
