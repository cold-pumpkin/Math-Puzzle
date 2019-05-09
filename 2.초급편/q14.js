/*
 * Q14. 월드컵 출전국 끝말잇기

    2014년도 월드컵 출전국으로 끝말잇기를 해봅시다. 
    각 나라를 한 번씩만 말할 수 있다고 할 때 가장 길게 이어지는 순서를 구하고 사용한 국가의 수를 답해 보세요.
*/

//월드컵 출전국을 배열로 설정
var countries = ["Brazil", "Croatia", "Mexico", "Cameroon", "Spain", "Netherlands", "Chile", 
            "Australia", "Colombia", "Greece", "Cote d'Ivoire", "Japan", "Uruguay", "Costa Rica", 
            "England", "Italy", "Switzerland", "Ecuador", "France", "Honduras", "Argentina", 
            "Bosnia and Herzegovina", "Iran", "Nigeria", "Germany", "Portugal", "Ghana",
            "USA", "Belgium", "Algeria", "Russia", "Korea Republic"];


function search(countries, prev, depth) {
    // prev로 전달된 국가 이름과 이어지는 나라들 찾기
    var next_country = countries.filter(country => prev[prev.length-1].toUpperCase() == country[0]);
    //console.log(next_country);
    if(next_country.length > 0) {
        // 이어지는 나라가 존재하는 경우 그 나라를 제외한 나라들에 대해 재귀적으로 탐색
        next_country.forEach(function(country) {
            //countries.splice(countries.indexOf(country), 1); --> 안됨
            search(countries.filter(c => c != country), country, depth + 1);    // 자기 자신은 제외한 배열 넘기기
        });
    } else {
        // 이어지는 나라가 없는 경우 깊이가 최대인지 확인 후 업데이트
        max_depth = Math.max(max_depth, depth);
    }
}

var max_depth = 0;
//search(countries, "Korea Repulibc", 1);
// 모든 나라에서부터 탐색 개시
countries.forEach(function(country) {
    //countries.splice(countries.indexOf(country), 1); --> 안됨
    search(countries.filter(c => c != country), country, 1);    // 자기 자신은 제외한 배열 넘기기
})

// 깊이의 최대치(끝말잇기로 이어지는 나라의 수 표시)
console.log(max_depth);