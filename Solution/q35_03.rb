# 다음 눈을 취득한다
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

# 탐색한 값을 기록한다(0:미 탐색, 1:루프 이외, 2:루프)
all_dice = Array.new(6 ** 6, 0)
(6**6).times{|i|
  if all_dice[i] == 0 then
    check = Array.new
    while (all_dice[i] == 0) && (!check.include?(i)) do
      check << i
      i = next_dice(i)
    end
    index = check.index(i)
    if (index) then # 루프했을 때, 그 위치 이전은 루프 이외
      check.shift(index).each{|j| all_dice[j] = 1}
      check.each{|j| all_dice[j] = 2}
    else # 이미 체크 완료된 값에 해당했을 때는 루프 이외
      check.each{|j| all_dice[j] = 1}
    end
  end
}
puts all_dice.count(1)
