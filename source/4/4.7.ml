(* 鶴の足の本数 *)
let tsuru_ashi = 2

(* 亀の足の本数 *)
let kame_ashi = 4

(* 目的：x 羽の鶴の足と y 匹の亀の足の本数を計算する *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi x y = tsuru_ashi * x + kame_ashi * y

(* テスト *)
let test1 = tsurukame_no_ashi 1 2 = 10
let test2 = tsurukame_no_ashi 4 3 = 20
let test3 = tsurukame_no_ashi 8 5 = 36
