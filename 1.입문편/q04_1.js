/*
 * Q04. 막대 자르기

    길이 n인 막대를 1단위로 자르며, 하나의 막대는 한 번에 한 사람만이 자를 수 있습니다.
    최대 m명의 사람이 있을 때 막대를 자르는 최소 횟수를 구해 보세요.

    1) n = 20, m = 3
    2) n = 100, m = 5
*/

// Sol 1. 깊이 우선 탐색 (재귀)

// (길이, 사람, 막대 개수)
function cuttingBar(n, m, pieces) {
    // base case : 조각(1 조각 당 길이 1) * 1(길이)가 처음 길이 이상일 때 
    if(pieces >= n) 
        return 0;
    else if(pieces < m){    
        // 조각 수가 사람 수보다 적으면 모든 조각이 잘려 수가 2배가 됨
        return 1 + cuttingBar(n, m, pieces * 2) // 자른 횟수는 1 증가
    }else {
        // 조각 수가 사람 수보다 많으면 자른 사람 수만큼 조각 수가 늘어남
        return 1 + cuttingBar(n, m, pieces + m);
    }
}

console.log(cuttingBar(20, 3, 1));
console.log(cuttingBar(100, 5, 1));