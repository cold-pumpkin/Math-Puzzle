val = []
256.times{|i|
  # 0~255에서 반전
  rev = ('%08b'%i).reverse.to_i(2)

  if i < rev then
    s = i.to_s + rev.to_s
    # 0~9가 중복되지 않는 숫자라면 대상으로 한다
    val.push([i, rev]) if s.split('').uniq.size == s.length
  end
}

ip = []
val.combination(2){|a, b|
  # 0~9를 한 번 씩 사용하고 있으면 짝으로 한다
  ip.push([a, b]) if (a + b).join.split('').uniq.size == 10
}
# 짝의 조합 수를 출력
puts ip.size * 8
