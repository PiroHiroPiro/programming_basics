(* 目的：身長と体重が与えられたとき、BMI を求める *)
(* bmi : float -> float -> float *)
let bmi shintyo taiju = taiju /. (shintyo ** 2.)

(* テスト *)
let test1 = bmi 1.5 38. = 16.8888888888888893
let test2 = bmi 1.7 90. = 31.1418685121107295
let test3 = bmi 1.6 55. = 21.4843749999999964

(* 目的：身長と体重が与えられたとき、BMI を求め体型を返す *)
(* taikei : float -> float -> string *)
let taikei shintyo taiju = if bmi shintyo taiju < 18.5
  then "やせ"
  else if bmi shintyo taiju < 25.
    then "標準"
    else if bmi shintyo taiju < 30.
      then "肥満"
      else "高度肥満"

(* テスト *)
let test1 = taikei 1.5 38. = "やせ"
let test2 = taikei 1.7 90. = "高度肥満"
let test3 = taikei 1.6 55. = "標準"
