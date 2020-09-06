#use "metro/10.ml"

(* 目的：ekimei_t 型のリストと駅名を受け取り、ダイクストラ法で用いる eki_t 型のリストを作成する、また対称の駅のデータのみ初期化する *)
(* make_initial_eki_list : ekimei_t list -> string -> eki_t list *)
let make_initial_eki_list ekimei_list kanji_ekimei =
  List.map
    (fun eki -> if eki.namae = kanji_ekimei
      then {namae=eki.namae; saitan_kyori=0.      ; temae_list=[eki.namae]}
      else {namae=eki.namae; saitan_kyori=infinity; temae_list=[]})
    ekimei_list

(* テスト：make_initial_eki_list *)
let test_12_1 = make_initial_eki_list [eki_shokika_myogadani; eki_shokika_ikebukuro; eki_shokika_tokyo] "東京" = [
  {namae="茗荷谷"; saitan_kyori=infinity; temae_list=[]};
  {namae="池袋";   saitan_kyori=infinity; temae_list=[]};
  {namae="東京";   saitan_kyori=0.;       temae_list=["東京"]}
]

(* 目的：ekimei_t 型のリストを受け取り、ひらがなの順に並び替え重複を削除した ekimei_t 型のリストを返す *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu ekimei_list =
  (* 目的：ekimei_t 型のリストを受け取り、駅のひらがな名順で整列した ekimei_t 型のリストを返す *)
  (* ekimei_sort : ekimei_t list -> ekimei_t list *)
  let rec ekimei_sort lst =
    (* 目的：駅名のひらがな順で整列した ekimei_t 型のリストと ekimei_t 型を受け取り、駅のひらがな名順に適切な位置の挿入した ekimei_t 型のリストを返す *)
    (* ekimei_insert : ekimei_t list -> ekimei_t -> ekimei_t list *)
    let rec ekimei_insert lst ekimei = match ekimei with {kana=kana} -> match lst with
        [] -> [ekimei]
      | ({kana=k} as first) :: rest ->
        if k > kana
          then ekimei :: lst
          else first :: ekimei_insert rest ekimei
    in match lst with
      [] -> []
    | first :: rest -> ekimei_insert (ekimei_sort rest) first
  in match ekimei_sort ekimei_list with
    [] -> []
  | first :: [] -> [first]
  | ({kana=first_k} as first) :: ({kana=second_k} as second) :: rest ->
    if first_k = second_k
      then first :: seiretsu rest
      else first :: seiretsu (second :: rest)

(* テスト：seiretsu *)
let test_12_2 = seiretsu [ekimei_ikebukuro2; ekimei_tokyo; ekimei_myogadani; ekimei_ikebukuro] = [ekimei_ikebukuro; ekimei_tokyo; ekimei_myogadani]
