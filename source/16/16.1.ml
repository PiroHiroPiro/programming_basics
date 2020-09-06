(* 目的：整数のリストを受け取り、それまでの数の合計からなるリストを返す *)
(* sum_list : int lst -> int lst *)
let sum_list lst =
  (* 目的：先頭からリストの中の各数までの合計を計算する *)
  (* ここで sum0 はこれまでの数の合計 *)
  (* hojo : int lst -> int -> int lst *)
  let rec hojo lst sum0 = match lst with
      [] -> []
    | first :: rest -> let current_sum0 = first + sum0 in
      current_sum0 :: hojo rest current_sum0
  in hojo lst 0

(* テスト：sum_list *)
let test1 = sum_list [3; 2; 1; 4] = [3; 5; 6; 10]
