(* 目的：整数リストを受け取り、偶数の要素のみを含むリストを返す *)
(* even int list -> int list *)
let rec even lst = match lst with
    [] -> []
  | first :: rest -> if first mod 2 == 0 then first :: even rest else even rest

(* テスト *)
let test1 = even [2; 1; 6; 4; 7] = [2; 6; 4]
let test2 = even [1; 3; 5; 2; 4; 8] = [2; 4; 8]
let test3 = even [] = []
