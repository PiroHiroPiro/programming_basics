(* 目的：二つのリストを受け取り、長さが同じか判定する *)
(* equal_length : 'a list -> 'a list -> bool *)
let rec equal_length lst1 lst2 = match (lst1, lst2) with
    ([], []) -> true
  | ([], first :: rest) -> false
  | (first :: rest, []) -> false
  | (first1 :: rest1, first2 :: rest2) -> equal_length rest1 rest2

(* テスト *)
let test1 = equal_length [1; 2; 3] [4; 5; 6] = true
let test2 = equal_length [1; 2; 3; 4] ["春"; "夏"; "秋"; "冬"] = true
let test3 = equal_length [] [] = true
let test4 = equal_length [1; 2; 3] [4; 6] = false
