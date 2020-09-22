(* 年号を表す型 *)
type nengou_t = Meiji of int  (* 明治 *)
              | Taisho of int (* 大正 *)
              | Showa of int  (* 昭和 *)
              | Heisei of int (* 平成 *)

(* 目的：年号を受け取ったら対応する西暦年を返す *)
(* to_seireki : nengou_t -> int *)
let to_seireki nengou = match nengou with
    Meiji  (n) -> n + 1867
  | Taisho (n) -> n + 1911
  | Showa  (n) -> n + 1925
  | Heisei (n) -> n + 1988

(* 目的：年号を受け取り、年齢を返す *)
(* nenrei : nengou_t -> int *)
let nenrei nengou = let seireki = to_seireki nengou in 2020 - seireki

(* テスト：nenrei *)
let test1 = nenrei (Heisei 7) = 25
