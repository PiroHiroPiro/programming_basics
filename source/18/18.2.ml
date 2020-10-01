(* 八百屋においてある野菜と値段のリスト *)
let yaoya = [("トマト", 300); ("たまねぎ", 200); ("にんじん", 150); ("ほうれん草", 200)]

(* 目的：野菜の値段を返す。 *)
(* price : string -> (string * int) list -> int option *)
let rec price yasai_name yaoya_list = match yaoya_list with
    [] -> None
  | (yasai, nedan) :: rest ->
      if yasai = yasai_name then Some nedan
                            else price yasai_name rest

(* テスト：price *)
let test1 = price "にんじん" yaoya = Some 150
let test2 = price "じゃがいも" yaoya = None

(* 目的：野菜のリストと八百屋のリストを受け取ったら、野菜のリストのうち八百屋にはおいていない野菜の数を返す *)
(* count_urikire_yasai : string list -> (string * int) list -> int *)
let rec count_urikire_yasai yasai_list yaoya_list = match yasai_list with
    [] -> 0
  | first :: rest -> match price first yaoya_list with
      None -> 1 + count_urikire_yasai rest yaoya_list
    | Some (p) ->  count_urikire_yasai rest yaoya_list

(* テスト：count_urikire_yasai *)
let test3 = count_urikire_yasai ["にんじん"; "たまねぎ"] yaoya = 0
let test4 = count_urikire_yasai ["にんじん"; "じゃがいも"; "たまねぎ"; "かぼちゃ"] yaoya = 2
