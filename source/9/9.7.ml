(* 人のデータを表す型 *)
type person_t = {
  name: string;
  height_meter: float;
  weight_kg: float;
  birthday: string;
  bloodtype: string;
}

(* person_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest（first は person_t 型、rest が自己参照のケース）
  という形 *)

let person1 = {name="たかし"; height_meter=1.65; weight_kg=55.; birthday="1992/08/07"; bloodtype="A";}
let person2 = {name="えみ"; height_meter=1.42; weight_kg=50.1; birthday="1998/10/21"; bloodtype="O";}
let person3 = {name="とおる"; height_meter=1.85; weight_kg=69.3; birthday="1995/01/06"; bloodtype="B";}

let persons1 = [person1; person2; person3];;
let persons2 = [person1; person2; person1];;
let persons3 = [person3; person2; person2];;

(* 目的：人のリストを受け取り、A 型の人数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_A lst = match lst with
    [] -> 0
  | {name=n; height_meter=h; weight_kg=w; birthday=bd; bloodtype=bt} :: rest
    -> count_ketsueki_A rest + if bt = "A" then 1 else 0

(* テスト *)
let test1 = count_ketsueki_A persons1 = 1
let test2 = count_ketsueki_A persons2 = 2
let test3 = count_ketsueki_A persons3 = 0
