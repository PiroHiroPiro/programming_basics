#use "metro/ekimei.ml"
#use "metro/ekikan.ml"

(* メッセージの形式にフォーマットする *)
let eki_does_not_exist_msg ekimei = ekimei ^ "という駅は存在しません"
let eki_does_not_connect_msg kiten shuten = kiten ^ "駅と" ^ shuten ^ "駅はつながっていません"
let ekikan_msg kiten shuten kyori = kiten ^ "駅から" ^ shuten ^ "駅までは" ^ string_of_float kyori ^ "kmです"

(* 目的：ローマ字の駅名二つを受け取り、駅間の距離を表す文字列を返す *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji romaji_ekimei1 romaji_ekimei2 =
  let kanji_ekimei1 = romaji_to_kanji romaji_ekimei1 global_ekimei_list in
  let kanji_ekimei2 = romaji_to_kanji romaji_ekimei2 global_ekimei_list in
  if kanji_ekimei1 = "" then eki_does_not_exist_msg romaji_ekimei1
  else if kanji_ekimei2 = "" then eki_does_not_exist_msg romaji_ekimei2
  else let ekikan_kyori = get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 global_ekikan_list in
    if ekikan_kyori = infinity then eki_does_not_connect_msg kanji_ekimei1 kanji_ekimei2
    else ekikan_msg kanji_ekimei1 kanji_ekimei2 ekikan_kyori

(* テスト *)
let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" = "茗荷谷駅から新大塚駅までは1.2kmです"
let test2 = kyori_wo_hyoji "myogadani" "tameikesanno" = "茗荷谷駅と溜池山王駅はつながっていません"
let test3 = kyori_wo_hyoji "myogadani" "nagaokakyo" = "nagaokakyoという駅は存在しません"
