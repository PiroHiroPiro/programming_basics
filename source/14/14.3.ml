(* 目的：init から始めて lst の要素を右から順に f を施し込む*)
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right f lst init = match lst with
    [] -> init
  | first :: rest -> f first (fold_right f rest init)

(* 目的：文字列のリストを受け取り、要素を前から順に繋げた文字列を返す *)
(* concat : string list -> string *)
let concat lst = let f s1 s2 = s1 ^ s2 in fold_right f lst ""

(* テスト *)
let test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
