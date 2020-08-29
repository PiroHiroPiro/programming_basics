(* 目的：二つの自然数（m >= n >= 0）を受け取り、ユークリッドの互除法を使って最大公約数を返す *)
(* gcd : int -> int -> int *)
let rec gcd m n =
  if n = 0 then m
           else gcd n (m mod n)

(* テスト：gcd *)
let test1 = gcd 45 25 = 5
let test2 = gcd 111 7 = 1
