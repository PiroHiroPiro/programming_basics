#use "metro/common.ml"

(* 目的：駅のデータを受け取り、駅情報を示す文字列を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei = match ekimei with {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku} ->
  shozoku ^ "、" ^ kanji ^ "（" ^ kana ^ "）"

(* テスト：hyoji *)
let test_8_1 = hyoji ekimei_myogadani  = "丸ノ内線、茗荷谷（みょうがだに）"
let test_8_2 = hyoji ekimei_ikebukuro2 = "有楽町線、池袋（いけぶくろ）"
let test_8_3 = hyoji ekimei_tokyo      = "山の手線、東京（とうきょう）"
