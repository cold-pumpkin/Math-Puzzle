require 'date'
WEEKS, DAYS = 6, 7

# 휴일 파일 읽어오기
@holiday = IO.readlines("q61.txt").map{|h|
  h.split('/').map(&:to_i)
}

# 달력을 채우는 최대장방형의 면적을 산출
def max_rectangle(cal)
  s = 0
  WEEKS.times{|row|
    DAYS.times{|left|
      (left..(DAYS - 1)).each{|right|
        # 높이를 산출
        h = (left..right).map{|w| cal[w + row * DAYS]}
        # 높이의 최소값과 가로폭으로 면적을 산출
        s = [s, h.min * (right - left + 1)].max
      }
    }
  }
  s
end

# 연월을 지정하고 면적을 취득한다
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 1일의 요일을 취득
  Date.new(y, m, -1).day.times{|d|      # 그 월의 일 수만큼 반복
    if 1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])
      # 위로 얼마나 평일이 이어져 있는가?
      cal[first + d] = cal[first + d - DAYS] + 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
