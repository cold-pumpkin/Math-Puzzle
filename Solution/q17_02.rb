N = 30
boy, girl = 1, 0
N.times{|i|
  # n-1명까지 늘어서 있는 상태에서 구한다
  boy, girl = boy + girl, boy
}
puts boy + girl
