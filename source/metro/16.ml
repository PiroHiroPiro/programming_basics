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

(* eki_t 型のデータ例 *)
let eki_shokika_korakuen         = {namae="後楽園";   saitan_kyori=infinity; temae_list=[]}
let eki_shokika_iidabashi        = {namae="飯田橋";   saitan_kyori=infinity; temae_list=[]}
let eki_shokika_shinotsuka       = {namae="新大塚";   saitan_kyori=infinity; temae_list=[]}
let eki_shokika_ikebukuro        = {namae="池袋";     saitan_kyori=infinity; temae_list=[]}
let eki_shokika_higashiikebukuro = {namae="東池袋";   saitan_kyori=infinity; temae_list=[]}
let eki_shokika_gokokuji         = {namae="護国寺";   saitan_kyori=infinity; temae_list=[]}
let eki_shokika_edogawabashi     = {namae="江戸川橋"; saitan_kyori=infinity; temae_list=[]}

(* 初期化済み eki_t 型のリスト *)
let initialized_eki_lst = make_initial_eki_list [eki_shokika_myogadani; eki_shokika_korakuen; eki_shokika_iidabashi; eki_shokika_shinotsuka; eki_shokika_ikebukuro; eki_shokika_higashiikebukuro; eki_shokika_gokokuji; eki_shokika_edogawabashi] "飯田橋"

(* テスト：dijkstra_main *)
let test_16_1 = dijkstra_main initialized_eki_lst global_ekikan_list
