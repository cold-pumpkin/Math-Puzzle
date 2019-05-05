# 2개 뚫기의 가능성이 있는 방법을 설정
board = [[1, 2], [2, 3], [7, 8], [8, 9],
         [1, 4], [3, 6], [4, 7], [6, 9]]
# 1개씩 뚫는 방법을 추가
1.upto(9){|i|
  board.push([i])
}

@memo = {[] => 1}
def strike(board)
  # 이미 탐색 완료된 경우는 그 값을 사용
  return @memo[board] if @memo.has_key?(board)
  cnt = 0
  board.each{|b|
    # 뚫은 과녁에 포함되는 숫자가 있는 뚫기 방법은 제외
    next_board = board.select{|i| (b & i).size == 0}
    cnt += strike(next_board)
  }
  @memo[board] = cnt
end

puts strike(board)
