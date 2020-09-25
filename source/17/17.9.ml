(* 多相の木を表す型 *)
type 'a tree_t = Empty                              (* 空の木 *)
               | Leaf of 'a                         (* 葉 *)
               | Node of 'a tree_t * 'a * 'a tree_t (* 節 *)

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

(* 目的：tree に含まれる値を合計した木を返す *)
(* sum_tree : int tree_t -> int *)
let rec sum_tree tree = match tree with
    Empty -> 0
  | Leaf (n) -> n
  | Node (t1, n, t2) -> sum_tree t1 + n + sum_tree t2

(* テスト：sum_tree *)
let test1 = sum_tree tree1 = 0
let test2 = sum_tree tree2 = 3
let test3 = sum_tree tree3 = 7
let test4 = sum_tree tree4 = 15
