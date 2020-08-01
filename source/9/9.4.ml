(* 目的：リストを受け取り、リストの長さを返す *)
(* length 'a list -> int *)
let rec length lst = match lst with
    [] -> 0
  | first :: rest -> 1 + length rest

(* テスト *)
let test1 = length [2; 1; 6; 4; 7] = 5
