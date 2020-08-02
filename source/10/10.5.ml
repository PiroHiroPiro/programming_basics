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
let gakusei_99 = {namae="たかし"; tensuu=99; seiseki="A";}
let gakusei_43 = {namae="えみ"; tensuu=43; seiseki="F";}
let gakusei_82 = {namae="とおる"; tensuu=82; seiseki="B";}

(*
(* 目的：点数が降順に並んでいる学生のリストと学生を受け取り、点数が降順となる位置に挿入した学生のリストを返す *)
(* gakusei_insert : gakusei_t list -> gakusei_t -> gakusei_t list *)
let rec gakusei_insert lst gakusei = match gakusei with {namae=n; tensuu=t; seiseki=s} -> match lst with
    [] -> [gakusei]
  | ({namae=fn; tensuu=ft; seiseki=fs} as first) :: rest -> if ft < t then gakusei :: lst else first :: gakusei_insert rest gakusei

(* 目的：学生のリストを受け取り、点数で降順に整列した学生のリストを返す *)
(* gakusei_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_sort lst = match lst with
    [] -> []
  | first :: rest -> gakusei_insert (gakusei_sort rest) first

(* List が空のときの例外 *)
exception List_ga_kara

(* 目的：学生のリストを受け取り、点数が最も高い学生を返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let gakusei_max lst = match gakusei_sort lst with
    [] -> raise List_ga_kara
  | first :: rest -> first
 *)

(* 目的：学生のリストを受け取り、点数が最も高い学生を返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
    [] -> {namae=""; tensuu=min_int; seiseki=""}
  | ({namae=fn; tensuu=ft; seiseki=fs} as first) :: rest -> match gakusei_max rest with    {namae=n; tensuu=t; seiseki=s} ->
    if t < ft then first else gakusei_max rest

(* テスト *)
let test1 = gakusei_max [gakusei_99; gakusei_43; gakusei_82] = gakusei_99
let test2 = gakusei_max [gakusei_82; gakusei_43; gakusei_99] = gakusei_99
