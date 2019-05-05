# 세로선과 가로선
v, h = 7, 10
total = 0
# '아랫수'의 위치에 대해, 교환할 필요가 있는 수를 카운트
(0..(v-1)).to_a.permutation.each{|final|
  cnt = 0
  v.times{|i|
    cnt += final.take_while{|j| j != i}.count{|k| k > i}
  }
  total += 1 if cnt == h
}
puts total
