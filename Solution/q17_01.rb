# 남자와 여자를 문자로 설정
@boy, @girl = "B", "G"
N = 30

def add(seq)
  # 나열할 사람 수에 도달하면 종료
  return 1 if seq.size == N

  # 30명 미만인 경우 남자를 추가하거나 오른쪽 끝이 남자인 경우 여자를 추가
  cnt = add(seq + @boy)
  cnt += add(seq + @girl) if seq[-1] == @boy
  return cnt
end

# 남자와 여자에서 개시하여 카운트
puts add(@boy) + add(@girl)
