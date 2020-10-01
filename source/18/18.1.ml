type person_t = {
  name: string; (* 名前 *)
  height: float; (* 身長 *)
  weight: float; (* 体重 *)
  birthday: string; (* 誕生日 *)
  bloodtype: string; (* 血液型 *)
}

let person_A1 = {name="たかし"; height=1.65; weight=55.;  birthday="1992/08/07"; bloodtype="A";}
let person_O  = {name="えみ";   height=1.42; weight=50.1; birthday="1998/10/21"; bloodtype="O";}
let person_A2 = {name="とおる"; height=1.85; weight=69.3; birthday="1995/01/06"; bloodtype="A";}

(* 目的：person_t 型のリストを受け取り、最初の A 型の人のレコードをオプション型で返す。もしいなければ、None を返す。 *)
(* first_A : person_t list -> pseron_t option *)
let rec first_A lst = match lst with
    [] -> None
  | first :: rest ->
      if first.bloodtype = "A" then Some (first)
                               else first_A rest

(* テスト：first_A *)
let test1 = first_A [person_O; person_A2; person_A1] = Some (person_A2)
let test2 = first_A [person_O; person_O] = None
