# 11부터 탐색 개시
num = 11
while true
  if num.to_s == num.to_s.reverse &&
     num.to_s(8) == num.to_s(8).reverse &&
     num.to_s(2) == num.to_s(2).reverse
    puts num
    break
  end
  # 홀수만 탐색하므로 2씩 늘림
  num += 2
end
