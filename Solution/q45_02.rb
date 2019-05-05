N = 4

def search(rows)
  return 1 if rows.size == N     # 모든 행을 탐색하면 종료
  count = 0
  (2**N).times{|row|
    # 네 귀퉁이에 ○과 ×가 교대로 되어 있는지 체크
    cross = rows.select{|r| (row & ~r) > 0 && (~row & r) > 0}
    count += search(rows + [row]) if cross.count == 0
  }
  count
end

puts search([])
