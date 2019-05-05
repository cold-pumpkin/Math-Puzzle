N = 8                     # 각 색의 수
start = (1 << N) - 1      # 시작 상태(0이 N개, 1이 N개)
mask = (1 << N * 2) - 1   # 비트마스크

# 골 상태(0과1을 번갈아 설정)
goal1 = 0
N.times{|i| goal1 = (goal1 << 2) + 1}
goal2 = mask - goal1

# 교환 횟수
count = N * 2
(1 << N*2).times{|i|   # 교환하는 시작 위치의 비트열
  turn = i ^ (i << 1) ^ (i << 2)
  turn = (turn ^ (turn >> (N * 2))) & mask

  # 골과 일치하면 교환하는 위치에 있는 수의 최소치를 판정
  if (start ^ turn == goal1) || (start ^ turn == goal2) then
    count = [count, i.to_s(2).count('1')].min
  end
}
puts count
