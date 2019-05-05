# 날짜를 취급하는 Date 클래스 읽기
require 'date'

# 대상 기간에서 2진수의 5번째 문자부터 8번째 문자까지 추출
from_left = 19641010.to_s(2)[4,8].to_i(2)
to_left   = 20200724.to_s(2)[4,8].to_i(2)
# 좌우의 8문자를 루프
from_left.upto(to_left){|i|
  l = "%08b" % i   # 좌측
  r = l.reverse    # 우측
  (0..1).each{|m|  # 중앙
    value = "1001#{l}#{m}#{r}1001"
    begin
      puts Date.parse(value.to_i(2).to_s).strftime('%Y%m%d')
      rescue       # 유효한 날짜 외에는 무시
    end
  }
}
