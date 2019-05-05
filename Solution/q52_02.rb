N = 11
cards = [0] * N * 2
@count = 0

def search(cards, num)
  if num == 0 then        # 맨 마지막의 판정을 0으로 변경
    @count += 1
  else
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        cards[i], cards[i + num + 1] = num, num
        search(cards, num - 1)  # 큰 쪽부터이므로 줄임
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, N)          # 맨 처음은 최대의 카드를 배치
puts @count
