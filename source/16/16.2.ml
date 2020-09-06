(* 目的：init から初めて lst の要素を左から順に f を施し込む *)
(* fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
let rec fold_left f init lst = match lst with
    [] -> init
  | first :: rest -> fold_left f (f init first) rest

(* テスト：fold_left *)
let test1_1 = List.fold_left  (-) 0 [1; 2; 3] = -6  (* ((0 - 1) - 2) - 3 *)
let test1_2 = List.fold_right (-) [1; 2; 3] 0 = 2  (* 1 - (2 - (3 - 0)) *)
let test2_1 = List.fold_left  (^) "" ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let test2_2 = List.fold_right (^) ["春"; "夏"; "秋"; "冬"] "" = "春夏秋冬"
