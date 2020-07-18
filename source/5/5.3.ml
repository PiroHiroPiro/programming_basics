(* 目的：月日から星座を求める *)
(* seiza : int -> int -> string *)
let seiza month day =
  if month = 1
    then if day < 20 then "山羊座" else "水瓶座"
    else if month = 2
      then if day < 19 then "水瓶座" else "魚座"
      else if month = 3
        then if day < 21 then "魚座" else "牡羊座"
        else if month = 4
          then if day < 20 then "牡羊座" else "牡牛座"
          else if month = 5
            then if day < 21 then "牡牛座" else "双子座"
            else if month = 6
              then if day < 22 then "双子座" else "蟹座"
              else if month = 7
                then if day < 23 then "蟹座" else "獅子座"
                else if month = 8
                  then if day < 23 then "獅子座" else "乙女座"
                  else if month = 9
                    then if day < 23 then "乙女座" else "天秤座"
                    else if month = 10
                      then if day < 24 then "天秤座" else "蠍座"
                      else if month = 11
                        then if day < 24 then "蠍座" else "射手座"
                        else if month = 12
                          then if day < 22 then "射手座" else "山羊座"
                          else "Unknown...Are you Alien ?"

(* テスト *)
let test1 = seiza 3 30 = "牡羊座"
let test2 = seiza 5 20 = "牡牛座"
let test3 = seiza 6 1 = "双子座"
let test4 = seiza 7 10 = "蟹座"
let test5 = seiza 7 23 = "獅子座"
let test6 = seiza 8 30 = "乙女座"
let test7 = seiza 9 23 = "天秤座"
let test8 = seiza 11 7 = "蠍座"
let test9 = seiza 12 15 = "射手座"
let test10 = seiza 1 1 = "山羊座"
let test11 = seiza 1 20 = "水瓶座"
let test12 = seiza 3 20 = "魚座"
