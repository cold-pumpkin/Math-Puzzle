N = 4
@count = Hash.new(0)

def search()
  # 각 행을 수치로 설정
  (0..(2**N-1)).to_a.repeated_permutation(N).each{|rows|
    # 각 열의 '○'의 수를 카운트
    col_count = Array.new(N, 0)
    N.times{|c|
      rows.each{|r|
        col_count[c] += 1 if (r & (1 << c) > 0)
      }
    }
    # 각 행의 '○'의 수를 카운트
    row_count = rows.map{|r| r.to_s(2).count("1")}
    # 해시에 행과 열의 카운트로 집계
    @count[row_count + col_count] += 1
  }
end

search()
# 한 가지로 배치할 수 있는 것을 출력
puts @count.select{|k, v| v == 1}.count
