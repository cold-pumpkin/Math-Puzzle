# 사람 수
@n = 8
# 최단 이동 거리
@min_step = 98
# 골
@goal = []
(1..@n).each{|i|
  @goal << (1..@n).to_a.reverse.rotate(i)
}

def search(child, oni, oni_pos, step, log)
  if oni == 0 then           # 맨 처음의 술래가 원에서 벗어났을 때
    if @goal.include?(child) then
      puts "#{step} #{log}"  # 이동 거리와 술래가 앉았던 위치를 표시
      @min_step = [step, @min_step].min
      return
    end
  end
  (1..(@n - 1)).each{|i|       # 현재의 술래 위치에서 순서대로 탐색
    if step + @n + i <= @min_step then
      next_child = child.clone
      pos = (oni_pos + i) % @n # 다음 술래의 위치
      next_child[pos] = oni    # 술래가 앉는다
      next_oni = child[pos]    # 다음 술래가 밖으로 나간다
      search(next_child, next_oni, pos,
             step + @n + i, log + pos.to_s)
    end
  }
end

# 맨 처음은 1위 위치에 술래가 들어간다
search([0] + (2..@n).to_a, 1, 0, @n, "0")
