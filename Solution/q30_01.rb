N = 20

def set_tap(remain)
  return 1 if remain == 1
  cnt = 0
  # 2口
  (1..(remain / 2)).each{|i|
    cnt += set_tap(remain - i) * set_tap(i)
  }
  # 3口
  (1..(remain / 3)).each{|i|
    (1..((remain - i) / 2)).each{|j|
      cnt += set_tap(remain - (i + j)) * set_tap(j) * set_tap(i)
    }
  }
  cnt
end

puts set_tap(N)
