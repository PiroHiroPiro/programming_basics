(* 駅名の情報を表す型 *)
type ekimei_t = {
  kanji: string; (* 漢字の駅名 *)
  kana: string; (* ひらがなの駅名 *)
  romaji: string; (* ローマ字の駅 *)
  shozoku: string; (* 路線名 *)
}

(* ekimei_t 型のデータ例 *)
let ekimei_myogadani = {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線";}
let ekimei_ikebukuro = {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線";}
let ekimei_tokyo = {kanji="東京"; kana="とうきょう"; romaji="tokyo"; shozoku="山の手線";}
let ekimei_ikebukuro2 = {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="有楽町線";}

(* 目的：ekimei_t 型のデータを受け取り、駅名を示す文字列を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei = match ekimei with {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku;} ->
  shozoku ^ "、" ^ kanji ^ "（" ^ kana ^ "）"

(* テスト *)
let test1 = hyoji ekimei_myogadani = "丸ノ内線、茗荷谷（みょうがだに）"
let test2 = hyoji ekimei_ikebukuro = "丸ノ内線、池袋（いけぶくろ）"
let test3 = hyoji ekimei_tokyo = "山の手線、東京（とうきょう）"

(* 駅と駅の接続情報を表す型 *)
type ekikan_t = {
  kiten: string; (* 起点の駅名 *)
  shuten: string; (* 終点の駅名 *)
  keiyu: string; (* 経由する路線名 *)
  kyori: float; (* 距離 [km] *)
  jikan: int; (* 所要時間 [分] *)
}

(* メトロネットワークの中のすべての駅名のリスト *)
let global_ekimei_list = [
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"};
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"};
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"};
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"};
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"};
    {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"};
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"};
    {kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shin-ochanomizu"; shozoku="千代田線"};
    {kanji="湯島"; kana="ゆしま"; romaji="yushima"; shozoku="千代田線"};
    {kanji="根津"; kana="ねづ"; romaji="nedu"; shozoku="千代田線"};
    {kanji="千駄木"; kana="せんだぎ"; romaji="sendagi"; shozoku="千代田線"};
    {kanji="西日暮里"; kana="にしにっぽり"; romaji="nishinippori"; shozoku="千代田線"};
    {kanji="町屋"; kana="まちや"; romaji="machiya"; shozoku="千代田線"};
    {kanji="北千住"; kana="きたせんじゅ"; romaji="kitasenjyu"; shozoku="千代田線"};
    {kanji="綾瀬"; kana="あやせ"; romaji="ayase"; shozoku="千代田線"};
    {kanji="北綾瀬"; kana="きたあやせ"; romaji="kitaayase"; shozoku="千代田線"};
    {kanji="浅草"; kana="あさくさ"; romaji="asakusa"; shozoku="銀座線"};
    {kanji="田原町"; kana="たわらまち"; romaji="tawaramachi"; shozoku="銀座線"};
    {kanji="稲荷町"; kana="いなりちょう"; romaji="inaricho"; shozoku="銀座線"};
    {kanji="上野"; kana="うえの"; romaji="ueno"; shozoku="銀座線"};
    {kanji="上野広小路"; kana="うえのひろこうじ"; romaji="uenohirokoji"; shozoku="銀座線"};
    {kanji="末広町"; kana="すえひろちょう"; romaji="suehirocho"; shozoku="銀座線"};
    {kanji="神田"; kana="かんだ"; romaji="kanda"; shozoku="銀座線"};
    {kanji="三越前"; kana="みつこしまえ"; romaji="mitsukoshimae"; shozoku="銀座線"};
    {kanji="日本橋"; kana="にほんばし"; romaji="nihonbashi"; shozoku="銀座線"};
    {kanji="京橋"; kana="きょうばし"; romaji="kyobashi"; shozoku="銀座線"};
    {kanji="銀座"; kana="ぎんざ"; romaji="ginza"; shozoku="銀座線"};
    {kanji="新橋"; kana="しんばし"; romaji="shinbashi"; shozoku="銀座線"};
    {kanji="虎ノ門"; kana="とらのもん"; romaji="toranomon"; shozoku="銀座線"};
    {kanji="溜池山王"; kana="ためいけさんのう"; romaji="tameikesannou"; shozoku="銀座線"};
    {kanji="赤坂見附"; kana="あかさかみつけ"; romaji="akasakamitsuke"; shozoku="銀座線"};
    {kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"};
    {kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"};
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"};
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"};
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"};
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"};
    {kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyama-itchome"; shozoku="半蔵門線"};
    {kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; shozoku="半蔵門線"};
    {kanji="半蔵門"; kana="はんぞうもん"; romaji="hanzomon"; shozoku="半蔵門線"};
    {kanji="九段下"; kana="くだんした"; romaji="kudanshita"; shozoku="半蔵門線"};
    {kanji="神保町"; kana="じんぼうちょう"; romaji="jinbocho"; shozoku="半蔵門線"};
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="半蔵門線"};
    {kanji="三越前"; kana="みつこしまえ"; romaji="mitsukoshimae"; shozoku="半蔵門線"};
    {kanji="水天宮前"; kana="すいてんぐうまえ"; romaji="suitengumae"; shozoku="半蔵門線"};
    {kanji="清澄白河"; kana="きよすみしらかわ"; romaji="kiyosumi-shirakawa"; shozoku="半蔵門線"};
    {kanji="住吉"; kana="すみよし"; romaji="sumiyoshi"; shozoku="半蔵門線"};
    {kanji="錦糸町"; kana="きんしちょう"; romaji="kinshicho"; shozoku="半蔵門線"};
    {kanji="押上"; kana="おしあげ"; romaji="oshiage"; shozoku="半蔵門線"};
    {kanji="中目黒"; kana="なかめぐろ"; romaji="nakameguro"; shozoku="日比谷線"};
    {kanji="恵比寿"; kana="えびす"; romaji="ebisu"; shozoku="日比谷線"};
    {kanji="広尾"; kana="ひろお"; romaji="hiro"; shozoku="日比谷線"};
    {kanji="六本木"; kana="ろっぽんぎ"; romaji="roppongi"; shozoku="日比谷線"};
    {kanji="神谷町"; kana="かみやちょう"; romaji="kamiyacho"; shozoku="日比谷線"};
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="日比谷線"};
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="日比谷線"};
    {kanji="銀座"; kana="ぎんざ"; romaji="ginza"; shozoku="日比谷線"};
    {kanji="東銀座"; kana="ひがしぎんざ"; romaji="higashiginza"; shozoku="日比谷線"};
    {kanji="築地"; kana="つきじ"; romaji="tsukiji"; shozoku="日比谷線"};
    {kanji="八丁堀"; kana="はっちょうぼり"; romaji="hacchobori"; shozoku="日比谷線"};
    {kanji="茅場町"; kana="かやばちょう"; romaji="kayabacho"; shozoku="日比谷線"};
    {kanji="人形町"; kana="にんぎょうちょう"; romaji="ningyomachi"; shozoku="日比谷線"};
    {kanji="小伝馬町"; kana="こでんまちょう"; romaji="kodemmacho"; shozoku="日比谷線"};
    {kanji="秋葉原"; kana="あきはばら"; romaji="akihabara"; shozoku="日比谷線"};
    {kanji="仲御徒町"; kana="なかおかちまち"; romaji="nakaokachimachi"; shozoku="日比谷線"};
    {kanji="上野"; kana="うえの"; romaji="ueno"; shozoku="日比谷線"};
    {kanji="入谷"; kana="いりや"; romaji="iriya"; shozoku="日比谷線"};
    {kanji="三ノ輪"; kana="みのわ"; romaji="minowa"; shozoku="日比谷線"};
    {kanji="南千住"; kana="みなみせんじゅ"; romaji="minamisenju"; shozoku="日比谷線"};
    {kanji="北千住"; kana="きたせんじゅ"; romaji="kitasenju"; shozoku="日比谷線"};
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"};
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"};
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"};
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"};
    {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"};
    {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"};
    {kanji="淡路町"; kana="あわじちょう"; romaji="awajicho"; shozoku="丸ノ内線"};
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="丸ノ内線"};
    {kanji="東京"; kana="とうきょう"; romaji="tokyo"; shozoku="丸ノ内線"};
    {kanji="銀座"; kana="ぎんざ"; romaji="ginza"; shozoku="丸ノ内線"};
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="丸ノ内線"};
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidomae"; shozoku="丸ノ内線"};
    {kanji="赤坂見附"; kana="あかさかみつけ"; romaji="akasakamitsuke"; shozoku="丸ノ内線"};
    {kanji="四ツ谷"; kana="よつや"; romaji="yotsuya"; shozoku="丸ノ内線"};
    {kanji="四谷三丁目"; kana="よつやさんちょうめ"; romaji="yotsuyasanchome"; shozoku="丸ノ内線"};
    {kanji="新宿御苑前"; kana="しんじゅくぎょえんまえ"; romaji="shinjuku-gyoemmae"; shozoku="丸ノ内線"};
    {kanji="新宿三丁目"; kana="しんじゅくさんちょうめ"; romaji="shinjuku-sanchome"; shozoku="丸ノ内線"};
    {kanji="新宿"; kana="しんじゅく"; romaji="shinjuku"; shozoku="丸ノ内線"};
    {kanji="西新宿"; kana="にししんじゅく"; romaji="nishi-shinjuku"; shozoku="丸ノ内線"};
    {kanji="中野坂上"; kana="なかのさかうえ"; romaji="nakano-sakaue"; shozoku="丸ノ内線"};
    {kanji="新中野"; kana="しんなかの"; romaji="shin-nakano"; shozoku="丸ノ内線"};
    {kanji="東高円寺"; kana="ひがしこうえんじ"; romaji="higashi-koenji"; shozoku="丸ノ内線"};
    {kanji="新高円寺"; kana="しんこうえんじ"; romaji="shin-koenji"; shozoku="丸ノ内線"};
    {kanji="南阿佐ヶ谷"; kana="みなみあさがや"; romaji="minami-asagaya"; shozoku="丸ノ内線"};
    {kanji="荻窪"; kana="おぎくぼ"; romaji="ogikubo"; shozoku="丸ノ内線"};
    {kanji="中野新橋"; kana="なかのしんばし"; romaji="nakano-shimbashi"; shozoku="丸ノ内線"};
    {kanji="中野富士見町"; kana="なかのふじみちょう"; romaji="nakano-fujimicho"; shozoku="丸ノ内線"};
    {kanji="方南町"; kana="ほうなんちょう"; romaji="honancho"; shozoku="丸ノ内線"};
    {kanji="四ツ谷"; kana="よつや"; romaji="yotsuya"; shozoku="南北線"};
    {kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; shozoku="南北線"};
    {kanji="溜池山王"; kana="ためいけさんのう"; romaji="tameikesanno"; shozoku="南北線"};
    {kanji="六本木一丁目"; kana="ろっぽんぎいっちょうめ"; romaji="roppongiitchome"; shozoku="南北線"};
    {kanji="麻布十番"; kana="あざぶじゅうばん"; romaji="azabujuban"; shozoku="南北線"};
    {kanji="白金高輪"; kana="しろかねたかなわ"; romaji="shirokanetakanawa"; shozoku="南北線"};
    {kanji="白金台"; kana="しろかねだい"; romaji="shirokanedai"; shozoku="南北線"};
    {kanji="目黒"; kana="めぐろ"; romaji="meguro"; shozoku="南北線"};
    {kanji="市ヶ谷"; kana="いちがや"; romaji="ichigaya"; shozoku="南北線"};
    {kanji="飯田橋"; kana="いいだばし"; romaji="idabashi"; shozoku="南北線"};
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="南北線"};
    {kanji="東大前"; kana="とうだいまえ"; romaji="todaimae"; shozoku="南北線"};
    {kanji="本駒込"; kana="ほんこまごめ"; romaji="honkomagome"; shozoku="南北線"};
    {kanji="駒込"; kana="こまごめ"; romaji="komagome"; shozoku="南北線"};
    {kanji="西ヶ原"; kana="にしがはら"; romaji="nishigahara"; shozoku="南北線"};
    {kanji="王子"; kana="おうじ"; romaji="oji"; shozoku="南北線"};
    {kanji="王子神谷"; kana="おうじかみや"; romaji="ojikamiya"; shozoku="南北線"};
    {kanji="志茂"; kana="しも"; romaji="shimo"; shozoku="南北線"};
    {kanji="赤羽岩淵"; kana="あかばねいわぶち"; romaji="akabaneiwabuchi"; shozoku="南北線"};
    {kanji="西船橋"; kana="にしふなばし"; romaji="nishi-funabashi"; shozoku="東西線"};
    {kanji="原木中山"; kana="ばらきなかやま"; romaji="baraki-nakayama"; shozoku="東西線"};
    {kanji="妙典"; kana="みょうでん"; romaji="myoden"; shozoku="東西線"};
    {kanji="行徳"; kana="ぎょうとく"; romaji="gyotoku"; shozoku="東西線"};
    {kanji="南行徳"; kana="みなみぎょうとく"; romaji="minami-gyotoku"; shozoku="東西線"};
    {kanji="浦安"; kana="うらやす"; romaji="urayasu"; shozoku="東西線"};
    {kanji="葛西"; kana="かさい"; romaji="kasai"; shozoku="東西線"};
    {kanji="西葛西"; kana="にしかさい"; romaji="nishi-kasai"; shozoku="東西線"};
    {kanji="南砂町"; kana="みなみすなまち"; romaji="minami-sunamachi"; shozoku="東西線"};
    {kanji="東陽町"; kana="とうようちょう"; romaji="touyoucho"; shozoku="東西線"};
    {kanji="木場"; kana="きば"; romaji="kiba"; shozoku="東西線"};
    {kanji="門前仲町"; kana="もんぜんなかちょう"; romaji="monzen-nakacho"; shozoku="東西線"};
    {kanji="茅場町"; kana="かやばちょう"; romaji="kayabacho"; shozoku="東西線"};
    {kanji="日本橋"; kana="にほんばし"; romaji="nihonbashi"; shozoku="東西線"};
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="東西線"};
    {kanji="竹橋"; kana="たけばし"; romaji="takebashi"; shozoku="東西線"};
    {kanji="九段下"; kana="くだんした"; romaji="kudanshita"; shozoku="東西線"};
    {kanji="飯田橋"; kana="いいだばし"; romaji="iidabashi"; shozoku="東西線"};
    {kanji="神楽坂"; kana="かぐらざか"; romaji="kagurazaka"; shozoku="東西線"};
    {kanji="早稲田"; kana="わせだ"; romaji="waseda"; shozoku="東西線"};
    {kanji="高田馬場"; kana="たかだのばば"; romaji="takadanobaba"; shozoku="東西線"};
    {kanji="落合"; kana="おちあい"; romaji="ochiai"; shozoku="東西線"};
    {kanji="中野"; kana="なかの"; romaji="nakano"; shozoku="東西線"};
    {romaji="shinkiba"; kana="しんきば"; kanji="新木場"; shozoku="有楽町線"};
    {romaji="tatsumi"; kana="たつみ"; kanji="辰巳"; shozoku="有楽町線"};
    {romaji="toyosu"; kana="とよす"; kanji="豊洲"; shozoku="有楽町線"};
    {romaji="tsukishima"; kana="つきしま"; kanji="月島"; shozoku="有楽町線"};
    {romaji="shintomityou"; kana="しんとみちょう"; kanji="新富町"; shozoku="有楽町線"};
    {romaji="ginzaittyoume"; kana="ぎんざいっちょうめ"; kanji="銀座一丁目"; shozoku="有楽町線"};
    {romaji="yuurakutyou"; kana="ゆうらくちょう"; kanji="有楽町"; shozoku="有楽町線"};
    {romaji="sakuradamon"; kana="さくらだもん"; kanji="桜田門"; shozoku="有楽町線"};
    {romaji="nagatacho"; kana="ながたちょう"; kanji="永田町"; shozoku="有楽町線"};
    {romaji="koujimachi"; kana="こうじまち"; kanji="麹町"; shozoku="有楽町線"};
    {romaji="ichigaya"; kana="いちがや"; kanji="市ヶ谷"; shozoku="有楽町線"};
    {romaji="iidabashi"; kana="いいだばし"; kanji="飯田橋"; shozoku="有楽町線"};
    {kanji="江戸川橋"; kana="えどがわばし"; romaji="edogawabasi"; shozoku="有楽町線"};
    {kanji="護国寺"; kana="ごこくじ"; romaji="gokokuji"; shozoku="有楽町線"};
    {kanji="東池袋"; kana="ひがしいけぶくろ"; romaji="higasiikebukuro"; shozoku="有楽町線"};
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="有楽町線"};
    {kanji="要町"; kana="かなめちょう"; romaji="kanametyou"; shozoku="有楽町線"};
    {kanji="千川"; kana="せんかわ"; romaji="senkawa"; shozoku="有楽町線"};
    {kanji="小竹向原"; kana="こたけむかいはら"; romaji="kotakemukaihara"; shozoku="有楽町線"};
    {kanji="氷川台"; kana="ひかわだい"; romaji="hikawadai"; shozoku="有楽町線"};
    {kanji="平和台"; kana="へいわだい"; romaji="heiwadai"; shozoku="有楽町線"};
    {kanji="営団赤塚"; kana="えいだんあかつか"; romaji="eidanakakuka"; shozoku="有楽町線"};
    {kanji="営団成増"; kana="えいだんなります"; romaji="eidannarimasu"; shozoku="有楽町線"};
    {kanji="和光市"; kana="わこうし"; romaji="wakousi"; shozoku="有楽町線"};
]

(* メトロネットワークの中のすべての駅間のリスト *)
let global_ekikan_list = [
    {kiten="代々木上原"; shuten="代々木公園"; keiyu="千代田線"; kyori=1.0; jikan=2};
    {kiten="代々木公園"; shuten="明治神宮前"; keiyu="千代田線"; kyori=1.2; jikan=2};
    {kiten="明治神宮前"; shuten="表参道"; keiyu="千代田線"; kyori=0.9; jikan=2};
    {kiten="表参道"; shuten="乃木坂"; keiyu="千代田線"; kyori=1.4; jikan=3};
    {kiten="乃木坂"; shuten="赤坂"; keiyu="千代田線"; kyori=1.1; jikan=2};
    {kiten="赤坂"; shuten="国会議事堂前"; keiyu="千代田線"; kyori=0.8; jikan=1};
    {kiten="国会議事堂前"; shuten="霞ヶ関"; keiyu="千代田線"; kyori=0.7; jikan=1};
    {kiten="霞ヶ関"; shuten="日比谷"; keiyu="千代田線"; kyori=1.2; jikan=2};
    {kiten="日比谷"; shuten="二重橋前"; keiyu="千代田線"; kyori=0.7; jikan=1};
    {kiten="二重橋前"; shuten="大手町"; keiyu="千代田線"; kyori=0.7; jikan=1};
    {kiten="大手町"; shuten="新御茶ノ水"; keiyu="千代田線"; kyori=1.3; jikan=2};
    {kiten="新御茶ノ水"; shuten="湯島"; keiyu="千代田線"; kyori=1.2; jikan=2};
    {kiten="湯島"; shuten="根津"; keiyu="千代田線"; kyori=1.2; jikan=2};
    {kiten="根津"; shuten="千駄木"; keiyu="千代田線"; kyori=1.0; jikan=2};
    {kiten="千駄木"; shuten="西日暮里"; keiyu="千代田線"; kyori=0.9; jikan=1};
    {kiten="西日暮里"; shuten="町屋"; keiyu="千代田線"; kyori=1.7; jikan=2};
    {kiten="町屋"; shuten="北千住"; keiyu="千代田線"; kyori=2.6; jikan=3};
    {kiten="北千住"; shuten="綾瀬"; keiyu="千代田線"; kyori=2.5; jikan=3};
    {kiten="綾瀬"; shuten="北綾瀬"; keiyu="千代田線"; kyori=2.1; jikan=4};
    {kiten="浅草"; shuten="田原町"; keiyu="銀座線"; kyori=0.8; jikan=2};
    {kiten="田原町"; shuten="稲荷町"; keiyu="銀座線"; kyori=0.7; jikan=1};
    {kiten="稲荷町"; shuten="上野"; keiyu="銀座線"; kyori=0.7; jikan=2};
    {kiten="上野"; shuten="上野広小路"; keiyu="銀座線"; kyori=0.5; jikan=2};
    {kiten="上野広小路"; shuten="末広町"; keiyu="銀座線"; kyori=0.6; jikan=1};
    {kiten="末広町"; shuten="神田"; keiyu="銀座線"; kyori=1.1; jikan=2};
    {kiten="神田"; shuten="三越前"; keiyu="銀座線"; kyori=0.7; jikan=1};
    {kiten="三越前"; shuten="日本橋"; keiyu="銀座線"; kyori=0.6; jikan=2};
    {kiten="日本橋"; shuten="京橋"; keiyu="銀座線"; kyori=0.7; jikan=2};
    {kiten="京橋"; shuten="銀座"; keiyu="銀座線"; kyori=0.7; jikan=1};
    {kiten="銀座"; shuten="新橋"; keiyu="銀座線"; kyori=0.9; jikan=2};
    {kiten="新橋"; shuten="虎ノ門"; keiyu="銀座線"; kyori=0.8; jikan=2};
    {kiten="虎ノ門"; shuten="溜池山王"; keiyu="銀座線"; kyori=0.6; jikan=2};
    {kiten="溜池山王"; shuten="赤坂見附"; keiyu="銀座線"; kyori=0.9; jikan=2};
    {kiten="赤坂見附"; shuten="青山一丁目"; keiyu="銀座線"; kyori=1.3; jikan=2};
    {kiten="青山一丁目"; shuten="外苑前"; keiyu="銀座線"; kyori=0.7; jikan=2};
    {kiten="外苑前"; shuten="表参道"; keiyu="銀座線"; kyori=0.7; jikan=1};
    {kiten="表参道"; shuten="渋谷"; keiyu="銀座線"; kyori=1.3; jikan=1};
    {kiten="渋谷"; shuten="表参道"; keiyu="半蔵門線"; kyori=1.3; jikan=2};
    {kiten="表参道"; shuten="青山一丁目"; keiyu="半蔵門線"; kyori=1.4; jikan=2};
    {kiten="青山一丁目"; shuten="永田町"; keiyu="半蔵門線"; kyori=1.3; jikan=2};
    {kiten="永田町"; shuten="半蔵門"; keiyu="半蔵門線"; kyori=1.0; jikan=2};
    {kiten="半蔵門"; shuten="九段下"; keiyu="半蔵門線"; kyori=1.6; jikan=2};
    {kiten="九段下"; shuten="神保町"; keiyu="半蔵門線"; kyori=0.4; jikan=1};
    {kiten="神保町"; shuten="大手町"; keiyu="半蔵門線"; kyori=1.7; jikan=3};
    {kiten="大手町"; shuten="三越前"; keiyu="半蔵門線"; kyori=0.7; jikan=1};
    {kiten="三越前"; shuten="水天宮前"; keiyu="半蔵門線"; kyori=1.3; jikan=2};
    {kiten="水天宮前"; shuten="清澄白河"; keiyu="半蔵門線"; kyori=1.7; jikan=3};
    {kiten="清澄白河"; shuten="住吉"; keiyu="半蔵門線"; kyori=1.9; jikan=3};
    {kiten="住吉"; shuten="錦糸町"; keiyu="半蔵門線"; kyori=1.; jikan=2};
    {kiten="錦糸町"; shuten="押上"; keiyu="半蔵門線"; kyori=1.4; jikan=2};
    {kiten="中目黒"; shuten="恵比寿"; keiyu="日比谷線"; kyori=1.; jikan=2};
    {kiten="恵比寿"; shuten="広尾"; keiyu="日比谷線"; kyori=1.5; jikan=3};
    {kiten="広尾"; shuten="六本木"; keiyu="日比谷線"; kyori=1.7; jikan=3};
    {kiten="六本木"; shuten="神谷町"; keiyu="日比谷線"; kyori=1.5; jikan=3};
    {kiten="神谷町"; shuten="霞ヶ関"; keiyu="日比谷線"; kyori=1.3; jikan=2};
    {kiten="霞ヶ関"; shuten="日比谷"; keiyu="日比谷線"; kyori=1.2; jikan=2};
    {kiten="日比谷"; shuten="銀座"; keiyu="日比谷線"; kyori=0.4; jikan=1};
    {kiten="銀座"; shuten="東銀座"; keiyu="日比谷線"; kyori=0.4; jikan=1};
    {kiten="東銀座"; shuten="築地"; keiyu="日比谷線"; kyori=0.6; jikan=2};
    {kiten="築地"; shuten="八丁堀"; keiyu="日比谷線"; kyori=1.; jikan=2};
    {kiten="八丁堀"; shuten="茅場町"; keiyu="日比谷線"; kyori=0.5; jikan=1};
    {kiten="茅場町"; shuten="人形町"; keiyu="日比谷線"; kyori=0.9; jikan=2};
    {kiten="人形町"; shuten="小伝馬町"; keiyu="日比谷線"; kyori=0.6; jikan=1};
    {kiten="小伝馬町"; shuten="秋葉原"; keiyu="日比谷線"; kyori=0.9; jikan=2};
    {kiten="秋葉原"; shuten="仲御徒町"; keiyu="日比谷線"; kyori=1.; jikan=1};
    {kiten="仲御徒町"; shuten="上野"; keiyu="日比谷線"; kyori=0.5; jikan=1};
    {kiten="上野"; shuten="入谷"; keiyu="日比谷線"; kyori=1.2; jikan=2};
    {kiten="入谷"; shuten="三ノ輪"; keiyu="日比谷線"; kyori=1.2; jikan=2};
    {kiten="三ノ輪"; shuten="南千住"; keiyu="日比谷線"; kyori=0.8; jikan=2};
    {kiten="南千住"; shuten="北千住"; keiyu="日比谷線"; kyori=1.8; jikan=3};
    {kiten="池袋"; shuten="新大塚"; keiyu="丸ノ内線"; kyori=1.8; jikan=3};
    {kiten="新大塚"; shuten="茗荷谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2};
    {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2};
    {kiten="後楽園"; shuten="本郷三丁目"; keiyu="丸ノ内線"; kyori=0.8; jikan=1};
    {kiten="本郷三丁目"; shuten="御茶ノ水"; keiyu="丸ノ内線"; kyori=0.8; jikan=1};
    {kiten="御茶ノ水"; shuten="淡路町"; keiyu="丸ノ内線"; kyori=0.8; jikan=1};
    {kiten="淡路町"; shuten="大手町"; keiyu="丸ノ内線"; kyori=0.9; jikan=2};
    {kiten="大手町"; shuten="東京"; keiyu="丸ノ内線"; kyori=0.6; jikan=1};
    {kiten="東京"; shuten="銀座"; keiyu="丸ノ内線"; kyori=1.1; jikan=2};
    {kiten="銀座"; shuten="霞ヶ関"; keiyu="丸ノ内線"; kyori=1.0; jikan=2};
    {kiten="霞ヶ関"; shuten="国会議事堂前"; keiyu="丸ノ内線"; kyori=0.7; jikan=1};
    {kiten="国会議事堂前"; shuten="赤坂見附"; keiyu="丸ノ内線"; kyori=0.9; jikan=2};
    {kiten="赤坂見附"; shuten="四ツ谷"; keiyu="丸ノ内線"; kyori=1.3; jikan=2};
    {kiten="四ツ谷"; shuten="四谷三丁目"; keiyu="丸ノ内線"; kyori=1.0; jikan=2};
    {kiten="四谷三丁目"; shuten="新宿御苑前"; keiyu="丸ノ内線"; kyori=0.9; jikan=1};
    {kiten="新宿御苑前"; shuten="新宿三丁目"; keiyu="丸ノ内線"; kyori=0.7; jikan=1};
    {kiten="新宿三丁目"; shuten="新宿"; keiyu="丸ノ内線"; kyori=0.3; jikan=1};
    {kiten="新宿"; shuten="西新宿"; keiyu="丸ノ内線"; kyori=0.8; jikan=1};
    {kiten="西新宿"; shuten="中野坂上"; keiyu="丸ノ内線"; kyori=1.1; jikan=2};
    {kiten="中野坂上"; shuten="新中野"; keiyu="丸ノ内線"; kyori=1.1; jikan=2};
    {kiten="新中野"; shuten="東高円寺"; keiyu="丸ノ内線"; kyori=1.0; jikan=1};
    {kiten="東高円寺"; shuten="新高円寺"; keiyu="丸ノ内線"; kyori=0.9; jikan=1};
    {kiten="新高円寺"; shuten="南阿佐ヶ谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2};
    {kiten="南阿佐ヶ谷"; shuten="荻窪"; keiyu="丸ノ内線"; kyori=1.5; jikan=2};
    {kiten="中野坂上"; shuten="中野新橋"; keiyu="丸ノ内線"; kyori=1.3; jikan=2};
    {kiten="中野新橋"; shuten="中野富士見町"; keiyu="丸ノ内線"; kyori=0.6; jikan=1};
    {kiten="中野富士見町"; shuten="方南町"; keiyu="丸ノ内線"; kyori=1.3; jikan=2};
    {kiten="市ヶ谷"; shuten="四ツ谷"; keiyu="南北線"; kyori=1.0; jikan=2};
    {kiten="四ツ谷"; shuten="永田町"; keiyu="南北線"; kyori=1.3; jikan=3};
    {kiten="永田町"; shuten="溜池山王"; keiyu="南北線"; kyori=0.9; jikan=1};
    {kiten="溜池山王"; shuten="六本木一丁目"; keiyu="南北線"; kyori=0.9; jikan=2};
    {kiten="六本木一丁目"; shuten="麻布十番"; keiyu="南北線"; kyori=1.2; jikan=2};
    {kiten="麻布十番"; shuten="白金高輪"; keiyu="南北線"; kyori=1.3; jikan=2};
    {kiten="白金高輪"; shuten="白金台"; keiyu="南北線"; kyori=1.0; jikan=2};
    {kiten="白金台"; shuten="目黒"; keiyu="南北線"; kyori=1.3; jikan=2};
    {kiten="市ヶ谷"; shuten="飯田橋"; keiyu="南北線"; kyori=1.1 ; jikan=2};
    {kiten="飯田橋"; shuten="後楽園"; keiyu="南北線"; kyori=1.4 ; jikan=2};
    {kiten="後楽園"; shuten="東大前"; keiyu="南北線"; kyori=1.3 ; jikan=3};
    {kiten="東大前"; shuten="本駒込"; keiyu="南北線"; kyori=0.9 ; jikan=2};
    {kiten="本駒込"; shuten="駒込"; keiyu="南北線"; kyori=1.4; jikan=2};
    {kiten="駒込"; shuten="西ヶ原"; keiyu="南北線"; kyori=1.4; jikan=2};
    {kiten="西ヶ原"; shuten="王子"; keiyu="南北線"; kyori=1.0; jikan=2};
    {kiten="王子"; shuten="王子神谷"; keiyu="南北線"; kyori=1.2; jikan=2};
    {kiten="王子神谷"; shuten="志茂"; keiyu="南北線"; kyori=1.6; jikan=3};
    {kiten="志茂"; shuten="赤羽岩淵"; keiyu="南北線"; kyori=1.1; jikan=2};
    {kiten="西船橋" ; shuten="原木中山"; keiyu="東西線"; kyori=1.9; jikan=3};
    {kiten="原木中山"; shuten="妙典"; keiyu="東西線"; kyori=2.1 ; jikan=2};
    {kiten="妙典"; shuten="行徳"; keiyu="東西線"; kyori=1.3 ; jikan=2};
    {kiten="行徳"; shuten="南行徳"; keiyu="東西線"; kyori=1.5 ; jikan=2};
    {kiten="南行徳"; shuten="浦安" ; keiyu="東西線"; kyori=1.2 ; jikan=2};
    {kiten="浦安" ; shuten="葛西"; keiyu="東西線"; kyori=1.9 ; jikan=2};
    {kiten="葛西"; shuten="西葛西"; keiyu="東西線"; kyori=1.2 ; jikan=2};
    {kiten="西葛西"; shuten="南砂町"; keiyu="東西線"; kyori=2.7 ; jikan=2};
    {kiten="南砂町"; shuten="東陽町"; keiyu="東西線"; kyori=1.2 ; jikan=2};
    {kiten="東陽町"; shuten="木場" ; keiyu="東西線"; kyori=0.9 ; jikan=1};
    {kiten="木場"; shuten="門前仲町"; keiyu="東西線"; kyori=1.1 ; jikan=1};
    {kiten="門前仲町"; shuten="茅場町"; keiyu="東西線"; kyori=1.8 ; jikan=2};
    {kiten="茅場町"; shuten="日本橋"; keiyu="東西線"; kyori=0.5 ; jikan=1};
    {kiten="日本橋"; shuten="大手町"; keiyu="東西線"; kyori=0.8 ; jikan=1};
    {kiten="大手町"; shuten="竹橋"; keiyu="東西線"; kyori=1.0; jikan=2};
    {kiten="竹橋"; shuten="九段下"; keiyu="東西線"; kyori=1.0; jikan=1};
    {kiten="九段下"; shuten="飯田橋"; keiyu="東西線"; kyori=0.7; jikan=1};
    {kiten="飯田橋"; shuten="神楽坂"; keiyu="東西線"; kyori=1.2; jikan=2};
    {kiten="神楽坂"; shuten="早稲田"; keiyu="東西線"; kyori=1.2; jikan=2};
    {kiten="早稲田"; shuten="高田馬場"; keiyu="東西線"; kyori=1.7; jikan=3};
    {kiten="高田馬場"; shuten="落合"; keiyu="東西線"; kyori=1.9; jikan=3};
    {kiten="落合"; shuten="中野"; keiyu="東西線"; kyori=2.0; jikan=3};
    {kiten="新木場"; shuten="辰巳"; keiyu="有楽町線"; kyori=1.5; jikan=2};
    {kiten="辰巳"; shuten="豊洲"; keiyu="有楽町線"; kyori=1.7; jikan=2};
    {kiten="豊洲"; shuten="月島"; keiyu="有楽町線"; kyori=1.4; jikan=2};
    {kiten="月島"; shuten="新富町"; keiyu="有楽町線"; kyori=1.3; jikan=2};
    {kiten="新富町"; shuten="銀座一丁目"; keiyu="有楽町線"; kyori=0.7; jikan=1};
    {kiten="銀座一丁目"; shuten="有楽町"; keiyu="有楽町線"; kyori=0.5; jikan=1};
    {kiten="有楽町"; shuten="桜田門"; keiyu="有楽町線"; kyori=1.0; jikan=1};
    {kiten="桜田門"; shuten="永田町"; keiyu="有楽町線"; kyori=0.9; jikan=2};
    {kiten="永田町"; shuten="麹町"; keiyu="有楽町線"; kyori=0.9; jikan=1};
    {kiten="麹町"; shuten="市ヶ谷"; keiyu="有楽町線"; kyori=0.9; jikan=1};
    {kiten="市ヶ谷"; shuten="飯田橋"; keiyu="有楽町線"; kyori=1.1; jikan=2};
    {kiten="飯田橋"; shuten="江戸川橋"; keiyu="有楽町線"; kyori=1.6; jikan=3};
    {kiten="江戸川橋"; shuten="護国寺"; keiyu="有楽町線"; kyori=1.3; jikan=2};
    {kiten="護国寺"; shuten="東池袋"; keiyu="有楽町線"; kyori=1.1; jikan=2};
    {kiten="東池袋"; shuten="池袋"; keiyu="有楽町線"; kyori=2.0; jikan=2};
    {kiten="池袋"; shuten="要町"; keiyu="有楽町線"; kyori=1.2; jikan=2};
    {kiten="要町"; shuten="千川"; keiyu="有楽町線"; kyori=1.0; jikan=1};
    {kiten="千川"; shuten="小竹向原"; keiyu="有楽町線"; kyori=1.0; jikan=2};
    {kiten="小竹向原"; shuten="氷川台"; keiyu="有楽町線"; kyori=1.5; jikan=2};
    {kiten="氷川台"; shuten="平和台"; keiyu="有楽町線"; kyori=1.4; jikan=2};
    {kiten="平和台"; shuten="営団赤塚"; keiyu="有楽町線"; kyori=1.8; jikan=2};
    {kiten="営団赤塚"; shuten="営団成増"; keiyu="有楽町線"; kyori=1.5; jikan=2};
    {kiten="営団成増"; shuten="和光市"; keiyu="有楽町線"; kyori=2.1; jikan=3};
]

(* 目的：ローマ字の駅名と ekimei_t 型のリストを受け取り、漢字表記の駅名を返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji romaji_ekimei ekimei_list = match ekimei_list with
    [] -> ""
  | {kanji=kanji; romaji=romaji} :: rest ->
    if romaji_ekimei = romaji then
      kanji
    else
      romaji_to_kanji romaji_ekimei rest

(* テスト *)
let test1 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"

(* 目的：二つの駅名と ekikan_t 型のリストを受け取り、距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori eki1 eki2 ekikan_list = match ekikan_list with
    [] -> infinity
  | {kiten=kiten; shuten=shuten; kyori=kyori} :: rest ->
    if (kiten = eki1 && shuten = eki2) || (kiten = eki2 && shuten = eki1) then
      kyori
    else
      get_ekikan_kyori eki1 eki2 rest

(* テスト *)
let test2 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2

(* メッセージの形式にフォーマットする *)
let eki_does_not_exist_msg ekimei = ekimei ^ "という駅は存在しません"
let eki_does_not_connect_msg kiten shuten = kiten ^ "駅と" ^ shuten ^ "駅はつながっていません"
let ekikan_msg kiten shuten kyori = kiten ^ "駅から" ^ shuten ^ "駅までは" ^ string_of_float kyori ^ "kmです"

(* 目的：ローマ字の駅名二つを受け取り、駅間の距離を表す文字列を返す *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji romaji_ekimei1 romaji_ekimei2 =
  let kanji_ekimei1 = romaji_to_kanji romaji_ekimei1 global_ekimei_list in
  let kanji_ekimei2 = romaji_to_kanji romaji_ekimei2 global_ekimei_list in
  if kanji_ekimei1 = "" then
    eki_does_not_exist_msg romaji_ekimei1
  else
    if kanji_ekimei2 = "" then
      eki_does_not_exist_msg romaji_ekimei2
    else
      let ekikan_kyori = get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 global_ekikan_list in
      if ekikan_kyori = infinity then
        eki_does_not_connect_msg kanji_ekimei1 kanji_ekimei2
      else
        ekikan_msg kanji_ekimei1 kanji_ekimei2 ekikan_kyori

(* テスト *)
let test3 = kyori_wo_hyoji "myogadani" "shinotsuka" = "茗荷谷駅から新大塚駅までは1.2kmです"
let test4 = kyori_wo_hyoji "myogadani" "tameikesanno" = "茗荷谷駅と溜池山王駅はつながっていません"
let test5 = kyori_wo_hyoji "myogadani" "nagaokakyo" = "nagaokakyoという駅は存在しません"

(* 駅までの最短距離を記録する型 *)
type eki_t = {
  namae: string;  (* 漢字 *)
  saitan_kyori: float;  (* [km] *)
  temae_list: string list;
}

(* eki_t 型のデータ例 *)
let eki_myogadani = {namae="茗荷谷"; saitan_kyori=infinity; temae_list=[]}
let eki_ikebukuro = {namae="池袋"; saitan_kyori=infinity; temae_list=[]}
let eki_tokyo = {namae="東京"; saitan_kyori=infinity; temae_list=[]}

(* 目的：ekimei_t 型のリストを受け取り、ダイクストラ法で用いる eki_t 型のリストを作成する *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list ekimei_list = match ekimei_list with
    [] -> []
  | {kanji=namae} :: rest -> {namae=namae; saitan_kyori=infinity; temae_list=[]} :: make_eki_list rest

(* テスト *)
let test6 = make_eki_list [ekimei_myogadani; ekimei_ikebukuro; ekimei_tokyo]
  = [
    {namae="茗荷谷"; saitan_kyori=infinity; temae_list=[]};
    {namae="池袋"; saitan_kyori=infinity; temae_list=[]};
    {namae="東京"; saitan_kyori=infinity; temae_list=[]}
  ]

(* 目的：eki_t 型のリストと駅名を受け取り、対称の駅のデータのみ初期化した eki_t 型のリストを返す *)
(* shokika : eki_t list -> string -> eki_t list *)
let rec shokika lst kanji_ekimei = match lst with
    [] -> []
  | ({namae=namae} as first) :: rest ->
    if namae = kanji_ekimei then
      {namae=namae; saitan_kyori=0.; temae_list=[namae]} :: shokika rest kanji_ekimei
    else
      first :: shokika rest kanji_ekimei

(* テスト *)
let test7 = shokika [eki_myogadani; eki_ikebukuro; eki_tokyo] "東京" = [eki_myogadani; eki_ikebukuro; {namae="東京"; saitan_kyori=0.; temae_list=["東京"]}]

(* 目的：駅名のひらがな順で整列した ekimei_t 型のリストと ekimei_t 型を受け取り、駅のひらがな名順に適切な位置の挿入した ekimei_t 型のリストを返す *)
(* ekimei_insert : ekimei_t list -> ekimei_t -> ekimei_t list *)
let rec ekimei_insert lst ekimei = match ekimei with {kana=kana} -> match lst with
    [] -> [ekimei]
  | ({kana=k} as first) :: rest ->
    if k > kana then
      ekimei :: lst
    else
      first :: ekimei_insert rest ekimei

(* 目的：ekimei_t 型のリストを受け取り、駅のひらがな名順で整列した ekimei_t 型のリストを返す *)
(* ekimei_sort : ekimei_t list -> ekimei_t list *)
let rec ekimei_sort lst = match lst with
    [] -> []
  | first :: rest -> ekimei_insert (ekimei_sort rest) first

(* 目的：ekimei_t 型のリストを受け取り、ひらがなの順に並び替え重複を削除した ekimei_t 型のリストを返す *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu ekimei_list = match ekimei_sort ekimei_list with
    [] -> []
  | first :: [] -> [first]
  | ({kana=first_k} as first) :: ({kana=second_k} as second) :: rest ->
    if first_k = second_k then
      first :: seiretsu rest
    else
      first :: seiretsu (second :: rest)

(* テスト *)
let test8 = seiretsu [ekimei_ikebukuro2; ekimei_tokyo; ekimei_myogadani; ekimei_ikebukuro] = [ekimei_ikebukuro; ekimei_tokyo; ekimei_myogadani]

(* 目的：直前に確定した駅と未確定の駅を受け取り、ある駅が直前に確定した点につながっているか確認し、繋がっていなければ何も変更せず、繋がっていれば最短距離を更新する *)
(* koushin1 : eki_t -> eki_t -> eki_t *)
let koushin1 kakutei_eki eki = match eki with {namae=namae; saitan_kyori=saitan_kyori; temae_list=temae_list} ->
  match kakutei_eki with {namae=kakutei_namae; saitan_kyori=kakutei_saitan_kyori; temae_list=kakutei_temae_list} ->
  let kyori = get_ekikan_kyori namae kakutei_namae global_ekikan_list in
  if kyori = infinity then
    eki
  else
    let candidate_saitan_kyori = kakutei_saitan_kyori +. kyori in
    if candidate_saitan_kyori > saitan_kyori then
      eki
    else
      {namae=namae; saitan_kyori=candidate_saitan_kyori; temae_list=kakutei_namae :: kakutei_temae_list}

(* テスト：koushin1 *)
let test9 = koushin1 eki_from_iidabashi_to_myogadani_1 eki_from_tokyo_to_otemachi = eki_from_iidabashi_to_myogadani_1
let test10 = koushin1 eki_from_iidabashi_to_myogadani_1 eki_from_iidabashi_to_shinotsuka = eki_from_iidabashi_to_myogadani_1
let test11 = koushin1 eki_from_iidabashi_to_myogadani_2 eki_from_iidabashi_to_korakuen = eki_from_iidabashi_to_myogadani_1
