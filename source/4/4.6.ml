(* 鶴の足の本数 *)
let tsuru_ashi = 2

(* 目的：x 羽の鶴の足の本数を計算する *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = tsuru_ashi * x

(* テスト *)
let test1 = tsuru_no_ashi 3 = 6
let test2 = tsuru_no_ashi 7 = 14
let test3 = tsuru_no_ashi 11 = 22

(* 亀の足の本数 *)
let kame_ashi = 4

(* 目的：x 匹の亀の足の本数を計算する *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = kame_ashi * x

(* テスト *)
let test1 = kame_no_ashi 3 = 12
let test2 = kame_no_ashi 7 = 28
let test3 = kame_no_ashi 11 = 44
