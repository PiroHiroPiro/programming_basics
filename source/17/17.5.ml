(* 木を表す型 *)
type tree_t = Empty                         (* 空の木 *)
            | Leaf of int                   (* 葉 *)
            | Node of tree_t * int * tree_t (* 節 *)

(* tree は
  - Empty            空の木、あるいは
  - Leaf (n)         値が n の葉、あるいは
  - Node (t1, n, t2) 左の木が t1、値が n、右の木が t2 であるような節（t1 と t2 が自己参照のケース）
  という形 *)

(* tree_t の例 *)
let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (tree1, 4, tree2)
let tree4 = Node (tree2, 5, tree3)

(* 目的：tree に含まれる整数を二倍にした木を返す *)
(* tree_double : tree_t -> tree_t *)
let rec tree_double tree = match tree with
    Empty -> Empty
  | Leaf (n) -> Leaf (n * 2)
  | Node (t1, n, t2) -> Node (tree_double t1, n * 2, tree_double t2)

(* tree_double *)
let test1 = tree_double tree1 = tree1
let test2 = tree_double tree2 = Leaf (6)
let test3 = tree_double tree3 = Node (tree1, 8, Leaf (6))
let test4 = tree_double tree4 = Node (Leaf (6), 10, Node (tree1, 8, Leaf (6)))
