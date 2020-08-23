#use "metro/12.ml"

(* 目的：確定した eki_t 型と未確定の eki_t 型のリストを受け取り、更新処理を実施し未確定の eki_t 型のリストを返す *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin kakutei_eki koushin_before = List.map
  (
    (
      fun kakutei_eki eki -> match eki with {namae=namae; saitan_kyori=saitan_kyori; temae_list=temae_list} ->
        match kakutei_eki with {namae=kakutei_namae; saitan_kyori=kakutei_saitan_kyori; temae_list=kakutei_temae_list} ->
          let kyori = get_ekikan_kyori namae kakutei_namae global_ekikan_list in
            if kyori = infinity then
              eki
            else
              let candidate_saitan_kyori = kakutei_saitan_kyori +. kyori in
              if candidate_saitan_kyori > saitan_kyori then
                eki
              else
                {namae=namae; saitan_kyori=candidate_saitan_kyori; temae_list=namae :: kakutei_temae_list}
    )
    kakutei_eki
  )
  koushin_before

(* テスト：koushin *)
let test1 = koushin eki_from_iidabashi_to_korakuen [eki_from_iidabashi_to_myogadani_2; eki_shokika_ikebukuro; eki_shokika_tokyo] = [eki_from_iidabashi_to_myogadani_1; eki_shokika_ikebukuro; eki_shokika_tokyo]
