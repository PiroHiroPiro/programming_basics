(* 目的：自然数 m と n を受け取り、m の n 乗を求める *)
(* power : int -> int -> int *)
let rec power m n = if n = 0 then 1 else m * power m (n - 1)

(* 目的：0 から受け取った自然数までの 2 乗の和を求める *)
(* sum_of_square : int -> int *)
let rec sum_of_square m = if m = 0 then power m 2 else power m 2 + sum_of_square (m - 1)

(* テスト *)
let test1 = sum_of_square 4 = 30
