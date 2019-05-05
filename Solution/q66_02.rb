N = 6
FREE, USED, WALL = 0, 1, 9

@memo = {}

def search(seat)
  return @memo[seat] if @memo.has_key?(seat)
  count = 0
  # 옆에 사람이 없는 좌석을 찾는다
  seat.size.times{|i|
    if seat[i] == FREE then
      if (seat[i - 1] != USED) && (seat[i + 1] != USED) then
        # 비어있다면 앉고, 다음을 탐색
        seat[i] = USED
        count += search(seat)
        seat[i] = FREE
      end
    end
  }
  # 옆에 사람이 없는 좌석이 있다면 위에서 카운트한 값, 그 외에는 계승
  @memo[seat] = (count > 0) ? count : (1..seat.count(FREE)).inject(:*)
end

puts search([WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL])
