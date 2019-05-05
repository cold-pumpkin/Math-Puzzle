N = 7
checked = {(1..N).to_a => 0} # 체크 완료의 배열
check = [(1..N).to_a]        # 체크 대상
depth = 0                    # 교환 횟수

while check.size > 0 do      # 체크 대상이 존재하는 사이, 반복
  next_check = []
  (0..(N-1)).to_a.combination(2){|i, j|  # 2군데 선택하여 교환
    check.each{|c|
      d = c.clone
      d[i], d[j] = d[j], d[i]
      if !checked.has_key?(d) then
        checked[d] = depth + 1
        next_check << d
      end
    }
  }
  check = next_check
  depth += 1
end

puts checked.values.inject(:+)
