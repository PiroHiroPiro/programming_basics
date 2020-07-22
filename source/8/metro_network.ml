(* 駅名の情報（漢字の駅名、ひらがなの駅名、ローマ字の駅名、路線名）を表す型 *)
type ekimei_t = {
  kanji_name: string ; (* 漢字の駅名 *)
  hiragana_name: string ; (* ひらがなの駅名 *)
  romaji_name: string ; (* ローマ字の駅 *)
  rosen_name: string ; (* 路線名 *)
}
