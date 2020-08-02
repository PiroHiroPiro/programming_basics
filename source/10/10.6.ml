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

(* 目的：学生のリストを受け取り、点数が最も高い学生を返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
    [] -> {namae=""; tensuu=min_int; seiseki=""}
  | ({namae=fn; tensuu=ft; seiseki=fs} as first) :: rest ->
    let rest_max = gakusei_max rest in
    match rest_max with {namae=n; tensuu=t; seiseki=s} ->
    if t < ft then first else rest_max

(* テスト *)
let test1 = gakusei_max [gakusei_99; gakusei_43; gakusei_82] = gakusei_99
let test2 = gakusei_max [gakusei_82; gakusei_43; gakusei_99] = gakusei_99
