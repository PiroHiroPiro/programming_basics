#use "metro/13.ml"

(* List が空のときの例外 *)
exception List_ga_kara

(* 目的：更新済みの eki_t 型のリストを受け取り、最短距離最小の eki_t と最短距離最小の eki_t 以外からなるリストの組を返す *)
(* saitan_no_bunri : eki_t list -> eki_t * eki_t list *)
let saitan_no_bunri lst =
  (* 目的：最短距離最小候補の eki_t と最短距離が最小ではなかった eki_t のリストと未確認の eki_t のリストを受け取り、最短距離最小の eki_t と最短距離最小の eki_t 以外からなるリストの組を返す *)
  (* saitan_no_bunri_iter : eki_t -> eki_t list -> eki_t list -> eki_t * eki_t list *)
  let saitan_no_bunri_1 eki current_state = match current_state with (saitankyori_saisho_koho_eki, kakuninzumi_eki_lst) ->
    if saitankyori_saisho_koho_eki.saitan_kyori > eki.saitan_kyori
      then (eki, saitankyori_saisho_koho_eki :: kakuninzumi_eki_lst)
      else (saitankyori_saisho_koho_eki, eki :: kakuninzumi_eki_lst)
  in match lst with
      [] -> raise List_ga_kara
    | first :: rest -> List.fold_right saitan_no_bunri_1 rest (first, [])

(* テスト：saitan_no_bunri *)
let test_15_1 = saitan_no_bunri [eki_from_iidabashi_to_korakuen; eki_from_iidabashi_to_myogadani_2; eki_from_tokyo_to_otemachi] = (eki_from_tokyo_to_otemachi, [eki_from_iidabashi_to_myogadani_2; eki_from_iidabashi_to_korakuen])
