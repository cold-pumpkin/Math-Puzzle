# 패널의 수를 설정
W, H = 4, 3
# 비트 반전용 값
XOR_ROW = (1 << (W + 1)) - 1

# 행 단위로 탐색
def search(up, y, odds)
  # 위의 행까지 홀수의 수가 두 개보다 많은 경우는 대상 외
  return 0 if 2 < odds

  row = 1 << W | 1     # 초기값 설정

  # 맨 처음과 맨 마지막 행은 반전
  row = XOR_ROW ^ row if (y == 0) || (y == H)

  if y == H then       # 맨 마지막 행인 경우는 체크하고 종료
    odds += (row ^ up).to_s(2).count("1")   # 홀수의 수를 카운트
    return 1 if (odds == 0) || (odds == 2)  # 0이나 2개라면 대상
    return 0
  end
  cnt = 0
  (1 << W).times{|a|   # 패널의 내용（왼쪽 위로부터 오른쪽 아래의 직선 유무）
    (1 << W).times{|b| # 패널의 내용（왼쪽 아래로부터 오른쪽 위의 직선 유무）
      cnt += search(a ^ b << 1, y + 1,
                    odds + (row ^ up ^ a << 1 ^ b).to_s(2).count("1"))
    }
  }
  return cnt
end

puts search(0, 0, 0)
