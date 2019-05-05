n = 5

# 순방향으로 탐색하는 초기값
fw = [(1..n*2).to_a]
# 역방향으로 탐색하는 초기값
bw = [(1..n*2).to_a.reverse]

depth = 1
while true do
  # 순방향으로 탐색
  fw = fw.each_with_object([]) do |c, result|
    1.upto(n){|i| result << c[i, n] + c[0, i] + c[i + n..-1]}
  end
  break if (fw & bw).size > 0
  depth += 1

  # 역방향으로 탐색
  bw = bw.each_with_object([]) do |c, result|
    1.upto(n){|i| result << c[n, i] + c[0, n] + c[i + n..-1]}
  end
  break if (fw & bw).size > 0
  depth += 1
end

puts depth
