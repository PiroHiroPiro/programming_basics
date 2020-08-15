(* 目的：関数を二つ受け取り、二つの関数を合成した関数を返す *)
(* compose : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c *)
(* compose : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b *)
let compose func1 func2 = let func x = func1 (func2 x) in func

(* テスト *)
let time2 x = x * 2
let add3 x = x + 3
let test1 = compose time2 add3 4 = 14
let test2 = compose add3 time2 4 = 11
