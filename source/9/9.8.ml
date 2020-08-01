(* 人のデータを表す型 *)
type person_t = {
  name: string;
  height_meter: float;
  weight_kg: float;
  birthday: int * int;
  bloodtype: string;
}

(*
  person_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest（first は person_t 型、rest が自己参照のケース）
  という形
*)

(* person_t list 型のデータ例 *)
let person1 = {name="たかし"; height_meter=1.65; weight_kg=55.; birthday=(8, 25); bloodtype="A";}
let person2 = {name="えみ"; height_meter=1.42; weight_kg=50.1; birthday=(10, 21); bloodtype="O";}
let person3 = {name="とおる"; height_meter=1.85; weight_kg=69.3; birthday=(1, 6); bloodtype="B";}

let persons1 = [person1; person2; person3];;
let persons2 = [person1; person2; person1];;
let persons3 = [person3; person2; person2];;

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

(* 目的：人のリストを受け取り、乙女座の人の名前のリストを返す *)
(* otomeza : person_t list -> string list *)
let rec otomeza lst = match lst with
    [] -> []
  | {name=n; height_meter=h; weight_kg=w; birthday=(m, d); bloodtype=b} :: rest
    -> if seiza m d = "乙女座" then n :: otomeza rest else otomeza rest

(* テスト *)
let test1 = otomeza persons1 = ["たかし"]
let test2 = otomeza persons2 = ["たかし"; "たかし"]
let test3 = otomeza persons3 = []
