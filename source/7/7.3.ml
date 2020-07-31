(* 目的：座標を受け取り、x 軸に対称な点の座標を返す *)
(* taisho_x : float * float -> float * float  *)
let taisho_x zahyo = match zahyo with (x, y) -> (x, 0. -. y)

(* テスト *)
let test1 = taisho_x (2., 6.) = (2., -6.)
let test2 = taisho_x (5.1, 0.) = (5.1, 0.)
let test3 = taisho_x (-3., -2.4) = (-3., 2.4)
