(* 目的：昇順に並んでいるリストと整数を受け取り、昇順となる位置に挿入したリストを返す *)
(* insert : int list -> int -> int list *)
let rec insert lst n = match lst with
    [] -> [n]
  | first :: rest -> if first > n then n :: lst else first :: insert rest n

(* テスト *)
let test1 = insert [1; 3; 4; 7; 8] 5 = [1; 3; 4; 5; 7; 8]
let test2 = insert [1; 3; 4; 7; 8] 0 = [0; 1; 3; 4; 7; 8]
let test3 = insert [1; 3; 4; 7; 8] 9 = [1; 3; 4; 7; 8; 9]
