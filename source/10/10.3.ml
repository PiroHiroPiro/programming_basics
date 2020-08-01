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

(* gakusei_t list 型のデータ例 *)
let gakusei1 = {namae="たかし"; tensuu=99; seiseki="A";}
let gakusei2 = {namae="えみ"; tensuu=43; seiseki="F";}
let gakusei3 = {namae="とおる"; tensuu=82; seiseki="B";}

let gakusei_lst1 = [gakusei1; gakusei2; gakusei3];;


(* 目的：降順に並んでいる学生のリストと学生を受け取り、点数が降順となる位置に挿入した学生のリストを返す *)
(* gakusei_insert : gakusei_t list -> gakusei_t -> gakusei_t list *)
let rec gakusei_insert lst gakusei = match gakusei with {namae=n; tensuu=t; seiseki=s} -> match lst with
    [] -> [gakusei]
  | ({namae=fn; tensuu=ft; seiseki=fs} as first) :: rest -> if ft < t then gakusei :: lst else first :: gakusei_insert rest gakusei

(* 目的：学生のリストを受け取り、点数で降順に整列した学生のリストを返す *)
(* gakusei_ins_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_sort lst = match lst with
    [] -> []
  | first :: rest -> gakusei_insert (gakusei_sort rest) first

(* テスト *)
let test1 = gakusei_sort gakusei_lst1 = [gakusei1; gakusei3; gakusei2]
