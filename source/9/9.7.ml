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

(* person_t 型のデータ例 *)
let person_A = {name="たかし"; height_meter=1.65; weight_kg=55.; birthday=(8, 25); bloodtype="A";}
let person_O = {name="えみ"; height_meter=1.42; weight_kg=50.1; birthday=(10, 21); bloodtype="O";}
let person_B = {name="とおる"; height_meter=1.85; weight_kg=69.3; birthday=(1, 6); bloodtype="B";}

(* 目的：人のリストを受け取り、A 型の人数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_A lst = match lst with
    [] -> 0
  | {name=n; height_meter=h; weight_kg=w; birthday=(m, d); bloodtype=b} :: rest
    -> count_ketsueki_A rest + if b = "A" then 1 else 0

(* テスト *)
let test1 = count_ketsueki_A [person_A; person_O; person_B] = 1
let test2 = count_ketsueki_A [person_A; person_O; person_A] = 2
let test3 = count_ketsueki_A [person_O; person_O; person_B] = 0
