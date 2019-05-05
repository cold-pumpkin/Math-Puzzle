# 판 사이즈
W, H = 5, 4
@width, @height = W + 2, H + 2

NONE, BLUE, WHITE, WALL = 0, 1, 2, 9

map = Array.new(@width * @height, 0)
# 외곽을 작성
@width.times{|i|
  map[i] = WALL
  map[i + @width * (@height - 1)] = WALL
}
@height.times{|i|
  map[i * @width] = WALL
  map[(i + 1) * @width - 1] = WALL
}

# 맨 처음은 (1, 1)에서 시작
map[@width + 1] = BLUE
@maps = {map => false}

# 선택한 색으로 채우는 것을 너비우선탐색으로 재귀적으로 실행
def fill(depth, color)
  return if depth == 0
  new_maps = {}
  W.times{|w|
    H.times{|h|
      pos = w + 1 + (h + 1) * @width
      @maps.each{|k, v|
        check = false
        if k[pos] == 0 then
          [1, -1, @width, -@width].each{|d|
            check = true if k[pos + d] == color
          }
        end
        if check then
          m = k.clone
          m[pos] = color
          new_maps[m] = false
        end
      }
    }
  }
  @maps = new_maps
  fill(depth - 1, color)
end

# 파란색을 절반까지 채운다
fill(W * H / 2 - 1, BLUE)

# 하얀색을 비어 있는 맨 처음 위치에 넣는다
new_maps = {}
@maps.each{|k, v|
  pos = k.index(NONE)
  m = k.clone
  m[pos] = WHITE
  new_maps[m] = false
}
@maps = new_maps

# 하얀색을 채운다
fill(W * H / 2 - 1, WHITE)

# 모두 채워져 있는 것을 카운트
count = 0
@maps.each{|m|
  count += 1 if !(m.include?(NONE))
}
puts count
