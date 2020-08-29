(* 目的：init から初めて lst の要素を左から順に f を施し込む *)
(* fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
let rec fold_left f init lst = match lst with
    [] -> init
  | first :: rest -> f (fold_left f init rest) first
