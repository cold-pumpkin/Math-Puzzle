/*
 * Q02. 수열의 사칙연산

    나열된 각 숫자 사이에 사칙연산의 연산자를 넣어 완성된 식을 계산한 결과
    원래 수를 거꾸로 나열한 숫자가 되는 수를 구해 보세요.
    (단, 범위는 1000 ~ 9999이며, 모든 숫자 사이마다 연산자를 넣지는 않아도 되지만,
    전체에서 최소한 하나는 넣어야 함.)
    
    ex) 351 -> 3 x 51 = 153
*/

// 삽입할 연산자 저장
var op = ["+", "-", "/", "*", ""];

for(var num = 1000; num < 10000; num++) {
    var numStr = String(num);
    for(var i = 0; i < op.length; i++) {         // 주어진 숫자의 첫번째 공간에 삽입
        for(var j = 0; j < op.length; j++) {     // 주어진 숫자의 두번째 공간에 삽입
            for(var k = 0; k < op.length; k++) { // 주어진 숫자의 세번째 공간에 삽입
                // 연산 결과는 항상 작아지므로 
                // [역순 배열 -> 연산자 삽입 -> 자기자신가 일치여부 확인] 하는 것이 유리
                var expression = numStr.charAt(3) + op[i] + numStr.charAt(2) + op[j]
                                 + numStr.charAt(1) + op[k] + numStr.charAt(0);

                if(expression.length > 4 ) {
                    if(num == eval(expression)) {   // 숫자 & 문자열 비교 가능
                        // 연산자는 반드시 하나 이상 넣어야 함
                        console.log(numStr.split("").reverse().join(""));
                        console.log(expression + " = " + num);
                    }
                }
            }
        }
    }
}