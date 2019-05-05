# 정수 부분을 포함하는 경우
i = 1
while i += 1
  # 소수점을 제거하고 왼쪽에서 10문자를 취득
  str = ('%10.10f'%Math.sqrt(i)).sub('.','')[0..9]
  # 중복을 제거하고 10문자라면 종료
  break if str.split('').uniq.length == 10
end
puts i

# 소수 부분뿐인 경우
i = 1
while i += 1
  # 소수점으로 분할하여 소수 부분만을 취득
  str = ('%10.10f'%Math.sqrt(i)).split('.')[1]
  # 소수 부분의 중복을 제거하고 10문자라면 종료
  break if str.split('').uniq.length == 10
end
puts i
