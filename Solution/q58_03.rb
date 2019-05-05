# 사이즈 설정
W, H = 4, 4
# 격자점으로부터 상하좌우로 선이 나와 있는지 없는지
# U: 상, D: 하, L: 좌, R: 우를 비트열로 설정
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 격자점의 수는 내측이므로, 행과 열이 1 적다
@width, @height = W - 1, H - 1
# 격자점으로서 가능한 형을 설정（위의 설명의 순서）
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@cnt, @cnt1x1 = 0, 0
@cross = []

def search(pos)
  if pos == @width * @height then # 탐색 종료
    @cnt += 1
    # 1x1의 셀을 구한다
    cell = Array.new(W * H, true)
    @cross.each_with_index{|c, i|
      x, y = i % @width, i / @width
      cell[x + y * W] = false if (c & U == 0) || (c & L == 0)
      cell[(x+1) + y * W] = false if (c & U == 0) || (c & R == 0)
      cell[x + (y+1) * W] = false if (c & D == 0) || (c & L == 0)
      cell[(x+1) + (y+1) * W] = false if (c & D == 0) || (c & R == 0)
    }
    @cnt1x1 += 1 if cell.index(true) == nil
    return
  end
  @dir.each{|d|
    @cross[pos] = d
    # 왼쪽 끝인 경우, 또는 왼쪽 옆으로부터의 선이 오른쪽으로부터의 선과 일치한다. 
    # 또는 위쪽 끝인 경우, 또는 위쪽 옆으로부터의 선이 아래쪽으로부터의 선과 일치한다.
    if ((pos % @width == 0) ||
        ((@cross[pos] & L > 0) == (@cross[pos - 1] & R > 0))) &&
       ((pos / @height == 0) ||
        ((@cross[pos] & U > 0) == (@cross[pos - @height] & D > 0)))
    then
      search(pos + 1)
    end
  }
end

search(0)
puts @cnt
puts @cnt1x1
