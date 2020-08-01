(* 目的：リストを受け取り、リストの長さを返す *)
(* length 'a list -> int *)
let rec length lst = match lst with
    [] -> 0
  | first :: rest -> 1 + length rest

(* テスト *)
let test1 = length [2; 1; 6; 4; 7] = 5
let test2 = length ["春"; "夏"; "秋"; "冬"] = 4 (* List という型であれば何でも良いよいう認識で OK? *)
let test3 = length [] = 0
