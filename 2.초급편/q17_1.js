/*
 * Q16. 30인 31각에 도전!

    30인 31각에 가장 유리한 배치를 위해 여자 아이들은 연속으로 서지 않고, 남자 아이들은 몇 명이 같이 서도
    무방하다고 합시다. 이 때, 30인을 한 줄로 세우는 경우 몇 가지 방법이 있는지 구해보세요.
    남여의 배열만 생각하는 것으로 하고, 누가 어느 위치에 서는지는 무시하기로 합니다.

    Sol 1. 남자 아이는 언제든 추가할 수 있으므로, 여자 아이에 대한 조건만 추가.
           오른쪽 끝이 남자 아이인 경우에만 여자 아이를 추가해 준다.
*/

var boy = "B";
var girl = "G";
var LIMIT = 30;

function add(seq) {
    // 나열할 사람 수에 도달하면 종료
    if(seq.length == LIMIT) 
        return 1;   // 1을 리턴해 카운트를 증가시킴
    
    // 나열할 사람 수에 도달하지 않은 경우
    // 남자를 추가하거나, 끝에 남자가 있는 경우 여자를 추가
    var count = add(seq + boy);
    if(seq[seq.length - 1] == boy)
        count += add(seq + girl);
    
    return count;
}

console.log(add(boy) + add(girl));