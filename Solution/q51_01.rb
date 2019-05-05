M, N = 6, 5   # '과자의 포장지'와 '안에 든 과자'의 수를 설정
@memo = {}    # 메모화하기 위한 해시

def search(candy, color)
  return 1 if candy == [0] * N          # 과자를 모두 포장했다
  # 메모했던 것이 있다면 그것을 사용
  return @memo[candy + [color]] if @memo.has_key?(candy + [color])

  # 포장지와 내용물이 불일치하는 것을 카운트
  cnt = 0
  candy.size.times{|i|
    if i != (color % candy.size) then   # 불일치하는 경우
      if candy[i] > 0 then              # 과자가 남아 있는 경우
        candy[i] -= 1
        cnt += search(candy, color + 1) # 다음을 탐색
        candy[i] += 1
      end
    end
  }
  @memo[candy + [color]] = cnt   # 과자의 수와 색을 메모에 저장
end
puts search([M] * N, 0)
