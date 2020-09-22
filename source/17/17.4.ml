(* 年月を表す型 *)
type year_t = January of int
            | February of int
            | March of int
            | April of int
            | May of int
            | June of int
            | July of int
            | August of int
            | September of int
            | October of int
            | November of int
            | December of int

(* 星座を表す型 *)
type seiza_t = Aries
             | Taurus
             | Gemini
             | Cancer
             | Leo
             | Virgo
             | Libra
             | Scorpio
             | Sagittarius
             | Capricorn
             | Aquarius
             | Pisces

(* 目的：日付を mmdd 形式に変える *)
(* format_date : year_t -> int *)
let format_date date = match date with
    January (day)   ->  100 + day
  | February (day)  ->  200 + day
  | March (day)     ->  300 + day
  | April (day)     ->  400 + day
  | May (day)       ->  500 + day
  | June (day)      ->  600 + day
  | July (day)      ->  700 + day
  | August (day)    ->  800 + day
  | September (day) ->  900 + day
  | October (day)   -> 1000 + day
  | November (day)  -> 1100 + day
  | December (day)  -> 1200 + day

(* テスト：format_date *)
let test1 = format_date (January 10) = 110
let test2 = format_date (November 7) = 1107

(* 目的：月日から星座を求める *)
(* seiza : year_t -> seiza_t *)
let seiza date = let formatted_date = format_date date in
  if formatted_date <= 119 then "山羊座"
  else if formatted_date <= 218 then "水瓶座"
  else if formatted_date <= 320 then "魚座"
  else if formatted_date <= 419 then "牡羊座"
  else if formatted_date <= 520 then "牡牛座"
  else if formatted_date <= 621 then "双子座"
  else if formatted_date <= 722 then "蟹座"
  else if formatted_date <= 822 then "獅子座"
  else if formatted_date <= 922 then "乙女座"
  else if formatted_date <= 1023 then "天秤座"
  else if formatted_date <= 1122 then "蠍座"
  else if formatted_date <= 1221 then "射手座"
  else "山羊座"

(* テスト：seiza *)
let test3 = seiza (January 10) = "山羊座"
let test4 = seiza (November 7) = "蠍座"
