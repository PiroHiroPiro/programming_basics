(* 目的：関数を受け取り、受け取った関数を二回実行する関数を返す *)
(* twice : ('a -> 'a) -> 'a -> 'a *)
let twice f = let g x = f (f x) in g

(* 目的：関数を受け取り、受け取った関数を四回実行する関数を返す *)
(* ('a -> 'a) -> 'a -> 'a *)
let twice_twice = twice twice
