# 카드의 초기화
N = 100
cards = Array.new(N, false)

# 2~N까지 뒤집음
(2..N).each{|i|
  j = i - 1
  while (j < cards.size) do
    cards[j] = !cards[j]
    j += i
  end
}

# 뒷면이 위를 향한 카드를 출력
N.times{|i|
  puts i + 1 if !cards[i]
}
