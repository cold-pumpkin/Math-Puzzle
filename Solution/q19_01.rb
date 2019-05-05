require 'prime'

primes = Prime.take(6)        # a~f에 들어맞는 소수 6개
min = primes[-1] * primes[-1] # 최대로 가장 큰 것의 제곱
min_friend = []

primes.permutation{|prime|    # 6개의 요소의 순열
  # 2개씩 선택하여 곱한다
  friends = prime.each_cons(2).map{|x, y| x * y}
  # 맨 앞과 맨 끝은 같은 수의 제곱
  friends += [prime[0], prime[-1]].map{|x| x * x}
  if min > friends.max then   # 최소를 갱신한 경우
    min = friends.max
    min_friend = friends
  end
}

puts min
p min_friend
