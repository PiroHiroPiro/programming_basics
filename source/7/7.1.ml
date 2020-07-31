(* 目的：国語、数学、英語、理科、社会の 5 教科の点数の合計と平均を返す *)
(* goukei_to_heikin : float -> float -> float -> float -> float -> float * float  *)
let goukei_to_heikin kokugo sugaku eigo rika shakai =
  (
    kokugo +. sugaku +. eigo +. rika +. shakai,
    (kokugo +. sugaku +. eigo +. rika +. shakai) /. 5.
  )

(* テスト *)
let test1 = goukei_to_heikin 84. 83. 94. 63. 91. = (415., 83.)
let test2 = goukei_to_heikin 12. 76. 32. 54. 75. = (249., 49.8)
let test3 = goukei_to_heikin 0. 0. 0. 0. 0. = (0., 0.)
