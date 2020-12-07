(* 目的：受け取った lst の中の最小の値を返す *)
(* minimum : int -> int list -> int *)
let rec minimum min lst = match lst with
    [] -> min
  | first :: rest -> let min_rest = minimum first rest in
      if min <= min_rest
        then min
        else min_rest

(* テスト：minimum *)
let test1 = minimum 3 [] = 3
let test1 = minimum 1 [2] = 1
let test1 = minimum 3 [5] = 3
let test1 = minimum 3 [2; 6; 4; 1; 8] = 1
