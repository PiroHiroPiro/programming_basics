(* 目的：文字列のリストを受け取り、要素を前から順に繋げた文字列を返す *)
(* concat string list -> string *)
let rec concat lst = match lst with
    [] -> ""
  | first :: rest -> first ^ concat rest

(* テスト *)
let test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
