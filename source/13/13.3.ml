(* 1 : 'a -> 'a *)
let function1 obj = obj

(* 2 : 'a -> 'b -> 'a *)
let function2 obj1 obj2 = obj1

(* 3 : 'a -> 'b -> 'b *)
let function3 obj1 obj2 = obj2

(* 4 : 'a -> ('a -> 'b) -> 'b *)
let function4 obj func = func obj

(* 5 : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c *)
let function5 func1 func2 obj = func2 (func1 obj)
