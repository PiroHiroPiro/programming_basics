#use "metro/15.ml"

(* 目的：未確定の eki_t 型のリストと ekikan_t 型のリストを受け取り、ダイクストラ法に従って各駅の最短距離と最短経路が入った eki_t 型のリストを返す *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let dijkstra_main eki_lst ekikan_lst =
  (* 直前の確定 eki_t と未確定の eki_t 型のリストを受け取り、次の確定 eki_t と未確定の eki_t 型のリストを返す *)
  (* iter : eki_t * eki_t list -> eki_t list *)
  let rec iter current_state = match current_state with (kakutei_eki, mikakutei_eki_lst) ->
    match mikakutei_eki_lst with
      [] -> [kakutei_eki]
    | first :: rest -> kakutei_eki :: iter (saitan_no_bunri (koushin kakutei_eki mikakutei_eki_lst ekikan_lst))
  in iter (saitan_no_bunri eki_lst)

(* 初期化済み eki_t 型のリスト *)
let initialized_eki_lst = make_initial_eki_list [ekimei_myogadani; ekimei_korakuen; ekimei_iidabashi; ekimei_shinotsuka; ekimei_ikebukuro; ekimei_higashiikebukuro; ekimei_gokokuji; ekimei_edogawabashi] "飯田橋"

(* テスト：dijkstra_main *)
let test_16_1 = dijkstra_main initialized_eki_lst global_ekikan_list

(* 目的：始点と終点の駅名を受け取り、ダイクストラ法に従い最短経路を返す *)
(* dijkstra : string -> string -> eki_t *)
let dijkstra shiten_romaji shuten_romaji =
  let seiretsuzumi_global_ekimei_list = seiretsu global_ekimei_list in
  let shiten_kanji = romaji_to_kanji shiten_romaji global_ekimei_list in
  let shuten_kanji = romaji_to_kanji shuten_romaji global_ekimei_list in
  let initialized_eki_list = make_initial_eki_list seiretsuzumi_global_ekimei_list shiten_kanji in
  let saitan_keiro_eki_lst = dijkstra_main initialized_eki_list global_ekikan_list in
  match List.filter (fun eki -> eki.namae = shuten_kanji) saitan_keiro_eki_lst with
      [] -> raise List_ga_kara
    | first :: rest -> first

(* テスト：dijkstra *)
let test_16_2 = dijkstra "iidabashi" "myogadani" = eki_from_iidabashi_to_myogadani_1
