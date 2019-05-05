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

    
    * Sol 2. 범용성 고려
        : 입력값이 바뀌어도 풀 수 있도록 수정
*/

/* 정규표현식을 활용해 '알파벳이 아닌 이외의 문자열'로 분할 */

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


var expression = 'READ+WRITE+TALK==SKILL';
var chars = expression.split(/[^a-zA-Z]/);  //negated character set / complemented character set
chars.splice(chars.indexOf(''), 1);
var chars_uniq = chars.join('').split('').unique();
var head = chars.map(c => c[0]);    // 각 단어의 첫번째 문자열
//console.log(chars_uniq);


var count = 0;
var permuArr = permu([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

//var permuArr = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 4, 6, 3, 2, 8, 9, 7, 0, 5]];

permuArr.forEach(function(perm) {
    // perm : 각 순열 케이스가 담긴 배열
    var chars_map = new Object();
    var expression_num = expression;
    // 알파벳 - 숫자 순열 매핑
    for(var i = 0; i < chars_uniq.length; i++) {
        chars_map[chars_uniq[i]] = perm[i];
    }
    //console.log(chars_map);
    // head에 해당되는 문자열들이 0인지 체크
    var is_zero_first = false;
    head.forEach(function(h) {
        //console.log(h);
        if(chars_map[h] == 0) is_zero_first = true;
    })
    // head가 모두 0이 아닌 경우에는 
    if(!is_zero_first) {
        // 각 단어 -> 숫자로 대체
        //console.log('대체');
        var c = '';
        for(var i = 0; i < expression.length; i++) {
            c = expression.charAt(i);
            //console.log(c);
            if(chars_map[c] >= 0) {
                expression_num = expression_num.replace(c, chars_map[c]);
            }
        }
        //console.log(expression);
        if(eval(expression_num)) {
            console.log(expression_num);
            count += 1;
        }
    }
})
console.log(count);

