# 마방진을 배열로 설정
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]
sum_all = magic_square.inject(:+)

# 집계용의 해시
sum = Array.new(sum_all + 1){0}
# 초기값（아무 것도 더하지 않을 때가 1개）
sum[0] = 1
magic_square.each{|n|
  # 큰 쪽에서 순서대로 가산
  (sum_all - n).downto(0).each{|i|
    sum[i + n] += sum[i]
  }
}

# 합계가 최대인 것을 출력
puts sum.find_index(sum.max)
