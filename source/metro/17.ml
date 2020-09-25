#use "metro/16.ml"

(* 目的：駅名と駅名と距離の組のリストを受け取り、その駅までの距離を返す *)
(* assoc : string -> (string * float) list -> float *)
let rec assoc target_ekimei lst = match lst with
    [] -> infinity
  | (ekimei, kyori) :: rest ->
      if target_ekimei = ekimei then kyori
                                else assoc target_ekimei rest

(* テスト：assoc *)
let test_17_1 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8
let test_17_2 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)] = infinity
