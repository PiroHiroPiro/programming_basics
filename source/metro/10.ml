#use "metro/8.ml"

(* 目的：ローマ字の駅名と駅名リストを受け取り、漢字表記の駅名を返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji romaji_ekimei ekimei_list = match ekimei_list with
    [] -> ""
  | {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku} :: rest ->
    if romaji_ekimei = romaji
      then kanji
      else romaji_to_kanji romaji_ekimei rest

(* テスト：romaji_to_kanji *)
let test_10_1 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"

(* 目的：二つの駅名と駅間リストを受け取り、距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori eki1 eki2 ekikan_list = match ekikan_list with
    [] -> infinity
  | {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=jikan} :: rest ->
    if (kiten = eki1 && shuten = eki2) || (kiten = eki2 && shuten = eki1)
      then kyori
      else get_ekikan_kyori eki1 eki2 rest

(* テスト：get_ekikan_kyori *)
let test_10_2 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2

(* メッセージの形式にフォーマットする *)
let eki_does_not_exist_msg   ekimei             = ekimei ^ "という駅は存在しません"
let eki_does_not_connect_msg kiten shuten       = kiten ^ "駅と" ^ shuten ^ "駅はつながっていません"
let ekikan_msg               kiten shuten kyori = kiten ^ "駅から" ^ shuten ^ "駅までは" ^ string_of_float kyori ^ "kmです"

(* 目的：ローマ字の駅名二つを受け取り、駅間の距離を表す文字列を返す *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji romaji_ekimei1 romaji_ekimei2 =
  let kanji_ekimei1 = romaji_to_kanji romaji_ekimei1 global_ekimei_list in
  let kanji_ekimei2 = romaji_to_kanji romaji_ekimei2 global_ekimei_list in
  if kanji_ekimei1 = ""
    then eki_does_not_exist_msg romaji_ekimei1
    else if kanji_ekimei2 = ""
      then eki_does_not_exist_msg romaji_ekimei2
      else let ekikan_kyori = get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 global_ekikan_list in
        if ekikan_kyori = infinity
          then eki_does_not_connect_msg kanji_ekimei1 kanji_ekimei2
          else ekikan_msg kanji_ekimei1 kanji_ekimei2 ekikan_kyori

(* テスト：kyori_wo_hyoji *)
let test_10_3 = kyori_wo_hyoji "myogadani" "shinotsuka"   = "茗荷谷駅から新大塚駅までは1.2kmです"
let test_10_4 = kyori_wo_hyoji "myogadani" "tameikesanno" = "茗荷谷駅と溜池山王駅はつながっていません"
let test_10_5 = kyori_wo_hyoji "myogadani" "nagaokakyo"   = "nagaokakyoという駅は存在しません"
