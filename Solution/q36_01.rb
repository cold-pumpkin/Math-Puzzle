# 0~9를 나타내는 비트를 정의
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 매번 모든 비트를 반전시킨 값을 초기값으로 한다
min = 63

# 0~9의 순열에 대해 보다 전환 횟수가 적은 것을 탐색한다
(0..9).to_a.permutation.each{|seq|
  sum = 0
  (seq.size - 1).times{|j|
    # 배타적 논리합을 계산하고, 1이 있는 비트 수를 카운트
    sum += (bit[seq[j]]^bit[seq[j+1]]).to_s(2).count("1")
    break if min <= sum
  }
  min = sum if min > sum
}
puts min
