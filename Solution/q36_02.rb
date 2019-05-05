# 0~9를 나타내는 비트를 정의
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 배타적 논리합의 결과를 먼저 산출
flip = Array.new(10)
(0..9).each{|i|
  flip[i] = Array.new(10)
  (0..9).each{|j|
    flip[i][j] = (bit[i]^bit[j]).to_s(2).count("1")
  }
}

# 매번 전체 비트를 반전시킨 값을 초기값으로 한다
min = 63
(0..9).to_a.permutation.each{|seq|
  sum = 0
  (seq.size - 1).times{|j|
    # 저장해 둔 값을 취득
    sum += flip[seq[j]][seq[j+1]]
    break if min <= sum
  }
  min = sum if sum < min
}
puts min
