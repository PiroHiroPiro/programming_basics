(* 鶴の足の本数 *)
let tsuru_ashi = 2

(* 亀の足の本数 *)
let kame_ashi = 4

(* 目的：鶴亀算を解く *)
(* tsurukame : int -> int -> int *)
let tsurukame x y = (x * kame_ashi - y) / tsuru_ashi

(* テスト *)
let test1 = tsurukame 5 16 = 2
let test2 = tsurukame 8 24 = 4
let test3 = tsurukame 11 30 = 7
