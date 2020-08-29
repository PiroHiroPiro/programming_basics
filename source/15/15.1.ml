(* 目的：受け取ったリストをクイックソートを使って昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst =
  (* 目的：lst の中から n より p である要素のみ取り出す *)
  (* take : int -> int list -> (int -> int -> bool) -> int list *)
  let take n lst p = List.filter (fun item -> p item n) lst
  (* 目的：lst の中から n より小さな要素のみを取り出す *)
  (* take_less : int -> int list -> int list *)
  in let take_less n lst = take n lst (<)
  (* 目的：lst の中から n より大きな要素のみを取り出す *)
  (* take_greater : int -> int list -> int list *)
  in let take_greater n lst = take n lst (>=)
  in match lst with
      [] -> []
    | first :: rest -> quick_sort (take_less first rest)
                      @[first]
                      @quick_sort (take_greater first rest)

(* テスト：quick_sort *)
let test1 = quick_sort [3; 2; 4; 1] = [1; 2; 3; 4]
let test2 = quick_sort [3; 3; 4; 1] = [1; 3; 3; 4]
