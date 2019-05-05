N = 5
# 우수법의 이동 방향（우, 상, 좌, 하의 순）
@dx = [[1, 0], [0, -1], [-1, 0], [0, 1]]

# maze:벽의 배치
# p1, d1: 첫 번째 사람의 경로, 이동 방향
# p2, d2: 두 번째 사람의 경로, 이동 방향
def search(maze, p1, d1, p2, d2)
  if p1.size == p2.size then # 두 사람이 함께 이동한 경우
    # 두 사람이 만난 경우는 성공
    return true if p1[-1][0..1] == p2[-1][0..1]
    # 첫 번째 사람이 오른쪽 아래에 도달한 경우는 실패
    return false if p1[-1][0..1] == [N - 1, N - 1]
    # 두 번째 사람이 왼쪽 위에 도달한 경우도 실패
    return false if p2[-1][0..1] == [0, 0]
  end
  # 같은 방향에서 이동해 온 경우는 루프이므로 실패
  return false if p1.count(p1[-1]) > 1

  pre = p1[-1]
  @dx.size.times{|i| # 우수법으로 움직일 수 있는 방향을 탐색
    d = (d1 - 1 + i) % @dx.size
    px = pre[0] + @dx[d][0]
    py = pre[1] + @dx[d][1]
    # 이동처가 벽이 되어 있지 않은지 체크
    if (px >= 0) && (px < N) && (py >= 0) && (py < N) &&
       (maze[px + N * py] == 0) then
      return search(maze, p2, d2, p1 + [[px, py, d]], d)
      break
    end
  }
  false
end

a = [[0, 0, -1]]         # A:왼쪽 위(X좌표, Y좌표, 전의 이동 방향)
b = [[N - 1, N - 1, -1]] # B:오른쪽 아래(X좌표, Y좌표, 전의 이동 방향)
cnt = 0
[0, 1].repeated_permutation(N * N - 2){|maze|
  # 두 사람의 시작 위치는 반드시 통로로서 탐색
  # A는 아래로 이동(@dx[3])、B는 위로 이동(@dx[1])
  cnt += 1 if search([0] + maze + [0], a, 3, b, 1)
}
puts cnt
