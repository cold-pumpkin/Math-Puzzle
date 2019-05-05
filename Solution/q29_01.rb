# 배열의 직적을 계산
def product(ary)
  result = ary[0]
  1.upto(ary.size - 1){|i|
    result = result.product(ary[i])
  }
  result.map{|r| r.flatten}
end

# 병렬인 경우 저항값을 산출
def parallel(ary)
  #1.0 / ary.map{|i| 1.0 / i}.inject(:+)
  Rational(1, ary.map{|i| Rational(1, i)}.inject(:+))
end

@memo = {1 => [1]}
def calc(n)
  return @memo[n] if @memo.has_key?(n)
  # 직렬
  result = calc(n - 1).map{|i| i + 1}
  # 병렬
  2.upto(n){|i|
    # 병렬로 구분하는 개수를 설정
    cut = {}
    (1..(n - 1)).to_a.combination(i - 1){|ary|
      pos = 0
      r = []
      ary.size.times{|j|
        r.push(ary[j] - pos)
        pos = ary[j]
      }
      r.push(n - pos)
      cut[r.sort] = 1
    }
    # 구분한 위치에서 재귀적으로 저항을 설정
    keys = cut.keys.map{|c|
      c.map{|e| calc(e)}
    }
    # 저항값을 계산
    keys.map{|k| product(k)}.each{|k|
      k.each{|vv| result.push(parallel(vv))}
    }
  }
  @memo[n] = result
end

golden_ratio = 1.61800339887
min = Float::INFINITY
calc(10).each{|i|
  min = i if (golden_ratio - i).abs < (golden_ratio - min).abs
}
puts sprintf("%.10f", min)
puts min
