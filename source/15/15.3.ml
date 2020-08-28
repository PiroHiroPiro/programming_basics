(* 目的：自然数のリスト（2 ~ n）を受け取り、エラトステネスの篩を使って素数のみのリストを返す *)
(* sieve : int list -> int list *)
let rec sieve lst = match lst with
    [] -> []
  | first :: rest -> first :: sieve (List.filter (fun n -> n mod first != 0) rest)

(* テスト：sieve *)
let test1 = sieve [2; 3; 4; 5; 6; 7; 8; 9; 10] = [2; 3; 5; 7]

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

(* 目的：自然数を受け取り、それ以下の素数のリストを返す *)
(* prime : int -> int list *)
let prime n =
  (* 目的：n ~ 2 のリストを作成する *)
  (* enumerate_n_to_2 : int -> int list *)
  let rec enumerate_n_to_2 n = if n <= 1 then [] else n :: enumerate_n_to_2 (n - 1) in
  (* 目的：2 ~ n のリストを作成する *)
  (* enumerate_2_to_n : int -> int list *)
  let enumerate_2_to_n n = quick_sort (enumerate_n_to_2 n) in
  sieve (enumerate_2_to_n n)

(* テスト：prime *)
let test2 = prime 10 = [2; 3; 5; 7]
let test3 = prime 11 = [2; 3; 5; 7; 11]
