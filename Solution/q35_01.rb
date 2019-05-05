# 다음 눈을 취득한다
def next_dice(dice)
  right = dice.slice!(0..(dice[0].to_i - 1)).tr('123456','654321')
  dice += right
end

count = 0
(6**6).times{|i|
  # 6진수로 표현하여 '111111'을 더함으로써 1~6이 된다
  dice = (i.to_s(6).to_i + 111111).to_s
  check = Hash.new
  j = 0

  # 루프할 때까지 다음의 주사위를 찾는다
  while !check.has_key?(dice) do
    check[dice] = j
    dice = next_dice(dice)
    j += 1
  end

  # 루프한 위치를 체크하고 루프 대상이 아니라면 카운트
  count += 1 if check[dice] > 0
}
puts count
