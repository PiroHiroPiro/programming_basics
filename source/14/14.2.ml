(* 学生データの型 *)
type gakusei_t = {
  namae: string;
  tensuu: int;
  seiseki: string;
}

(*
  gakusei_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest（first は gakusei_t 型、rest が自己参照のケース）
  という形
*)

(* gakusei_t 型のデータ例 *)
let gakusei_A = {namae="たかし"; tensuu=99; seiseki="A";}
let gakusei_F = {namae="えみ"; tensuu=43; seiseki="F";}
let gakusei_B = {namae="とおる"; tensuu=82; seiseki="B";}

(* 目的：gakusei_t 型のリストを受け取り、成績が A の学生を返す *)
(* count_A : gakusei_t list -> int *)
let count_A lst = List.length (List.filter (fun gakusei -> gakusei.seiseki = "A") lst)

(* テスト *)
let test1 = count_A [] = 0
let test2 = count_A [gakusei_A] = 1
let test3 = count_A [gakusei_B] = 0
let test4 = count_A [gakusei_A; gakusei_B; gakusei_A] = 2
