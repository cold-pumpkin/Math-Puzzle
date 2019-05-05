var memo = {};
function cut_cake(w, h, diff){
  if (w < h){
    var temp = w; w = h; h = temp;
  }
  if ([w, h, diff] in memo){
    return memo[[w, h, diff]];
  }
  if ((w == 1) && (h == 1)){
    return memo[[w, h, diff]] = (diff == 1)?0:Infinity;
  }
  if (w * h < diff * 2){
    return Infinity;
  }

  /* 세로와 가로로 잘라본다 */
  var result = new Array();
  for (var i = 1; i <= parseInt(w / 2); i++){
    result.push(h + cut_cake(w - i, h, i * h - diff));
  }
  for (var i = 1; i <= parseInt(h / 2); i++){
    result.push(w + cut_cake(w, h - i, w * i - diff));
  }
  /* 세로와 가로로 자르는 방법 중, 최소인 것을 되돌려준다 */
  return memo[[w, h, diff]] = Math.min.apply(null, result);
}
console.log(cut_cake(16, 12, 0));
