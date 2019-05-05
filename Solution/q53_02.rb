N = 10

# 원래의 수(비트열)에 가산한 경우에 이동하는 양을 되돌려준다
def move(bit, add)
  base = 0
  N.times{|i|
    base += i + 1 if (bit & (1 << i)) > 0
  }

  # 10의 자리의 5의 알 위치를 확인
  a0, a1 = (base + add).divmod(50)
  b0, b1 = base.divmod(50)

  # 10의 자리의 1의 알 위치를 확인
  a2, a3 = a1.divmod(10)
  b2, b3 = b1.divmod(10)

  # 1의 자리의 알 위치를 확인
  a4, a5 = a3.divmod(5)
  b4, b5 = b3.divmod(5)

  # 모든 위치의 차이로 옮기는 양을 가산
  (a0 - b0).abs + (a2 - b2).abs + (a4 - b4).abs + (a5 - b5).abs
end

@memo = Hash.new(0)
@memo[(1 << N) - 1] = 0

# 10까지 더했을 때의 이동량이 최소가 될 때를 구한다
def search(bit)
  return @memo[bit] if @memo.has_key?(bit)
  min = 1000
  N.times{|i|
    if bit & (1 << i) == 0 then
      min = [min, move(bit, i + 1) + search(bit | (1 << i))].min
    end
  }
  @memo[bit] = min
end

puts search(0)
