(* 目的：文字列と、文字列と任意の型の組のリストを受け取り、文字列に一致する組の値を返す *)
(* assoc : string -> (string * ’a) list -> 'a *)
let rec assoc target_key lst = match lst with
    [] -> raise Not_found
  | (key, value) :: rest ->
      if target_key = key then value
                          else assoc target_key rest

(* テスト：assoc *)
let test_1 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8
let test_2 = assoc "数学" [("英語", 90); ("数学", 40)] = 40
let test_3 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)]
