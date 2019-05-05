N = 6
FREE, USED, WALL = 0, 1, 9

# 보초값으로서 양끝과 중앙에 벽을 설정
@seat = [WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL]

def search(person)
  count = 0
  # 옆에 사람이 없는 좌석을 찾는다
  @seat.size.times{|i|
    if @seat[i] == FREE then
      if (@seat[i - 1] != USED) && (@seat[i + 1] != USED) then
        # 비어있다면 앉고, 다음을 탐색
        @seat[i] = USED
        count += search(person + 1)
        @seat[i] = FREE
      end
    end
  }
  # 옆에 사람이 없는 좌석이 있다면 위에서 카운트한 값, 그 외에는 계승
  (count > 0) ? count : (1..@seat.count(FREE)).inject(:*)
end

puts search(0)
