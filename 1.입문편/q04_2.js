/*
 * Q04. 막대 자르기

    길이 n인 막대를 1단위로 자르며, 하나의 막대는 한 번에 한 사람만이 자를 수 있습니다.
    최대 m명의 사람이 있을 때 막대를 자르는 최소 횟수를 구해 보세요.

    1) n = 20, m = 3
    2) n = 100, m = 5
*/

// Sol 2. 반대로 생각해보기 
//  - 길이 1의 막대를 m명으로 결합해 길이 n으로 만들기
//  - 즉, 막대의 길이가 n이 될 때까지 결헙해 나가기

function cuttingBar(n, m) {
    var count = 0;
    var pieces = 1; // 현재 조각의 개수
    while(n > pieces) {
        // 현재 조각 개수보다 사람 수가 더 많으면 현재 조각 개수 만큼 더 늘어나고
        // 사람 수가 더 적으면 사람 수 만큼만 늘어남
        pieces += pieces < m ? pieces : m;
        count += 1;
    }
    return count;
}

console.log(cuttingBar(20, 3));
console.log(cuttingBar(100, 5));