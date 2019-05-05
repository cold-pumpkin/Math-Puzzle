W, H = 6, 5                 # 가로와 세로의 칸 수
USABLE = 2                  # 사용 가능한 횟수
@max = 0                    # 최장 길이
@h = Array.new(H + 1, 0)    # 수평 방향의 선을 사용한 횟수를 저장
@v = Array.new(W + 1, 0)    # 수직 방향의 선을 사용한 횟수를 저장

def search(x, y)
  if (x == W) && (y == H) then # B에 도착하면 최대치를 확인하고 종료
    @max = [@h.inject(:+) + @v.inject(:+), @max].max
    return
  end
  if @h[y] < USABLE then    # 수평 방향으로 이동 가능할 때
    if x > 0 then           # 왼쪽으로 이동
      @h[y] += 1
      search(x - 1, y)
      @h[y] -= 1
    end
    if x < W then           # 오른쪽으로 이동
      @h[y] += 1
      search(x + 1, y)
      @h[y] -= 1
    end
  end
  if @v[x] < USABLE then    # 수직 방향으로 이동 가능할 때
    if y > 0 then           # 위로 이동
      @v[x] += 1
      search(x, y - 1)
      @v[x] -= 1
    end
    if y < H then           # 아래로 이동
      @v[x] += 1
      search(x, y + 1)
      @v[x] -= 1
    end
  end
end

search(0, 0)                # A의 위치에서 스타트
puts @max
