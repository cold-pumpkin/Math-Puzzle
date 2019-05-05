# 다음 눈을 취득한다
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

count = 0
(6**6).times{|i|
  check = Array.new

  # 루프할 때까지 다음 주사위를 찾는다
  while !check.include?(i) do
    check << i
    i = next_dice(i)
  end

  # 루프한 위치를 체크하고 루프 대상이 아니라면 카운트
  count += 1 if check.index(i) != 0
}
puts count
