# 원래의 수에 가산한 경우에 이동하는 양을 되돌려준다
def move(base, add)
  # 10의 자리의 5의 알 위치를 확인
  a0, a1 = (base + add).divmod(50)
  b0, b1 = base.divmod(50)

  # 10의 자리의 1의 알 위치를 확인
  a2, a3 = a1.divmod(10)
  b2, b3 = b1.divmod(10)

  # 1의 자리의 알 위치를 확인
  a4, a5 = a3.divmod(5)
  b4, b5 = b3.divmod(5)

  # 모든 위치의 차로 옮기는 양을 가산
  (a0 - b0).abs + (a2 - b2).abs + (a4 - b4).abs + (a5 - b5).abs
end

# 이동하는 리스트에 대해 이동량을 합계
def count(list)
  cnt = total = 0
  list.each{|i|
    cnt += move(total, i)
    total += i
  }
  cnt
end

# 1~10의 순열에 대해 최소 이동량을 구한다
min = 100
(1..10).to_a.permutation(10){|s|
  min = [min, count(s)].min
}
puts min
