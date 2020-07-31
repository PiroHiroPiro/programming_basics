(* 駅の情報を表す型 *)
type ekimei_t = {
  kanji: string; (* 漢字の駅名 *)
  kana: string; (* ひらがなの駅名 *)
  romaji: string; (* ローマ字の駅 *)
  shozoku: string; (* 路線名 *)
}

(* 目的：駅のデータを受け取り、駅情報を示す文字列を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei = match ekimei with {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku;} ->
  shozoku ^ "、" ^ kanji ^ "（" ^ kana ^ "）"

(* テスト *)
let ekimei1 = {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線";}
let ekimei2 = {kanji="新宿"; kana="しんじゅく"; romaji="shinjuku"; shozoku="山の手線";}
let ekimei3 = {kanji="東京"; kana="とうきょう"; romaji="tokyo"; shozoku="山の手線";}
let test1 = hyoji ekimei1 = "丸ノ内線、茗荷谷（みょうがだに）"
let test2 = hyoji ekimei2 = "山の手線、新宿（しんじゅく）"
let test3 = hyoji ekimei3 = "山の手線、東京（とうきょう）"


(* 駅と駅の接続情報を表す型 *)
type ekimei_t = {
  kiten: string; (* 起点の駅名 *)
  shuten: string; (* 終点の駅名 *)
  keiyu: string; (* 経由する路線名 *)
  kyori: float; (* 距離（km） *)
  jikan: int; (* 所要時間（分） *)
}
