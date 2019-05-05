/* 문자열 형식으로 역순을 반환하는 메소드를 추가 */
String.prototype.reverse = function (){
  return this.split("").reverse().join("");
}

/* 11부터 탐색 개시 */
var num = 11;
while (true){
  if ((num.toString() == num.toString().reverse()) &&
      (num.toString(8) == num.toString(8).reverse()) &&
      (num.toString(2) == num.toString(2).reverse())){
    console.log(num);
    break;
  }
  /* 홀수만 탐색하므로 2씩 늘림 */
  num += 2;
}
