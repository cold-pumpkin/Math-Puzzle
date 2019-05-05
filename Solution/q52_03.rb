N = 11
@memo = {}

def search(cards, num)
  return 1 if num == 0
  return @memo[cards] if @memo.has_key?(cards)

  # 비트 연산에서 사이에 두는 위치를 설정
  mask = (1 << (num + 1)) + 1
  count = 0
  while mask < (1 << (N * 2)) do
    # 배치 가능하다면 재귀적으로 탐색
    count += search(cards | mask, num - 1) if cards & mask == 0
    # 사이에 두는 위치를 한 자리 이동
    mask <<= 1
  end
  @memo[cards] = count
end

puts search(0, N)
