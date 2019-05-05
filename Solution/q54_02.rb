@memo = {}
def cut_cake(w, h, diff)
  # 세로가 긴 경우는 가로의 길이로 치환한다
  w, h = h, w if w < h
  # 메모에 존재하는 경우에는 메모를 사용한다
  return @memo[[w, h, diff]] if @memo.has_key?([w, h, diff])

  # 맨 마지막까지 탐색한 경우, 차이가 1인 경우 이외에는 무한대로 한다
  if w == 1 && h == 1 then
    return @memo[[w, h, diff]] = (diff == 1)?0:Float::INFINITY
  end

  # 가지치기（차가 케이크의 반을 넘으면 무한대로 한다）
  return Float::INFINITY if w * h / 2 < diff

  # 세로와 가로로 잘라본다
  tate = (1..(w/2)).map{|i|
    h + cut_cake(w - i, h, i * h - diff)
  }
  yoko = (1..(h/2)).map{|i|
    w + cut_cake(w, h - i, w * i - diff)
  }
  # 세로와 가로로 자르는 방법 중, 최소인 것을 되돌려준다
  @memo[[w, h, diff]] = (tate + yoko).min
end

puts cut_cake(16, 12, 0)
