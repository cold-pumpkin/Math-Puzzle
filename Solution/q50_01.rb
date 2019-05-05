N = 8 # 모래시계의 수
GOAL = [1] * N # 모두 1이 되면 다음에 동시에 아래로 떨어진다

count = 0
(1..N).to_a.permutation{|init| # 초기 상태를 순열로 설정
  hourglass = init
  pos = 0
  log = {} # 같은 상태가 되는지를 체크하는 로그
  while log[hourglass] != pos  # 과거에 같은 상태가 있다면 종료
    if hourglass == GOAL then  # 목표 형에 달하면 종료
      count += 1
      break
    end
    log[hourglass] = pos

    # 모래시계를 줄인다（남아 있지 않은 경우는 그대로）
    hourglass = hourglass.map{|h| h > 0 ? h - 1 : 0}
    init[pos].times{|i|        # 모래시계를 반전
      rev = (pos + i) % N
      hourglass[rev] = init[rev] - hourglass[rev]
    }
    pos = (pos + 1) % N        # 다음 위치로 이동
  end
}

puts count
