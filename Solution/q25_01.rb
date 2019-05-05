N = 6

max_cnt = 0
(1..N - 1).to_a.permutation(N - 1){|l|   # 좌측의 순서
  (1..N - 1).to_a.permutation(N - 1){|r| # 우측의 순서
    # 경로를 설정
    path = []
    left = 0
    right = r[0]
    (N - 1).times{|i|
      path.push([left, right])
      left = l[i]
      path.push([left, right])
      right = r[i + 1]
    }
    path.push([left, 0])

    # 경로가 교차하는지를 판정
    cnt = 0
    (N * 2 - 1).times{|i|
      (i + 1).upto(N * 2 - 2){|j|
        cnt += 1 if (path[i][0] - path[j][0]) *
                    (path[i][1] - path[j][1]) < 0
      }
    }
    max_cnt = [max_cnt, cnt].max
  }
}
puts max_cnt
