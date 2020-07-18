(* 目的：二次方程式 a * x ^ 2 + b * x + c = 0 が与えられたとき、判別式を求める *)
(* hanbetsushiki : int -> int -> int -> int *)
let hanbetsushiki a b c = (b * b) - 4 * a * c

(* テスト *)
let test1 = hanbetsushiki 2 4 4 = -16
let test2 = hanbetsushiki 2 4 (-1) = 24
let test3 = hanbetsushiki 1 2 1 = 0

(* 目的：二次方程式 a * x ^ 2 + b * x + c = 0 が与えられたとき、解の個数を求める *)
(* kai_no_kosuu : int -> int -> int -> int *)
let kai_no_kosuu a b c = if hanbetsushiki a b c > 0 then 2 else if hanbetsushiki a b c = 0 then 1 else 0

(* テスト *)
let test1 = kai_no_kosuu 2 4 4 = 0
let test2 = kai_no_kosuu 2 4 (-1) = 2
let test3 = kai_no_kosuu 1 2 1 = 1
