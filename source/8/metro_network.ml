(* 駅名の情報（漢字の駅名、ひらがなの駅名、ローマ字の駅名、路線名）を表す型 *)
type ekimei_t = {
  kanji_name: string ; (* 漢字の駅名 *)
  hiragana_name: string ; (* ひらがなの駅名 *)
  romaji_name: string ; (* ローマ字の駅 *)
  rosen_name: string ; (* 路線名 *)
}

(* 目的：駅名のデータを受け取り、「路線名、駅名（かな）」の形式の文字列を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei = match ekimei with
  {kanji_name=kanji_name ; hiragana_name=hiragana_name ; romaji_name=romaji_name ; rosen_name=rosen_name ;} ->
  rosen_name ^ "、" ^ kanji_name ^ "（" ^ hiragana_name ^ "）"

(* テスト *)
let ekimei1 = {kanji_name="茗荷谷" ; hiragana_name="みょうがだに" ; romaji_name="myogadani" ; rosen_name="丸ノ内線" ;}
let ekimei2 = {kanji_name="新宿" ; hiragana_name="しんじゅく" ; romaji_name="shinjuku" ; rosen_name="山の手線" ;}
let ekimei3 = {kanji_name="東京" ; hiragana_name="とうきょう" ; romaji_name="tokyo" ; rosen_name="山の手線" ;}
let test1 = hyoji ekimei1 = "丸ノ内線、茗荷谷（みょうがだに）"
let test2 = hyoji ekimei2 = "山の手線、新宿（しんじゅく）"
let test3 = hyoji ekimei3 = "山の手線、東京（とうきょう）"


(* 駅と駅の接続情報（漢字の駅名、ひらがなの駅名、ローマ字の駅名、路線名）を表す型 *)
type ekimei_t = {
  kiten: string ; (* 起点の駅名 *)
  shuten: string ; (* 終点の駅名 *)
  keiyu: string ; (* 経由する路線名 *)
  kyori: float ; (* 距離（km） *)
  jikan: int ; (* 所要時間（分） *)
}
