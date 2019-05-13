/*
 * Q16. 끈 세 개로 만드는 사각형

    같은 길이의 끈 세 개를 구부려 세 개의 사각형을 만든다고 생각해 봅시다.
    그 중 두개로 각각 직사각형을 만들고 남은 하나는 정사각형을 만듭니다. 이 때 만들어진 두 개의 직사각형 면적의 
    합이 정사각형 면적과 같아질 때가 있습니다.
    
    끈의 길이를 1부터 500까지 변화시킨다고 할 때 두 개의 직사각형의 면적의 합과 정사각형의 면적이
    같아지는 조합이 몇 가지 있는지 구해 보세요.
    (단, 모든 직사각형과 정사각형의 변의 길이는 정수이며, 같은 비율의 정수 배의 것은 하나로 셉니다.)

    Sol) 정사각형 한 변의 길이가 c이면 정사각형의 면적은 c^2
         다른 두 직사각형은 이 정사각형과 둘레 길이는 같으므로, 가로와 세로 길이는 
         c-x, c+x(정사각형의 한 변의 길이에서 세로와 가로에 x만큼씩 증감)로 나타낼 수 있다.
         이 때 직사각형의 면적은 (c-x)(c+x) = c^2 - x^2
         또 다른 직사각형의 면적은 c^2 - (c^2 - x^2) = x^2 (제곱수)

        역으로 생각하면 첫번째 직사각형의 면적도 제곱수!
        따라서, a^2 + b^2 = c^2의 피타고라스 정리를 만족하는 조합을 찾으면 된다.
        그 중 같은 비율로 정수 배인 것은 하나로 세므로, a와 b의 최대공약수가 1인 것을 구한다.
*/

var MAX = 500;
var count = 0;



for(var c = 1; c <= Math.floor(MAX/4); c++) {  // 정사각형 한 변
    // 피타고라스 조합 찾기
    var edges = [];
    for(var e = 1; e < c; e++)  // 직사각형의 한 변의 길이 후보들
        edges[e] = e;
    edges.shift();

    var combinations = k_combinations(edges, 2); // 원소들 중 2개의 원소들로 이루어진 조합 구하기
    combinations.forEach(function(comb) {
        var a = comb[0];
        var b = comb[1];
        if(a * a + b * b == c * c)
            if(gcd(a, b) == 1)
                count++;
    });
}

console.log(count);


function k_combinations(set, k) {
	var i, j, combs, head, tailcombs;
	
	if (k > set.length || k <= 0) {
		return [];
	}
	if (k == set.length) {
		return [set];
	}
	
	if (k == 1) {
		combs = [];
		for (i = 0; i < set.length; i++) {
			combs.push([set[i]]);
		}
		return combs;
	}
	
	combs = [];
	for (i = 0; i < set.length - k + 1; i++) {
		head = set.slice(i, i + 1);
		tailcombs = k_combinations(set.slice(i + 1), k - 1);
		for (j = 0; j < tailcombs.length; j++) {
			combs.push(head.concat(tailcombs[j]));
		}
	}
	return combs;
}

function gcd(a, b) {
    if (b == 0)
      return a;
    else
      return gcd(b, (a % b));
}