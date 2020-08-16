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

(* fun person -> person.name; *)

(* テスト *)
let test1 = (fun person -> person.name) person_1 = "たかし"
