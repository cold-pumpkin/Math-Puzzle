const W = 6; /* 가로의 칸 수 */
const H = 5; /* 세로의 칸 수 */
const USABLE = 2; /* 사용 가능한 횟수 */
var max = 0; /* 최장 길이 */
var h = new Array(H + 1); /* 수평 방향의 선을 사용한 횟수를 저장 */
var v = new Array(W + 1); /* 수직 방향의 선을 사용한 횟수를 저장 */

for (var i = 0; i < H + 1; i++){ h[i] = 0; }
for (var i = 0; i < W + 1; i++){ v[i] = 0; }

function sum(a) {
  return a.reduce(function(x, y) { return x + y; });
}

function search(x, y){
  if ((x == W) && (y == H)){
    /* B에 도착하면 최대치를 확인하고 종료 */
    max = Math.max(sum(h) + sum(v), max);
    return;
  }
  if (h[y] < USABLE){ /* 수평 방향으로 이동 가능할 때 */
    if (x > 0) { /* 왼쪽으로 이동 */
      h[y] += 1;
      search(x - 1, y);
      h[y] -= 1;
    }
    if (x < W) { /* 오른쪽으로 이동 */
      h[y] += 1;
      search(x + 1, y);
      h[y] -= 1;
    }
  }
  if (v[x] < USABLE){ /* 수직 방향으로 이동 가능할 때 */
    if (y > 0){ /* 위로 이동 */
      v[x] += 1;
      search(x, y - 1);
      v[x] -= 1;
    }
    if (y < H){ /* 아래로 이동 */
      v[x] += 1;
      search(x, y + 1);
      v[x] -= 1;
    }
  }
}

search(0, 0); /* A의 위치에서 스타트 */
console.log(max);
