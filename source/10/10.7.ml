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

(* 目的：人のリストを受け取り、各血液型の人数を集計(A, B, O, AB)して返す *)
(* ketueki_shukei : person_t list -> int * int * int * int *)
let rec ketueki_shukei lst = match lst with
    [] -> (0, 0, 0, 0)
  | {name=n; height_meter=h; weight_kg=w; birthday=(m, d); bloodtype=bt} :: rest ->
    let shukei_rest = ketueki_shukei rest in
    match shukei_rest with (a, b, o, ab) ->
    if bt = "A" then (a + 1, b, o, ab)
    else if bt = "B" then (a, b + 1, o, ab)
    else if bt = "O" then (a, b, o + 1, ab)
    else  (a, b, o, ab + 1)

(* テスト *)
let test1 = ketueki_shukei persons1 = (1, 1, 1, 0)
