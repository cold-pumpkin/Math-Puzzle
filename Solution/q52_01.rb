N = 11
cards = [0] * N * 2      # 카드의 초기값
@count = 0

def search(cards, num)
  if num == N + 1 then   # 맨 마지막까지 놓을 수 있으면 성공
    @count += 1
  else
    # 놓을 수 있는지 여부를 체크하면서 순서대로 배치
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        # 놓을 수 있는 경우는 카드를 배치하고 재귀적으로 탐색
        cards[i], cards[i + num + 1] = num, num
        search(cards, num + 1)
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, 1)         # 맨 처음은 '1'의 카드를 배치
puts @count
