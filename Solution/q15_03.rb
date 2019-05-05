N = 10      # 계단의 단 수
STEPS = 4   # 한 번에 진행하는 단 수

dp = Array.new(N + 1, 0)     # t회 이동으로 이동한 위치를 집계
cnt = 0
dp[N] = 1                    # 초기값을 설정

N.times{|i|                  # 이동횟수(최대N)
  (N + 1).times{|j|          # 이동을 시작한 단
    (1..STEPS).each{|k|
      break if k > j
      dp[j - k] += dp[j]
    }
    dp[j] = 0                # 이동을 시작한 곳은 클리어
  }
  cnt += dp[0] if i % 2 == 1 # 짝수 회 이동으로 반대 위치에 도착
}
puts cnt
