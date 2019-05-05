club = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14],
        [1800, 16], [1000, 15], [7000,40], [100, 10], [300, 12]]
N = 150

max = 0
# 선택하는 클럽 수를 순서대로 시험
1.upto(club.size){|i|
  club.combination(i){|ary|
    # 선택한 클럽으로 부원 수의 합이 조건을 만족할 때
    if ary.map{|i| i[1]}.inject(:+) <= N then
      max = [ary.map{|i| i[0]}.inject(:+), max].max
    end
  }
}

puts max
