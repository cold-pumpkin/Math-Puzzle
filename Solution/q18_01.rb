def check(n, pre, log, square)
  if n == log.size then
    # 모두 설정한 경우
    if square.include?(1 + pre) then
      # 1과 직전 수의 합이 제곱수인 경우
      puts n
      p log
      return true # 하나라도 발견되면 종료
    end
  else
    ((1..n).to_a - log).each{|i| # 사용하지 않는 수로 루프
      if square.include?(pre + i) then
        # 직전 수와의 합이 제곱수인 경우
        return true if check(n, i, log + [i], square)
      end
    }
  end
  false
end

n = 2
while true do
  # 제곱수를 사전에 산출（최대로도 n의 2배까지）
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  break if check(n, 1, [1], square)
  n += 1
end
