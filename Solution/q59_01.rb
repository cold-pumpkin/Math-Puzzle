# 판 사이즈
W, H = 5, 4

def check(color, del)
  color.delete(del)
  # 이동처를 설정
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 이동처에 같은 색이 있다면 그 방향을 탐색
  check(color, left) if (del % W > 0) && color.include?(left)
  check(color, right) if (del % W != W - 1) && color.include?(right)
  check(color, up) if (del / W > 0) && color.include?(up)
  check(color, down) if (del / W != H - 1) && color.include?(down)
end

# 판의 초기화
map = (0.. W*H-1).to_a
count = 0
map.combination(W * H / 2){|blue|             # 절반을 파란색으로 한다
  if blue.include?(0) then                    # 왼쪽 위는 파란색으로 고정
    white = map - blue                        # 나머지가 흰색
    check(blue, blue[0])                      # 파란색이 연결되어 있는가
    check(white, white[0]) if blue.size == 0  # 흰색이 연결되어 있는가
    count += 1 if white.size == 0         # 둘 다 연결되어 있다면 카운트
  end
}
puts count
