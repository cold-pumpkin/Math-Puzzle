# 사이즈의 설정
W, H = 4, 4
# 격자점으로부터 상하좌우로 선이 나와 있는지 없는지
# U: 상, D: 하, L: 좌, R: 우
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 격자점의 수는 내측이므로, 행과 열이 1적다
@width, @height = W - 1, H - 1
# 격자점으로서 가능한 형을 설정
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@row = {}

# 1행에서의 상하의 연결 방법을 작성
def make_row(cell)
  if cell.size == @width then   # 1행분을 작성할 수 있었을 때
    u = cell.map{|l| l & U > 0} # 윗방향으로 선이 나와 있는 위치(T/F)
    d = cell.map{|l| l & D > 0} # 아랫방향으로 선이 나와 있는 위치(T/F)
    if @row.has_key?(u) then
      @row[u][d] = @row[u].fetch(d, 0) + 1
    else
      @row[u] = {d => 1}
    end
    return
  end
  @dir.each{|d|
    # 왼쪽 끝 또는 왼쪽 옆으로부터의 선이 오른쪽으로부터의 선과 일치한다.
    if (cell.size == 0) ||
       ((d & L > 0) == (cell.last & R > 0)) then
      make_row(cell + [d])
    end
  }
end

make_row([])

# 맨 처음의 행에서 아래로 선이 나와 있는 건수를 합계
count = Hash.new(0)
@row.each{|up, down|
  down.each{|k, v| count[k] += v }
}

# 두 번째 행 이후에 대해, 앞의 행과 연결되는 수를 합계
h = 1
while h < @height do
  new_count = Hash.new(0)
  count.each{|bar, cnt|
    @row[bar].each{|k, v| new_count[k] += cnt * v }
  }
  h += 1
  count = new_count
end

p count.inject(0){|sum, (k, v)| sum + v}
