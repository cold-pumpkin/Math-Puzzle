# 세로선과 가로선
v, h = 7, 10
total = 0
# '아랫수'의 순열에 대해, 가로선의 수를 조사
(1..v).to_a.permutation.each{|final|
  start = (1..v).to_a
  cnt = 0
  v.times{|i|
    # '윗 수'의 어느 위치에 있는지를 조사한다
    move = start.index(final[i])
    if move > 0 then
      # '윗 수'를 바꿔넣음
      start[i], start[move] = start[move], start[i]
      cnt += move - i
    end
  }
  total += 1 if cnt == h
}
puts total
