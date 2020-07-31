(* 目的：名前と成績を受け取り、文字列を返す *)
(* seiseki : string * string -> string  *)
let seiseki pair = match pair with name, hyoka -> name ^ "さんの評価は" ^ hyoka ^ "です"

(* テスト *)
let test1 = seiseki ("たかし", "A") = "たかしさんの評価はAです"
let test2 = seiseki ("まい", "B") = "まいさんの評価はBです"
let test3 = seiseki ("けんじ", "F") = "けんじさんの評価はFです"
