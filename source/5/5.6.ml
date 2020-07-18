(* 目的：二次方程式 a * x ^ 2 + b * x + c = 0 が与えられたとき、判別式を求める *)
(* hanbetsushiki : int -> int -> int -> int *)
let hanbetsushiki a b c = (b * b) - 4 * a * c

(* テスト *)
let test1 = hanbetsushiki 2 4 4 = -16
let test2 = hanbetsushiki 2 4 (-1) = 24
let test3 = hanbetsushiki 1 2 1 = 0

(* 目的：二次方程式 a * x ^ 2 + b * x + c = 0 が与えられたとき、虚数解をもつかどうか判定する *)
(* kyosuukai : int -> int -> int -> bool *)
let kyosuukai a b c = if hanbetsushiki a b c < 0 then true else false

(* テスト *)
let test1 = kyosuukai 2 4 4 = true
let test2 = kyosuukai 2 4 (-1) = false
let test3 = kyosuukai 1 2 1 = false
