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

(* 目的：人のリストを受け取り、最も人数の多い血液型を返す *)
(* saita_ketueki : person_t list -> string *)
let saita_ketueki lst = let shukei = ketueki_shukei lst in
  match shukei with (a, b, o, ab) ->
  if a > b && a > o && a > ab then "A"
  else if b > o && b > ab then "B"
  else if o > ab then "O"
  else "AB"

(* テスト *)
let test1 = saita_ketueki [person_A; person_O; person_B; person_O] = "O"
