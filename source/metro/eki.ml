(* 駅までの最短距離を記録する型 *)
type eki_t = {
  namae       : string;      (* 漢字の駅名 *)
  saitan_kyori: float;       (* 最短距離 [km] *)
  temae_list  : string list; (* 経路 *)
}

(* eki_t 型のデータ例 *)
let eki_shokika_myogadani = {namae="茗荷谷"; saitan_kyori=infinity; temae_list=[]}
let eki_shokika_ikebukuro = {namae="池袋";   saitan_kyori=infinity; temae_list=[]}
let eki_shokika_tokyo     = {namae="東京";   saitan_kyori=infinity; temae_list=[]}

let eki_from_iidabashi_to_myogadani_1 = {namae="茗荷谷"; saitan_kyori=3.2; temae_list=["茗荷谷"; "後楽園"; "飯田橋"]}
let eki_from_iidabashi_to_myogadani_2 = {namae="茗荷谷"; saitan_kyori=9.;  temae_list=["茗荷谷"; "新大塚"; "池袋"; "東池袋"; "護国寺"; "江戸川橋"; "飯田橋"]}
let eki_from_tokyo_to_otemachi        = {namae="大手町"; saitan_kyori=0.6; temae_list=["大手町"; "東京"]}
let eki_from_iidabashi_to_shinotsuka  = {namae="新大塚"; saitan_kyori=7.8; temae_list=["新大塚"; "池袋"; "東池袋"; "護国寺"; "江戸川橋"; "飯田橋"]}
let eki_from_iidabashi_to_korakuen    = {namae="後楽園"; saitan_kyori=1.4; temae_list=["後楽園"; "飯田橋"]}
