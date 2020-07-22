(* 人のデータ（名前、身長、体重、誕生日、血液型）を表す型 *)
type person_t = {
  name: string ; (* 名前 *)
  height: float ; (* 身長 *)
  weight: float ; (* 体重 *)
  birthday: string ; (* 誕生日 *)
  bloodtype: string ; (* 血液型 *)
}

(* 目的：人のデータを受け取り、血液型を返す *)
(* ketsueki_hyoji : person_t -> string *)
let ketsueki_hyoji person = match person with {name=n ; height=h ; weight=w ; birthday=bd ; bloodtype=bt ;} -> n ^ "さんの血液型は" ^ bt ^ "型です"

(* テスト *)
let person1 = {name="たかし" ; height=1.65 ; weight=55. ; birthday="1992/08/07" ; bloodtype="A" ;}
let person2 = {name="えみ" ; height=1.42 ; weight=50.1 ; birthday="1998/10/21" ; bloodtype="O" ;}
let person3 = {name="とおる" ; height=1.85 ; weight=69.3 ; birthday="1995/01/06" ; bloodtype="B" ;}
let test1 = ketsueki_hyoji person1 = "たかしさんの血液型はA型です"
let test2 = ketsueki_hyoji person2 = "えみさんの血液型はO型です"
let test3 = ketsueki_hyoji person3 = "とおるさんの血液型はB型です"
