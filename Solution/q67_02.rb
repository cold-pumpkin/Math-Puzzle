W, H = 5, 6
ALL = (1 << W) - 1
# 각 행의 남자의 사람 수를 저장
@boys = (0..ALL).map{|i| i.to_s(2).count("1")}

# 세 개의 행의 배치가 가능한가(위의 2행에 다음의 행을 이을 수 있는가)
def check(r1, r2, r3)
  result = true
  W.times{|i|                      # 1행의 각 위치에 대해 확인
    m1 = (0b111 << (i - 1)) & ALL  # 좌우로 나열되어 있는지 체크
    m2 = 1 << i                    # 상하로 나열되어 있는지 체크
    if (r1 & m2 == m2) && (r2 & m1 == m1) && (r3 & m2 == m2) then
      result = false               # 남자가 나열되어 있는 경우는 NG
    end
    if ((r1 ^ ALL) & m2 == m2) && ((r2 ^ ALL) & m1 == m1) &&
       ((r3 ^ ALL) & m2 == m2) then
      result = false               # 여자가 나열되어 있는 경우도 NG
    end
  }
  result
end

# 위의 2행에 이어지는 행의 해시를 작성
@next = {}
(1 << W).times{|r1|       # 첫 번째 행
  (1 << W).times{|r2|     # 두 번째 행
    @next[[r1, r2]] = (0..ALL).select{|r3| check(r1, r2, r3)}
  }
}

@memo = {}
def search(pre1, pre2, line, used)
  if @memo.has_key?([pre1, pre2, line, used]) then
    return @memo[[pre1, pre2, line, used]] # 과거에 탐색 완료된 경우
  end

  if line >= H then                        # 맨 마지막 행까지 탐색했다
    @memo[[pre1, pre2, line, used]] = (used == W*H/2)?1:0
    return @memo[[pre1, pre2, line, used]]
  end
  result = 0
  if line == H - 1 then                    # 맨 마지막 행의 직전
    @next[[pre2, pre1]].each{|row|
      if (@next[[row, row]].include?(pre1)) &&
        (used + @boys[row] <= W * H / 2) then
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  else                                     # 맨 마지막 행 이외
    @next[[pre2, pre1]].each{|row|
      if used + @boys[row] <= W * H / 2 then
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  end
  @memo[[pre1, pre2, line, used]] = result
end

count = 0
(1 << W).times{|r0|                        # 맨 처음 행을 설정
  count += search(r0, r0, 1, @boys[r0])
}
puts count
