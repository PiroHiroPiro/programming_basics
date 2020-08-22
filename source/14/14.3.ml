(* 目的：文字列のリストを受け取り、要素を前から順に繋げた文字列を返す *)
(* concat : string list -> string *)
let concat lst = List.fold_right (fun s1 s2 -> s1 ^ s2) lst ""

(* テスト *)
let test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
