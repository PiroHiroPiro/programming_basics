let square x = x * x ;;
square 3. ;;
(* This expression has type float but is here used with type int *)

let circle = 2. *. pi *. r ;;
circle 2. ;;
(* Unbound value pi *)

let TV bangumi youbi = bangumi ^ "は" ^ youbi ^ "に放映です。" ;;
TV "ポケモン" "木曜日"
(* Syntax error *)
