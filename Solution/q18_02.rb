def check(last_n, used, list)
  # 모두 사용 완료이며 맨 앞의 '1'과 제곱수가 되면 종료
  return [1] if used.all? && (list[1].include?(last_n))
  list[last_n].each{|i|           # 후보를 순서대로 시험한다
    if used[i - 1] == false then  # 사용 완료가 아닌 경우
      used[i - 1] = true
      result = check(i, used, list)
      # 발견한 경우 그 값을 추가하여 돌려줌
      return [i] + result if result.size > 0
      used[i - 1] = false
    end
  }
  []
end

n = 2
while true do
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  # 이웃할 가능성이 있는 후보를 작성
  list = {}
  (1..n).each{|i|
    list[i] = square.map{|s| s - i}.select{|s| s > 0}
  }
  # '1'을 사용 완료로 하여 '1'부터 탐색 개시
  result = check(1, [true] + [false] * (n - 1), list)
  break if result.size > 0
  n += 1
end
puts n
p result
