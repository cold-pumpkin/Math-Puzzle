/*
 * Q12. 제곱근의 숫자

    제곱근을 소수로 나타내었을 때 0~9의 모든 숫자가 가장 빨리 나타나는 최소 정수를 구해 보세요.
    단, 여기서는 양의 제곱근만을 대상으로 합니다. 정수 부분을 포함하는 경우와 소수 부분만 취득하는 경우
    각각에 대해 모두 구해보세요.

    ex) 2의 제곱근 : 1.414213562373095048...
        (0~9가 모두 나타나려면 19자리가 필요)
*/


// 중복 체크 함수
String.prototype.hasDuplicates = function() {
	return (new Set(this.split(''))).size !== this.length;
}

// 정수 부분을 포함하는 경우
var i = 2;
while(i < 1363) {
    // 소수점 제거하고 왼쪽에서 10개 문자를 취득
    /*
    var root = Math.sqrt(i);
    var rootArr = root.toString().split('');
    rootArr.splice(rootArr.indexOf('.'), 1);    // 앞 index의 요소부터 1개 요소 제거
    var target = rootArr.splice(0, 10); // 0번째 인덱스 요소부터 10개 요소 제거
    console.log(target);
    if(!target.hasDuplicates()) 
        break;
    i += 1;
    */
   var root = Math.sqrt(i).toFixed(9).replace('.', '').substr(0, 10);
   //console.log(root.hasDuplicates());
   
   if(!root.hasDuplicates()) {
       console.log(root);
       break;
   }
   i++;
}

console.log(i);


// 소수 부분에서만 찾는 경우