N = 16
def graycode(value)
  # N진수를 각 자리의 배열로 분해
  digits = []
  while value > 0
    digits << value % N
    value /= N
  end

  # 각 자리를 그레이코드로 변환
  (digits.size - 1).times{|i|
    digits[i] = (digits[i] - digits[i + 1]) % N
  }
  # 배열을 수치로 변환
  digits.each_with_index.map{|d, i| d * (N**i)}.inject(:+)
end

# 맨 처음으로 되돌아올 때까지 탐색
def search(value)
  check = graycode(value)
  cnt = 1
  while check != value do
    check = graycode(check)
    cnt += 1
  end
  cnt
end

puts search(0x808080)
puts search(0xabcdef)
