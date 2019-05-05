# 격자점의 수를 설정
W, H = 5, 4
# 이동하는 방향
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]
@log = {}

# 재귀적으로 탐색한다
def search(x, y, depth)
  return 0 if x < 0 || W <= x || y < 0 || H <= y
  return 0 if @log.has_key?(x + y * W)
  return 1 if depth == W * H
  # 절반 정도까지 탐색하면, 나머지가 연결되어 있는지 체크
  if depth == W * H / 2 then
    remain = (0..(W*H-1)).to_a - @log.keys
    check(remain, remain[0])
    return 0 if remain.size > 0
  end
  cnt = 0
  @log[x + y * W] = depth
  @move.each{|m| # 상하좌우로 이동
    cnt += search(x + m[0], y + m[1], depth + 1)
  }
  @log.delete(x + y * W)
  return cnt
end

# 연결되어 있는지를 체크한다
def check(remain, del)
  remain.delete(del)
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 이동처에 같은 색이 있다면 그 방향을 탐색
  check(remain, left) if (del % W > 0) && remain.include?(left)
  check(remain, right) if (del % W != W - 1) && remain.include?(right)
  check(remain, up) if (del / W > 0) && remain.include?(up)
  check(remain, down) if (del / W != H - 1) && remain.include?(down)
end

count = 0
(W * H).times{|i|
  count += search(i % W, i / W, 1)
}

# 시작점과 끝점이 반대인 패턴은 동일하다고 간주하므로 절반으로 한다
puts count / 2
