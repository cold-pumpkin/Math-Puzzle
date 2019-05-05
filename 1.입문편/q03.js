/*
 * Q03. 카드를 뒤집어라!     

    1~100의 번호가 쓰인 카드가 순서대로 뒤집어져 있습니다.
    n(n>=2)번째 카드부터 n-1장 간격으로 카드를 뒤집는 작업을 더 이상 뒤집을 카드가 없을 때 까지
    계속한다고 할 때, 뒷면이 위를 향한 카드의 번호를 모두 구해 보세요.
*/

// 100장의 카드를 false(뒤집어진 상태)로 초기화
var cards = new Array(100).fill(false);

for(var i = 2; i <= cards.length; i++) {
    var j = i-1;
    while(j < cards.length) {
        cards[j] = !cards[j];
        j += i;
    }
}

var ans = '';
for(var i = 0; i < cards.length; i++) {
    if(!cards[i]) {
        ans += ' ' + (i+1);
    }
}

console.log(ans);
// -> * 결과적으로 뒤집히기 위해서는 1을 제외한 약수가 짝수(1을 포함하면 홀수)개여야 함.
//      즉, 제곱수를 찾는 문제.


