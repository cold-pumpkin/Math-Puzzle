require 'date'
WEEKS, DAYS = 6, 7

# 휴일 파일 읽어오기
@holiday = IO.readlines("q61.txt").map{|h|
  h.split('/').map(&:to_i)
}

# 달력을 채우는 최대 장방형의 면적을 산출
def max_rectangle(cal)
  rect = 0
  WEEKS.times{|sr|          # 시작점의 행
    DAYS.times{|sc|         # 시작점의 열
      sr.upto(WEEKS){|er|   # 종료점의 행
        sc.upto(DAYS){|ec|  # 종료점의 열
          is_weekday = true # 시작점과 종료점의 내부에 평일 이외의 날이 있는지
          sr.upto(er){|r|
            sc.upto(ec){|c|
              is_weekday = false if cal[c + r * DAYS] == 0
            }
          }
          if is_weekday then
            rect = [rect, (er - sr + 1) * (ec - sc + 1)].max
          end
        }
      }
    }
  }
  rect
end

# 연월을 지정하고, 면적을 취득한다
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 1일의 요일을 취득
  Date.new(y, m, -1).day.times{|d|      # 그 월의 일 수만큼 반복
    if 1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])
      cal[first + d] = 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
