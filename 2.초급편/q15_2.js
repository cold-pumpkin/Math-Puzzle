/*
 * Q15. 계단에 서서 수다 떨기

    어느 계단 밑에서 A가 올라가는 것과 동시에 위에서 B가 내려옵니다.
    계단은 1단씩 올라갈/내려갈 피룡는 없으며, 최대 3단까지 건너 뛰어(즉, 한 번에 4단 진행) 갈 수 있습니다.
    단, 몇단을 뛰더라도 1회 이동에 걸리는 시간은 같은 것으로 합니다.
    여기서 두 명이 동시에 한 번씩 이동할 때 '두 명이 같은 단에 머물도록 움직이는 방법'이 몇 가지인지를 생각해 봅시다.
    
    10단짜리 계단에서 같은 방식으로 이동했을 때 두 사람이 같은 단에 서는 방법은 몇 가지인지 구해 보세요.

    Sol 2. 1과 같이 재귀적으로 구현하되, Memoization 활용 
*/

var stairs = 10;     // 계단의 단 수
var steps = 4;      // 한 번에 진행할 수 있는 단 수

var memo = {};      // 메모화에 활용할 객체

function move(a, b) {
    if([a,b] in memo)   return memo[[a, b]];
    if(a > b)   return memo[[a, b]] = 0;   // A가 B보다 위에 있으면 게임 종료
    if(a == b)  return memo[[a, b]] = 1;   // A와 B가 같은 단에 멈추면 카운트 +1
    var count = 0;
    for(var i = 1; i <= steps; i++)
        for(var j = 1; j <= steps; j++)
            count += move(a + i, b - j);
    
    return memo[[a, b]] = count;
}

// A는 0, B는 10번째 단에서 시작
console.log(move(0, stairs));