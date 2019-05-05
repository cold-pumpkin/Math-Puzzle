/*
 * Q13. 복면산을 만족하게 하는 것은 몇 가지일까?

    복면산이란 복면을 쓴 숫자, 즉 문자로 표현한 계산식으로, 같은 문자에는 같은 숫자가 들어가고,
    다른 문자에는 다른 숫자가 들어갑니다. 그리고 최상위 문자에 0은 들어가지 않습니다.

    ex) We X love = CodeIQ
    라는 식이 주어졌을 때, 다음과 같이 대입할 수 있습니다.
    => W=7, e=4, l=3, o=8, v=0, C=2, d=1, l=9, Q=6

    이 변환에 의해 74 x 3804 = 281496 이라는 식을 만들 수 있습니다. 위 식을 만족하는 것은 이 한 가지 뿐입니다.

    그렇다면 다음의 식을 만족하는 숫자 대입 방법은 몇 가지 있는지 구해 보세요.

    : READ + WRITE + TALK = SKILL

    
    * Sol 1. 완전 탐색
        : 0 ~ 9의 숫자를 순서대로 대입
*/

// 중복 제거
Array.prototype.unique = function() {
    return Array.from(new Set(this));
}
// 모든 순열 구하기
function permu(a) {
    return a.reduce(
        function(list, element) {
            var newlist = [];
  
            list.forEach(function(seq) {
                for (var i = seq.length; i >= 0; i--) {
                    var newseq = [].concat(seq);
                    newseq.splice(i, 0, element);
                    newlist.push(newseq);
                }
            });
            return newlist;
        },
        [[]]
    );
}


var alpha = new Array();
alpha = alpha.concat('READ'.split(''));
alpha = alpha.concat('WRITE'.split(''));
alpha = alpha.concat('TALK'.split(''));
alpha = alpha.concat('SKILL'.split(''));
alpha = alpha.unique();


var permuArr = permu([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

var count = 0;
permuArr.forEach(function(el) {
    var read, wrtie, talk, skill;
    if(el[alpha.indexOf('R')] != 0 && el[alpha.indexOf('W')] != 0 &&
        el[alpha.indexOf('T')] != 0 && el[alpha.indexOf('S')] != 0) {

        read = el[alpha.indexOf('R')] * 1000 + el[alpha.indexOf('E')] * 100 +
                el[alpha.indexOf('A')] * 10 + el[alpha.indexOf('D')];
        write = el[alpha.indexOf('W')] * 10000 + el[alpha.indexOf('R')] * 1000 +
                el[alpha.indexOf('I')] * 100 + el[alpha.indexOf('T')] * 10 + el[alpha.indexOf('E')];
        talk = el[alpha.indexOf('T')] * 1000 + el[alpha.indexOf('A')] * 100 +
                el[alpha.indexOf('L')] * 10 + el[alpha.indexOf('K')];            
        skill = el[alpha.indexOf('S')] * 10000 + el[alpha.indexOf('K')] * 1000 +
                el[alpha.indexOf('I')] * 100 + el[alpha.indexOf('L')] * 10 + el[alpha.indexOf('L')];

        if(read + write + talk == skill) {
            count += 1;
            console.log(`${read} + ${write} + ${talk} = ${skill}`);
        }
    } 
})

console.log(count);