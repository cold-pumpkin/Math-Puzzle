# 골을 초기값으로서 설정
memo = {0x000fff => 0, 0xfff000 => 0, 0xcccccc => 0, 0x333333 => 0}
queue = memo.keys
W, H = 4, 6

# 교환 가능한 위치를 설정
mask = []
(W * H).times{|i|
  mask.push((1 << 1 | 1) << i) if i % W < W - 1 # 가로로 이웃한다
  mask.push((1 << W | 1) << i) if i < W * (H - 1) # 세로로 이웃한다
}

depth = 0
while queue.size > 0 do # 탐색해야 하는 것이 있는 한 반복한다
  p [depth, queue.size]
  depth += 1
  next_queue = []
  queue.map{|q|
    mask.each{|m|
      # 2군데가 '둘다 0'이거나 '둘다 1'인 경우 이외에서 미탐색 부분을 탐색
      if ((q & m) != 0) && ((q & m) != m) && !memo.key?(q ^ m) then
        memo[q ^ m] = depth
        next_queue.push(q ^ m)
      end
    }
  }
  queue = next_queue
end
