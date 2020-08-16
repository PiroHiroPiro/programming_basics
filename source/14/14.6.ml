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

(* 目的：gakusei_t 型のリストと成績を受け取り、成績の人数を返す *)
(* count_A : gakusei_t list -> string -> int *)
let count lst seiseki = let has_A gakusei = gakusei.seiseki = seiseki in
  List.length (List.filter has_A lst)

(* テスト *)
let test1 = count [] "A" = 0
let test2 = count [gakusei_A] "A" = 1
let test3 = count [gakusei_B] "A" = 0
let test4 = count [gakusei_A; gakusei_B; gakusei_A] "A" = 2
