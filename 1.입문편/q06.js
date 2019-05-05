/*
 * Q06. 콜라츠 추측

    자연수 n에 대해
    - n이 짝수인 경우, n을 2로 나눈다.
    - n이 홀수인 경우, n에 3을 곱해 1을 더한다.
    이 계산을 반복하면 초깃값이 어떤 수였더라도 반드시 1에 도달한다.

    초깃값이 짝수면 맨 처음에만 n에 3을 곱하여 1을 더한다고 할 때,
    10000 이하의 짝수 중 처음의 수로 돌아가는 수가 몇 개 있는지 구해 보세요.

    ex) 4 -> 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4
*/


// 짝수만 검사
function CollatzConjecture(n) {
    // 처음에 3을 곱한 후 1을 더함
    var check = n * 3 + 1;
    // 콜라츠의 추측에 따라 1이 나올 때까지 연산
    while(check != 1) {
        check = check % 2 ? check * 3 + 1 : check / 2;
        if(check == n)
            return true;
    }
    return false;
}

var count = 0;
for(var i=2; i <= 10000; i++) {
    if(CollatzConjecture(i))
        count++;
}

console.log(count);
