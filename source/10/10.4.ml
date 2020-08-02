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
let person_2 = {name="たかし"; height_meter=1.65; weight_kg=55.; birthday=(8, 25); bloodtype="A";}
let person_1 = {name="えみ"; height_meter=1.42; weight_kg=50.1; birthday=(10, 21); bloodtype="O";}
let person_3 = {name="とおる"; height_meter=1.85; weight_kg=69.3; birthday=(1, 6); bloodtype="B";}

(* 目的：名前順で整列した人のリストと人を受け取り、名前順に適切な位置の挿入した人のリストを返す *)
(* person_insert : person_t list -> person_t -> person_t list *)
let rec person_insert lst person = match person with {name=n} -> match lst with
    [] -> [person]
  | ({name=fn} as first) :: rest -> if fn > n then person :: lst else first :: person_insert rest person

(* 目的：人のリストを受け取り、名前順で整列した人のリストを返す *)
(* person_sort : person_t list -> person_t list *)
let rec person_sort lst = match lst with
    [] -> []
  | first :: rest -> person_insert (person_sort rest) first

(* テスト *)
let test1 = person_sort [person_3; person_2; person_1] = [person_1; person_2; person_3];;
