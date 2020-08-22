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
let gakusei_90 = {namae="たかし"; tensuu=90; seiseki="A";}
let gakusei_40 = {namae="えみ"; tensuu=40; seiseki="F";}
let gakusei_80 = {namae="とおる"; tensuu=80; seiseki="B";}

(* 目的：gakusei_t 型のリストを受け取り、合計点数を返す *)
(* gakusei_sum : gakusei_t list -> int *)
let gakusei_sum lst = List.fold_right (fun gakusei sum -> gakusei.tensuu + sum) lst 0

(* テスト *)
let test1 = gakusei_sum [] = 0
let test2 = gakusei_sum [gakusei_90] = 90
let test3 = gakusei_sum [gakusei_90; gakusei_40; gakusei_80] = 210
