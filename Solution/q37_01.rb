# 반전할 마스크를 설정
mask = Array.new(16)
4.times{|row|
  4.times{|col|
    mask[row * 4 + col] =
      (0b1111 << (row * 4)) | (0b1000100010001 << col)
  }
}

max = 0
# 단계 수를 저장하는 배열
steps = Array.new(1 << 16, -1)
# 모두 백에서 시작
steps[0] = 0
# 조사 대상의 배열
scanner = [0]
while scanner.size > 0 do
  check = scanner.shift
  next_steps = steps[check] + 1
  16.times{|i|
    n = check ^ mask[i]
    # 체크하지 않은 경우, 다시 조사한다
    if steps[n] == -1 then
      steps[n] = next_steps
      scanner.push(n)
      max = next_steps if max < next_steps
    end
  }
end

puts max # 최대 단계 수
puts steps.index(max).to_s(2) # 초기 상태의 칸：모두 흑
p steps.select{|i| i == -1} # 백이 되지 않는 초기 상태는 없음
