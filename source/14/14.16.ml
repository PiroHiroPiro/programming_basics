(* 目的：nから1までのリストを返す *)
(* enumerate : int -> int list *)
let rec enumerate n = if n <= 1 then [1]
                                else n :: enumerate (n - 1)

(* enumerate *)
let test1 = enumerate 5 = [5; 4; 3; 2; 1]

(* 目的：階乗を返す *)
(* fac : int -> int *)
let fac n = List.fold_right ( * ) (enumerate n) 1

(* テスト：fac *)
let test0 = fac 0 = 1
let test1 = fac 3 = 6
let test2 = fac 5 = 120
