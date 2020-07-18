(* 目的：時間が午前か午後か判断する *)
(* jikan : int -> string *)
let jikan time = if time < 12 then "午前" else "午後"

(* テスト *)
let test1 = jikan 5 = "午前"
let test2 = jikan 12 = "午後"
let test3 = jikan 18 = "午後"
