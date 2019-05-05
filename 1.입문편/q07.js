/*
 * Q07. 날짜의 2진수 변환

    연원일을 YYYYMMDD의 8자리 정수로 나타냈을 때 2진수로 변환해 거꾸로 나열한 다음
    다시 10진수로 되돌렸을 때 원래 날짜와 같은 날짜가 되는 것을 찾아보세요.
    (기간은 1964년 10월 10일 ~ 2020년 7월 24일)
*/

// YYYYMMDD 형식으로 뽑아내는 함수
Date.prototype.yyyymmdd = function() {
    var mm = this.getMonth() + 1;
    var dd = this.getDate();
    return [ this.getFullYear(), (mm > 9 ? '' : '0') + mm, (dd > 9 ? '' : '0') + dd ].join('');
};

// 역순 출력 메소드
String.prototype.reverse = function() {
    return this.split('').reverse().join('');
}

var startDate = new Date('1964-10-10');
var endDate = new Date('2020-07-24');
var term = (endDate-startDate)/(1000*60*60*24);

var dateArr = new Array();


for(var i = 0; i <= term; i++) {
    //console.log(startDate.yyyymmdd());
    dateArr.push(startDate.yyyymmdd());
    startDate.setDate(startDate.getDate()+1);
}


for(var i = 0; i <= dateArr.length; i++) {
    if(parseInt(parseInt(dateArr[i]).toString(2).reverse(), 2) == dateArr[i]) {
        console.log(dateArr[i]);
    }
}