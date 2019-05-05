const N = 20;
var memo = [];
memo[1] = 1;

function set_tap(remain){
  if (memo[remain]){
    return memo[remain];
  }
  var cnt = 0;
  /* 2口 */
  for (var i = 1; i <= remain / 2; i++){
    cnt += set_tap(remain - i) * set_tap(i);
  }
  /* 3口 */
  for (var i = 1; i <= remain / 3; i++){
    for (var j = 1; j <= (remain - i) / 2; j++){
      cnt += set_tap(remain - (i + j)) * set_tap(j) * set_tap(i);
    }
  }
  memo[remain] = cnt;
  return cnt;
}

console.log(set_tap(N));
