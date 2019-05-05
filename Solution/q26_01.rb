W, H = 10, 10
# 주차장의 배치를 설정（둘레에 보초값으로 '9'를 설정）
parking = Array.new(W + 2){Array.new(H + 2){1}}
(W + 2).times{|w|
  parking[w][0] = parking[w][H + 1] = 9
}
(H + 2).times{|h|
  parking[0][h] = parking[W + 1][h] = 9
}

# 골은 왼쪽 위에 목표 차량이 있는 상태
@goal = Marshal.load(Marshal.dump(parking))
@goal[1][1] = 2

# 개시 위치는 오른쪽 아래에 목적 차량이 있는 상태
start = Marshal.load(Marshal.dump(parking))
start[W][H] = 2

def search(prev, depth)
  target = []
  prev.each{|parking, w, h|
    # 상하 좌우로 이동
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each{|dw, dh|
      nw, nh = w + dw, h + dh
      if (parking[nw][nh] != 9) then
        # 보초값 이외의 경우 과거에 조사하지 않았는지를 조사
        temp = Marshal.load(Marshal.dump(parking))
        temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h]
        if !@log.has_key?([temp, nw, nh]) then
          # 과거에 조사하지 않은 것을 조사 대상에 추가
          target.push([temp, nw, nh])
          @log[[temp, nw, nh]] = depth + 1
        end
      end
    }
  }
  return if target.include?([@goal, W, H])
  # 너비우선탐색으로 조사
  search(target, depth + 1) if target.size > 0
end

# 탐색 완료를 기록
@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0
# 개시 위치에서 탐색 개시
search([[start, W, H - 1], [start, W - 1, H]], 0)
# 골까지의 탐색 수를 출력
puts @log[[@goal, W, H]]
