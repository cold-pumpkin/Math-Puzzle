ip = Array.new
(1 << 16).times{|i|
  # 16비트의 수를 반전한다
  j = ('%016b' % i).reverse.to_i(2)

  # 10진수의 도트 구분 문자열을 생성
  s = '%d.%d.%d.%d' % [i>>8, i&0xff, j>>8, j&0xff]

  # 10개의 숫자와 도트뿐인 경우, 배열에 추가
  ip.push(s) if s.split("").uniq.length == 11
}
puts ip.size
puts ip
