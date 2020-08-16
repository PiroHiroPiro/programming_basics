(* 目的：n から 1 までのリストを作る *)
(* enumerate : int -> int list *)
let rec enumerate n = if n = 0 then [] else n :: enumerate (n - 1)

(* 目的：init から始めて lst の要素を右から順に f を施し込む*)
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right f lst init = match lst with
    [] -> init
  | first :: rest -> f first (fold_right f rest init)

(* 目的：n から 1 までの合計を求める*)
(* one_to_n : int -> int *)
let one_to_n n = fold_right (+) (enumerate n) 0

(* テスト：one_to_n *)
let test1 = one_to_n 10 = 55
