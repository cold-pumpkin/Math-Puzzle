require "prime"

# 3자리의 소수를 취득
primes = Prime.each(1000).select{|i| i >= 100}

# 맨 앞의 자리에서 해시를 작성
prime_h = {0 => []}
primes.chunk{|c| c / 100}.each{|k, v|
  prime_h[k] = v
}

cnt = 0
primes.each{|r1|                                   # 첫 번째 행
  prime_h[r1 / 100].each{|c1|                      # 첫 번째 열
    prime_h[(c1 % 100) / 10].each{|r2|             # 두 번째 행
      prime_h[(r1 % 100) / 10].each{|c2|           # 두 번째 열
        if (r2 % 100) / 10 == (c2 % 100) / 10 then # 중앙의 점
          prime_h[c1 % 10].each{|r3|               # 세 번째 행
            if c2 % 10 == (r3 % 100) / 10 then
              c3 = (r1 % 10) * 100 + (r2 % 10) * 10 + (r3 % 10)
              if primes.include?(c3) then          # 세 번째 열이 소수인가
                cnt += 1 if [r1, r2, r3, c1, c2, c3].uniq.size == 6
              end
            end
          }
        end
      }
    }
  }
}
puts cnt
