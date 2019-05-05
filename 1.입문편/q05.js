/*
 * Q05. 아직도 현금으로 계산하다니!

    10원, 50원, 100원, 500원 동전이 있다고 할 때,
    1000원 지폐를 넣었을 때 나오는 동전의 조합이 몇 가지인지 구하세요.
    (단, 동전의 순서는 무시하며 동전 개수의 총합은 15개 이하)
 
 Sol 1. 단순 루프 사용
 - 각 금액에 대해 루프를 돌며 경우의 수 탐색

 Sol 2. 확장성 생각하기
 - 더 큰 금액을 지폐까지 활용해 계산하게 될 경우 고려
 - 모든 순열 고려한 후 배열의 합이 목표 금액이 되는 경우 카운트 (-> 루비에만 만들어짐 함수 존재)

 Sol 3. 동적 프로그래밍
 - 1번째 동전(가장 작은 동전)으로 목표 금액 i원을 채우는 경우의 수 계산해 d[i]에 누적해 저장
 - 2번째 동전으로 목표 금액 채우는 경우의 수 계산해 d[i]에 누적해 저장
 - 반복, 100원 짜리로 만드는 경우를 고려할 때는 d[100] 부터 고려하면 됨

 Sol 4. 재귀 함수 
*/

var count = 0;
var coins = [500, 100, 50, 10];

// (목표 금액, 동전 종류 배열, 조건)
function changeCoins(target, coins, usable) {
    var coin = coins.shift();   // 배열에서 맨 앞 값을 뽑아낸 후 삭제
    if(coins.length <= 0) {
        if(target / coin <= usable) 
            count += 1;
    } else {
        for(var i=0; i <= parseInt(target/coin); i++) {
            changeCoins(target - coin * i, coins.slice(0), usable-i);
        }
    }
}

changeCoins(1000, coins, 15)
console.log(count);



/* 15개 조건 없이 DP로 푸는 경우

var coins = [10, 50, 100, 500];
var dp = new Array(1001).fill(0);   // i원을 만드는 경우의 수를 저장하는 배열

dp[0] = 1;
for(var i = 0; i < coins.length; i++) {
    var count = 0;  // -> 총 15개 이하?
    // ex) 100원 짜리로 만드는 경우를 고려할 때는 100원 만드는 경우부터 고려하면 됨
    for(var j = coins[i]; j <= 1000; j++) {
        // 10원 짜리만으로 1000원 만드는 경우 : dp[1000]
        // 50원 짜리가 추가되면 1000원 만드는 경우 : dp[1000] = dp[1000] + dp[950]
        dp[j] += dp[j - coins[i]];
    }
    //console.log(dp[1000]);
}

console.log(dp[1000]);
*/