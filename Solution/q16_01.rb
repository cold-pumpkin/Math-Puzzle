MAX = 500

answer = []
(1..MAX/4).each{|c|           # 정방형의 한 변
  edge = (1..(c-1)).to_a.map{|tate| tate * (2 * c - tate)}
  edge.combination(2){|a, b|  # 장방형의 면적
    if a + b == c * c then
      answer.push([1, b / a.to_f, c * c / a.to_f])
    end
  }
}
answer.uniq!                  # 정수 배를 제외
puts answer.size
