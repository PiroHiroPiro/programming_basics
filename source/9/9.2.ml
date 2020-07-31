(* 人のデータを表す型 *)
type person_t = {
  name: string; (* 名前 *)
  height_meter: float; (* 身長（m） *)
  weight_kg: float; (* 体重（kg） *)
  birthday: string; (* 誕生日 *)
  bloodtype: string; (* 血液型 *)
}

let person1 = {name="たかし"; height_meter=1.65; weight_kg=55.; birthday="1992/08/07"; bloodtype="A";}
let person2 = {name="えみ"; height_meter=1.42; weight_kg=50.1; birthday="1998/10/21"; bloodtype="O";}
let person3 = {name="とおる"; height_meter=1.85; weight_kg=69.3; birthday="1995/01/06"; bloodtype="B";}

let persons = person1 :: person2 :: person3 :: [];;
