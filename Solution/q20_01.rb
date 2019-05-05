# 마방진을 배열로 설정
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]

# 집계용의 해시
sum = Hash.new(0)
1.upto(magic_square.size){|i|
  # 조합을 전체 탐색
  magic_square.combination(i){|set|
    # 조합의 합계를 해시로 저장
    sum[set.inject(:+)] += 1
  }
}

# 합계가 최대인 것을 출력
puts sum.max{|x, y| x[1] <=> y[1]}
