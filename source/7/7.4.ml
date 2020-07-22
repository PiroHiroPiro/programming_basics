(* 目的：二つの座標を受け取り、中点の座標を返す *)
(* chuten : float * float -> float * float -> float * float *)
let chuten zahyo1 zahyo2 = match zahyo1 with x1, y1 -> match zahyo2 with x2, y2 -> ((x1 +. x2) /. 2., (y1 +. y2) /. 2.)

(* テスト *)
let test1 = chuten (1., 3.) (5., 1.) = (3., 2.)
let test2 = chuten (0., 0.) (0., 0.) = (0., 0.)
let test3 = chuten (-3.5, 2.) (1.5, 3.)= (-1., 2.5)
