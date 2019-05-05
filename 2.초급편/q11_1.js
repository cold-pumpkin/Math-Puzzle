/*
 * Q11. 피보나치 수열

    피보나치 수열 중 각 자리의 숫자를 더한 수로 나누어 떨어지는 수를 
    다음의 예에 이어 작은 쪽부터 5개 구해 보세요.
    ex) 2 -> 2 / 2, 3 -> 3 / 3, 5 -> 5 / 5,
        8 -> 8 / 8, 21 -> 21 / 3, 144 -> 144 / 9
*/

// 피보나치 ver.1
function fib1(n) {
    if(n == 0 || n == 1) {
        return 1;
    } else {
        return fib(n - 2) + fib(n - 1);
    }
}

// 피보나치 ver.2 (Memoization : 한 번 계산한 것을 메모해 두고 다시 계산하지 않음)
var memo = new Array();
function fib2(n) {
    if(memo[n] == null) {
        if(n == 0 || n == 1) {
            memo[n] = 1;
        } else {
            memo[n] = fib2(n - 2) + fib2(n - 1);
        }
    }
    return memo[n];
}

// 재귀 없이 구현
var a = b = 1;
var count = 0;
function fib3(cnt) {
    var c = 0;
    while(count < cnt) {
        c = a + b;
        var sum = 0;
        // 한 자리씩 분할하여 각 자리의 합 구하기
        c.toString().split('').forEach(function(el) {
            sum += parseInt(el);
        });
        if( c % sum == 0) {
            console.log(c);
            count += 1;
        }
        a = b; b = c;
    }
}

fib3(10);