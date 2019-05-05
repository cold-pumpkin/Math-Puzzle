def cutbar(m, n, current) # current는 현재 봉의 개수
  if current >= n then
    0 # 잘라내기 완료
  elsif current < m then
    1 + cutbar(m, n, current * 2) # 다음은 현재의 2배가 된다
  else
    1 + cutbar(m, n, current + m) # 가위 수만큼 추가
  end
end

puts cutbar(3, 20, 1)
puts cutbar(5, 100, 1)
