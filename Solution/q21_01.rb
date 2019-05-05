count = 0     # '0'이 출현한 횟수
line = 1      # 현재의 행 수
row = [1]     # 현재의 행의 값

while count < 2014 do
  next_row = [1]
  # 앞의 행에서 배타적 논리합으로 다음 행을 설정
  (row.size - 1).times{|i|
    cell = row[i] ^ row[i + 1]
    next_row.push(cell)
    count += 1 if cell == 0  # '0'인 경우에 카운트
  }
  next_row.push(1)
  line += 1                  # 행 수를 늘려 다음의 행으로
  row = next_row
end

puts line        # 2014개 카운트한 행을 출력
