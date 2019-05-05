@n = 8
# 술래를 포함했다
@all = (0..@n).to_a

# 시작 시의 배치
start = {}
start[(1..@n).to_a] = []

# 종료 시의 배치
goal = {}
@n.times{|i|
  goal[(1..@n).to_a.reverse.rotate(i)] = []
}

# 이동 거리를 구한다
def dist(log)
  return 0 if log.size == 0
  check = log.clone
  pre = check.shift
  sum = @n + pre
  check.each{|c|
    sum += @n + (c + @n - pre) % @n
    pre = c
  }
  sum
end

# 탐색（direction이 true일 때 순방향, false일 때 역방향）
def search(child, direction)
  child.clone.each{|key, value|
    oni = (@all - key)[0] # 사용되지 않는 것이 술래
    @n.times{|i|
      k = key.clone
      k[i] = oni
      v = value + [i]
      if child.has_key?(k) then
        if direction then # 순방향
          child[k] = v if dist(v) < dist(child[k])
        else              # 역방향
          child[k] = v if dist(v.reverse) < dist(child[k].reverse)
        end
      else
        child[k] = v
      end
    }
  }
end

cnt = 0
while (start.keys & goal.keys).size == 0 do
  if cnt % 2 == 0 then # 짝수일 때는 순방향으로 탐색
    search(start, cnt % 2 == 0)
  else                 # 홀수일 때는 역방향으로 탐색
    search(goal, cnt % 2 == 0)
  end
  cnt += 1
end

# 양방향에서의 탐색 결과가 합류한 경우, 최단 이동 거리를 산출
min = 98
(start.keys & goal.keys).each{|c|
  d = dist(start[c] + goal[c].reverse)
  min = [min, d].min
}

puts min
