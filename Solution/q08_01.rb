N = 12

def move(log)
  # 맨 처음의 위치를 포함하여 N+1개 조사하면 종료
  return 1 if log.size == N + 1

  cnt = 0
  # 전후 좌우로 이동
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each{|d|
    next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
    # 탐색이 끝나지 않았으면 이동시킴
    if !log.include?(next_pos) then
      cnt += move(log + [next_pos])
    end
  }
  cnt
end

puts move([[0, 0]])
