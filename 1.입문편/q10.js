/*
 * Q10. 룰렛의 최댓값

    2<=n<=36의 각각의 n에 대하여, 연속하는 n개의 수의 합이 최대가 되는 경우를 구하고,
    유로피안 스타일에서의 합이 아메리칸 스타일에서의 합보다도 작아지는 n이 몇 개 있는지 구해 보세요.

    Sol. (개선)
    맨 처음 단계에서 왼쪽 n개의 합계를 얻어두고, 오른쪽으로 하나씩 밀 때마다
    왼쪽 끝의 수를 줄이고 오른쪽 끝의 수를 늘려가면서 배열의 합을 구하는 과정 줄이기.
*/

european = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36,
    11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9,
    22, 18, 29, 7, 28, 12, 35, 3, 26]
american = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15,
    3, 24, 36, 13, 1, 00, 27, 10, 25, 29, 12, 8, 19, 31,
    18, 6, 21, 33, 16, 4, 23, 35, 14, 2]

function sum_max(roulette, n) {
    // 우선 처음부터 n까지의 합을 구해둠
    var ans = 0;
    for(var i = 0; i < n; i++) {
        ans += roulette[i];
    }
    var temp = ans;
    // n개의 합을 구하며 최대 값 저장
    for(var i = 0; i < roulette.length; i++) {
        // 다음 요소 더하고
        temp += roulette[(n + i) % roulette.length];
        // 첫 요소는 뺌
        temp -= roulette[i];
        // 비교
        ans = Math.max(ans, temp);
    }
    return ans;
}

var cnt = 0;
for(var i = 2; i <= 36; i++) {
    if(sum_max(european, i) < sum_max(american, i)) 
        cnt += 1;
}
console.log(cnt);