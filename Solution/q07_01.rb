# 날짜를 취급하는 Date 클래스 읽기
require 'date'

# 추출 대상의 기간 설정
term = Date.parse('19641010')..Date.parse('20200724')

# 수치화
term_list = term.map{|d|d.strftime('%Y%m%d').to_i}

# 처리한 결과가 같은 값이 되는 것을 출력
puts term_list.select{|d|d==d.to_s(2).reverse.to_i(2)}
