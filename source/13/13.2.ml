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
let person_1 = {name="たかし"; height_meter=1.65; weight_kg=55.; birthday=(8, 25); bloodtype="A";}
let person_2 = {name="えみ"; height_meter=1.42; weight_kg=50.1; birthday=(10, 21); bloodtype="O";}
let person_3 = {name="とおる"; height_meter=1.85; weight_kg=69.3; birthday=(1, 6); bloodtype="B";}

(* 目的：関数とリストを受け取り、関数を施したリストを返す *)
(* map : ('a -> 'b) -> 'a list -> 'b list *)
let rec map f lst = match lst with
    [] -> []
  | first :: rest -> f first :: map f rest

(* 目的：人を受け取り、名前を返す *)
(* get_person_name : person_t -> string *)
let get_person_name person = match person with {name=name} -> name

(* テスト *)
let test1 = get_person_name person_1 = "たかし"

(* 目的：人のリストを受け取り、名前のリストを返す *)
(* person_namae : person_t list -> string list *)
let person_namae lst = map get_person_name lst

(* テスト *)
let test2 = person_namae [person_1; person_2; person_3] = ["たかし"; "えみ"; "とおる"]
