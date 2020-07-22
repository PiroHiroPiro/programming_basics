(* 目的：座標を受け取り、x 軸に対象な点の座標を返す *)
(* taisho_x : int * int -> int * int  *)
let taisho_x zahyo = match zahyo with x, y -> (x, 0 - y)

(* テスト *)
let test1 = taisho_x (2, 6) = (2, -6)
let test2 = taisho_x (5, 0) = (5, 0)
let test3 = taisho_x (-3, -2) = (-3, 2)
