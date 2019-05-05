cnt = 0
(0..2).each{|coin500|        # 500엔 동전은 최대 2개
  (0..10).each{|coin100|     # 100엔 동전은 최대 10개
    (0..15).each{|coin50|    # 50엔 동전은 최대 15개
      (0..15).each{|coin10|  # 10엔 동전은 최대 15개
        if coin500 + coin100 + coin50 + coin10 <= 15 then
          if coin500 * 500 + coin100 * 100 +
             coin50 * 50 + coin10 * 10 == 1000 then
            cnt += 1
          end
        end
      }
    }
  }
}
puts cnt
