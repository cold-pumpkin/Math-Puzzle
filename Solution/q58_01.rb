# 탐색할 사이즈 설정
W, H = 4, 4

# 탐색할 함수
# pos : 탐색할 위치
# cells : 셀이 사용 완료되었는지 아닌지를 전체 셀에 대해 true/false로 저장
# is1x1 : 1×1의 셀이 있는지 없는지
# 반환값 : 병합으로 만들 수 있는 패턴 수와, 1×1의 셀이 없는 패턴 수
def search(pos, cells, is1x1)
  if pos == W * H then # 탐색 종료
    if is1x1 then
      return [1, 0]
    else
      return [1, 1]
    end
  end

  # 탐색할 위치가 탐색 완료된 경우, 다음 위치로 이동
  return search(pos + 1, cells, is1x1) if cells[pos]

  # 장방형을 순차적으로 탐색
  x, y = pos % W, pos / W
  result = [0, 0]
  (1..(H - y)).each{|dy|    # 수직 방향의 크기
    (1..(W - x)).each{|dx|  # 수평 방향의 크기
      next_cells = cells.clone
      settable = true       # 장방형을 설정할 수 있는가
      dy.times{|h|
        dx.times{|w|
          if next_cells[(x + w) + (y + h) * W] then
            # 이미 설정 완료된 경우
            settable = false
          else
            next_cells[(x + w) + (y + h) * W] = true
          end
        }
      }
      if settable then
        # 장방형을 설정 가능한 경우, 설정하여 다음을 탐색
        res = search(pos + 1, next_cells,
                     is1x1 || (dx == 1 && dy == 1))
        result[0] += res[0]
        result[1] += res[1]
      end
    }
  }
  return result
end

# 셀의 초기화
cells = Array.new(W * H, false)
puts search(0, cells, false)
