W, H = 6, 5
# 눈금의 초기화
@puzzle = Array.new(W + 2).map{Array.new(H + 2, 0)}
(W+2).times{|w|
  (H+2).times{|h|
    if (w==0) || (w==W+1) || (h==0) || (h==H + 1) then
      @puzzle[w][h] = -1
    end
  }
}

def fill(x, y, from, to)        # 연속 체크용으로 채워 나간다
  if @puzzle[x][y] == from then
    @puzzle[x][y] = to
    fill(x - 1, y, from, to)
    fill(x + 1, y, from, to)
    fill(x, y - 1, from, to)
    fill(x, y + 1, from, to)
  end
end

def check()
  x, y = 1, 1
  x += 1 if @puzzle[x][y] == 1
  fill(x, y, 0, 2)              # 하얀 칸을 더미로 채운다
  result = (@puzzle.flatten.count(0) == 0)
  fill(x, y, 2, 0)              # 더미를 하얀 칸으로 되돌린다
  result
end

def search(x, y)
  x, y = 1, y + 1 if x == W + 1 # 오른쪽 끝에 도달하면 다음 행
  return 1 if y == H + 1        # 맨 마지막까지 탐색할 수 있으면 성공
  cnt = search(x + 1, y)        # 하얀 칸을 설정하고 다음을 탐색
  # 왼쪽이나 위쪽이 검은 칸 이외인 경우, 검은 칸을 설정하고 다음을 탐색
  if (@puzzle[x - 1][y] != 1) && (@puzzle[x][y - 1] != 1) then
    @puzzle[x][y] = 1           # 검은 칸을 설정
    cnt += search(x + 1, y) if check()
    @puzzle[x][y] = 0           # 검은 칸을 되돌린다
  end
  cnt
end

p search(1, 1)                  # 왼쪽 위에서부터 개시
