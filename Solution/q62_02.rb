N = 5
MASK = (1 << (N * N)) - 1
# 이동한 위치를 비트 연산으로 산출
@move = [lambda{|m| (m >> 1) & 0b0111101111011110111101111},
         lambda{|m| (m << N) & MASK},
         lambda{|m| (m << 1) & 0b1111011110111101111011110},
         lambda{|m| m >> N}]

# 유효한 미로인지 판정
def enable(maze)
  man = (1 << (N * N - 1)) & (MASK - maze) # 왼쪽 위에서부터 시작
  while true do
    next_man = man
    @move.each{|m| next_man |= m.call(man)} # 상하좌우로 이동
    next_man &= (MASK - maze)        # 벽 이외의 부분이 이동 가능
    return true if next_man & 1 == 1 # 오른쪽 아래에 도달하면 유효
    break if man == next_man
    man = next_man
  end
  false
end

# map:벽의 배치
# p1, d1: 첫 번째 사람의 위치, 이동 방향
# p2, d2: 두 번째 사람의 위치, 이동 방향
def search(maze, p1, d1, p2, d2, turn)
  if turn then
    return true if p1 == p2 # 두 사람이 만났다
    # 어느 한 쪽의 골에 도착했다
    return false if (p1 == 1) || (p2 == 1 << (N * N - 1))
  end
  @move.size.times{|i| # 우수법으로 움직일 수 있는 방향을 탐색
    d = (d1 - 1 + i) % @move.size
    if @move[d].call(p1) & (MASK - maze) > 0 then
      return search(maze, p2, d2, @move[d].call(p1), d, !turn)
    end
  }
  false
end

cnt = 0
(1 << N * N).times{|maze|
  if enable(maze) then
    man_a, man_b = 1 << (N * N - 1), 1
    cnt += 1 if search(maze, man_a, 3, man_b, 1, true)
  end
}
puts cnt
