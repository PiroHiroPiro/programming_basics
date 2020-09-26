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

(* 目的：ekikan_tree_t 型のと ekikan_t 型のリストを受け取り、リスト内のデータを木に挿入して返す *)
(* inserts_ekikan : ekikan_tree_t -> ekikan list -> ekikan_tree_t *)
let rec inserts_ekikan tree lst = match lst with
    [] -> tree
  | first :: rest -> inserts_ekikan (insert_ekikan tree first) rest

(* let inserts_ekikan tree lst = List.fold_right insert_ekikan lst tree *)

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

(* 目的：ekikan_tree_t 型と駅名を受け取り、駅名のデータを返す *)
(* ekikan_search : ekikan_tree_t -> string -> (string * float) lst *)
let rec ekikan_search tree target_ekimei = match tree with
    Empty -> []
  | Node (left_t, n, right_t) -> match n with (ekimei, lst) ->
    if ekimei = target_ekimei then lst
    else if ekimei > target_ekimei then ekikan_search left_t target_ekimei
    else ekikan_search right_t target_ekimei

(* テスト：ekikan_search *)
let test_17_5 = ekikan_search ekikan_tree_1 "茗荷谷" = []
let test_17_6 = ekikan_search ekikan_tree_3 "茗荷谷" = [("後楽園", 1.8); ("新大塚", 1.2)]

(* 目的：二つの駅名と ekikan_tree_t 型を受け取り、距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_tree_t -> float *)
let get_ekikan_kyori eki1 eki2 ekikan_tree = let kyori_lst = ekikan_search ekikan_tree eki1 in
  assoc eki2 kyori_lst

let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list

(* テスト：get_ekikan_kyori *)
let test_17_7 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_tree = 1.2

(* 目的：確定した eki_t 型と未確定の eki_t 型のリストを受け取り、更新処理を実施し未確定の eki_t 型のリストを返す *)
(* koushin : eki_t -> eki_t list -> ekikan_tree_t -> eki_t list *)
let koushin kakutei_eki koushin_before ekikan_tree = List.map
  (
    (
      fun kakutei_eki eki -> match eki with {namae=namae; saitan_kyori=saitan_kyori; temae_list=temae_list} ->
        match kakutei_eki with {namae=kakutei_namae; saitan_kyori=kakutei_saitan_kyori; temae_list=kakutei_temae_list} ->
          let kyori = get_ekikan_kyori namae kakutei_namae ekikan_tree in
            if kyori = infinity
              then eki
              else let candidate_saitan_kyori = kakutei_saitan_kyori +. kyori in
                if candidate_saitan_kyori > saitan_kyori
                  then eki
                  else {namae=namae; saitan_kyori=candidate_saitan_kyori; temae_list=namae :: kakutei_temae_list}
    )
    kakutei_eki
  )
  koushin_before

(* テスト：koushin *)
let test_17_8 = koushin eki_from_iidabashi_to_korakuen [eki_from_iidabashi_to_myogadani_2; eki_shokika_ikebukuro; eki_shokika_tokyo] global_ekikan_tree = [eki_from_iidabashi_to_myogadani_1; eki_shokika_ikebukuro; eki_shokika_tokyo]

(* 目的：未確定の eki_t 型のリストと ekikan_tree_t 型を受け取り、ダイクストラ法に従って各駅の最短距離と最短経路が入った eki_t 型のリストを返す *)
(* dijkstra_main : eki_t list -> ekikan_tree_t -> eki_t list *)
let dijkstra_main eki_lst ekikan_tree =
  (* 直前の確定 eki_t と未確定の eki_t 型のリストを受け取り、次の確定 eki_t と未確定の eki_t 型のリストを返す *)
  (* iter : eki_t * eki_t list -> eki_t list *)
  let rec iter current_state = match current_state with (kakutei_eki, mikakutei_eki_lst) ->
    match mikakutei_eki_lst with
      [] -> [kakutei_eki]
    | first :: rest -> kakutei_eki :: iter (saitan_no_bunri (koushin kakutei_eki mikakutei_eki_lst ekikan_tree))
  in iter (saitan_no_bunri eki_lst)

(* 初期化済み eki_t 型のリスト *)
let shokikazumi_eki_lst = shokika_eki_list [ekimei_myogadani; ekimei_korakuen; ekimei_iidabashi; ekimei_shinotsuka; ekimei_ikebukuro; ekimei_higashiikebukuro; ekimei_gokokuji; ekimei_edogawabashi] "飯田橋"

(* テスト：dijkstra_main *)
let test_17_9 = dijkstra_main shokikazumi_eki_lst global_ekikan_tree =
  [
    {namae = "飯田橋";   saitan_kyori = 0.;                  temae_list = ["飯田橋"]};
    {namae = "後楽園";   saitan_kyori = 1.4;                 temae_list = ["後楽園"; "飯田橋"]};
    {namae = "江戸川橋"; saitan_kyori = 1.6;                 temae_list = ["江戸川橋"; "飯田橋"]};
    {namae = "護国寺";   saitan_kyori = 2.90000000000000036; temae_list = ["護国寺"; "江戸川橋"; "飯田橋"]};
    {namae = "茗荷谷";   saitan_kyori = 3.2;                 temae_list = ["茗荷谷"; "後楽園"; "飯田橋"]};
    {namae = "東池袋";   saitan_kyori = 4.;                  temae_list = ["東池袋"; "護国寺"; "江戸川橋"; "飯田橋"]};
    {namae = "新大塚";   saitan_kyori = 4.4;                 temae_list = ["新大塚"; "茗荷谷"; "後楽園"; "飯田橋"]};
    {namae = "池袋";     saitan_kyori = 6.;                  temae_list = ["池袋"; "東池袋"; "護国寺"; "江戸川橋"; "飯田橋"]}
  ]

(* 目的：始点と終点の駅名を受け取り、ダイクストラ法に従い最短経路を返す *)
(* dijkstra : string -> string -> eki_t *)
let dijkstra shiten_romaji shuten_romaji =
  let seiretsuzumi_global_ekimei_list = seiretsu global_ekimei_list in
  let shiten_kanji = romaji_to_kanji shiten_romaji global_ekimei_list in
  let shuten_kanji = romaji_to_kanji shuten_romaji global_ekimei_list in
  let shokikazumi_eki_lst = shokika_eki_list seiretsuzumi_global_ekimei_list shiten_kanji in
  let saitan_keiro_eki_lst = dijkstra_main shokikazumi_eki_lst global_ekikan_tree in
  match List.filter (fun eki -> eki.namae = shuten_kanji) saitan_keiro_eki_lst with
      [] -> raise List_ga_kara
    | first :: rest -> first

(* テスト：dijkstra *)
let test_17_10 = dijkstra "iidabashi" "myogadani" = eki_from_iidabashi_to_myogadani_1
