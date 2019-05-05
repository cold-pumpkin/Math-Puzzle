# 루프하고 있는지 체크
def is_loop(n)
  # 맨 처음에는 3을 곱하여 1을 더함
  check = n * 3 + 1
  # 1이 될 때까지 숫자를 변화시키는 작업 반복
  while check != 1 do
    check = check.even? ? check / 2 : check * 3 + 1
    return true if check == n
  end
  return false
end

# 2~10000 내에서 짝수를 체크
puts 2.step(10000, 2).count{|i|
  is_loop(i)
}
