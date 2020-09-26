#use "metro/16.ml"

(* 目的：駅名と駅名と距離の組のリストを受け取り、その駅までの距離を返す *)
(* assoc : string -> (string * float) list -> float *)
let rec assoc target_ekimei lst = match lst with
    [] -> infinity
  | (ekimei, kyori) :: rest ->
      if target_ekimei = ekimei then kyori
                                else assoc target_ekimei rest

(* テスト：assoc *)
let test_17_1 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8
let test_17_2 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)] = infinity

(* 目的：ekikan_tree_t 型と ekikan_t 型を受け取り、情報を挿入した ekikan_tree_t 型を返す*)
(* insert_ekikan : ekikan_tree_t -> ekikan_t -> ekikan_tree_t *)
let insert_ekikan tree ekikan =
  let rec insert_ekikan_one tree kiten shuten kyori = match tree with
      Empty -> Node (Empty, (kiten, [(shuten, kyori)]), Empty)
    | Node (left_t, n, right_t) -> match n with (ekimei, lst) ->
        if ekimei = kiten then Node (left_t, (kiten, (shuten, kyori) :: lst), right_t)
        else if ekimei > kiten then Node (insert_ekikan_one left_t kiten shuten kyori, n, right_t)
        else Node (left_t, n, insert_ekikan_one right_t kiten shuten kyori)
  in match ekikan with {kiten=kiten; shuten=shuten; kyori=kyori} ->
  let one_insered_tree = insert_ekikan_one tree kiten shuten kyori in
  insert_ekikan_one one_insered_tree shuten kiten kyori

(* テスト：insert_ekikan *)
let test_17_3 = insert_ekikan ekikan_tree_1 {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2} = ekikan_tree_2

(* 目的：ekikan_tree_t 型の木と ekikan_t 型のリストを受け取り、リスト内のデータを木に挿入して返す *)
(* inserts_ekikan : ekikan_tree_t -> ekikan list -> ekikan_tree_t *)
let rec inserts_ekikan tree lst = match lst with
    [] -> tree
  | first :: rest -> inserts_ekikan (insert_ekikan tree first) rest

(* テストデータ *)
let ekikan_lst = [
  {kiten="池袋"; shuten="新大塚"; keiyu="丸ノ内線"; kyori=1.8; jikan=3};
  {kiten="新大塚"; shuten="茗荷谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2};
  {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2};
  {kiten="飯田橋"; shuten="後楽園"; keiyu="南北線"; kyori=1.4 ; jikan=2};
  {kiten="後楽園"; shuten="東大前"; keiyu="南北線"; kyori=1.3 ; jikan=3};
]

(* テスト：inserts_ekikan *)
let test_17_4 = inserts_ekikan ekikan_tree_1 ekikan_lst = ekikan_tree_3
