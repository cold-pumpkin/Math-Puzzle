a = b = 1
count = 0
while (count < 11) do
  c = a + b
  # 1자리씩으로 분할하여 각 자리의 합을 취득
  sum = 0
  c.to_s.split(//).each {|e| sum += e.to_i}
  if (c % sum == 0) then
    # 나누어 떨어진 경우 출력
    puts c
    count += 1
  end
  a, b = b, c
end
