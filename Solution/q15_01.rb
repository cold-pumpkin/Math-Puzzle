N = 10      # 계단의 단 수
STEPS = 4   # 한 번에 진행하는 단 수

def move(a, b)
  return 0 if a > b    # A가 B보다 위에 있으면 종료
  return 1 if a == b   # 같은 단에 멈추면 카운트
  cnt = 0
  (1..STEPS).each{|da|
    (1..STEPS).each{|db|
      cnt += move(a + da, b - db) # 재귀적으로 탐색
    }
  }
  cnt
end

# A는 0의 위치에서 B는 N의 위치에서 스타트
puts move(0, N)
