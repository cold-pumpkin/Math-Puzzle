/*
01. 앞뒤가 같은 10진수 만들기

10진수, 2진수, 8진수 그 어느 것으로 표현하여도 대칭수가 되는 수 중,
10진수에서 10 이상인 최솟값을 구해보세요.
 ex) 9 (10진수) = 1001 (2진수) = 11 (8진수) -> 하지만 10 미만이므로 제외.
*/

// * 문자열 역순 반환 : 대칭수라면 거꾸로 하면 같음
/*
function reverseString(str) {
    return str.split("").reverse().join("");
}
*/
String.prototype.reverse = function() {
    return this.split("").reverse().join("");
}

var num = 11;

while(true) {
    if( (num.toString() == num.toString().reverse()) &&     // 10진수
        (num.toString(8) == num.toString(8).reverse()) &&   // 8진수
        (num.toString(2) == num.toString(2).reverse()) ) {  // 2진수
            console.log(num);
            break;
        } 
    
    // 역순으로 해도 같으려면 2진수로 바꿨을 때 1로 끝나야 함 -> 홀수만 가능
    num += 2;
}