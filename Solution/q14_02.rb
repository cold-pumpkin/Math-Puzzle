# 월드컵 출전국을 배열로 설정
country = ["Brazil", "Croatia", "Mexico", "Cameroon",
           "Spain", "Netherlands", "Chile", "Australia",
           "Colombia", "Greece", "Cote d'Ivoire", "Japan",
           "Uruguay", "Costa Rica", "England", "Italy",
           "Switzerland", "Ecuador", "France", "Honduras",
           "Argentina", "Bosnia and Herzegovina", "Iran",
           "Nigeria", "Germany", "Portugal", "Ghana",
           "USA", "Belgium", "Algeria", "Russia",
           "Korea Republic"]
def search(countrys, prev, depth)
  # 앞의 나라 이름에 이어지는 나라 목록을 취득
  next_country = countrys.select{|c| c[0] == prev[-1].upcase}
  if next_country.size > 0 then
    # 이어지는 나라가 있는 경우 그 나라를 제외하고 재귀적으로 탐색
    next_country.each{|c|
      search(countrys - [c], c, depth + 1)
    }
  else
    # 이어지는 나라가 없는 경우 깊이가 최대인지를 체크
    @max_depth = [@max_depth, depth].max
  end
end

# 모든 나라로부터 개시
@max_depth = 0
country.each{|c|
  search(country - [c], c, 1)
}
# 깊이의 최대치（끝말잇기로 이어지는 나라의 수）를 표시
puts @max_depth
