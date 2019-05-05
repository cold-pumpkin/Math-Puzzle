# 짝은 6조
PAIR = 6

# 시작과 종료를 설정
start = (1..PAIR * 2 - 1).to_a + [0]
goal = [0] + (2..PAIR * 2 - 1).to_a + [1]

# 던질 수 있는 목록을 취득
def throwable(balls)
  result = []
  balls.each{|ball|
    c = ball.index(0)                     # 받는 쪽의 위치를 취득
    p = (c + PAIR) % (PAIR * 2)           # 받는 쪽의 정면을 계산
    [-1, 0, 1].each{|d|                   # 정면과 좌우
      if (p + d) / PAIR == p / PAIR then
        ball[c], ball[p + d] = ball[p + d], ball[c]
        result.push(ball.clone)           # 던진 결과를 설정
        ball[c], ball[p + d] = ball[p + d], ball[c]
      end
    }
  }
  result
end

# 초기 상태를 설정
fw = [start]
fw_log = [start]
bw = [goal]
bw_log = [goal]
cnt = 0

# 쌍방향에서의 너비우선탐색을 실행
while true do
  next_fw = throwable(fw)      # 순방향으로 다음 스텝을 취득
  fw = next_fw - fw_log        # 과거에 나타나지 않은 것을 선택
  fw_log |= next_fw            # 던진 결과를 추가
  cnt += 1
  break if (fw & bw).size > 0  # 겹치면 종료

  next_bw = throwable(bw)      # 역방향으로 다음 스텝을 취득
  bw = next_bw - bw_log        # 과거에 나타나지 않은 것을 선택
  bw_log |= next_bw            # 던진 결과를 추가
  cnt += 1
  break if (fw & bw).size > 0  # 겹치면 종료
end
puts cnt
