# 격자점의 수를 설정
W, H = 5, 4
# 이동하는 방향
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]

@map = Array.new(W * H, false)

# 재귀적으로 탐색한다
def search(x, y, depth)
  return 0 if x < 0 || W <= x || y < 0 || H <= y || @map[x + y * W]
  return 1 if depth == W * H
  cnt = 0
  @map[x + y * W] = true
  @move.each{|m| # 상하좌우로 이동
    cnt += search(x + m[0], y + m[1], depth + 1)
  }
  @map[x + y * W] = false
  return cnt
end

count = 0
(W * H).times{|i|
  count += search(i % W, i / W, 1)
}
# 시작점과 끝점이 반대인 패턴은 동일하다고 간주하므로 절반으로 한다
puts count / 2
