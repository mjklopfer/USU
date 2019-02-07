let random=17;;
let pi=3.14159;;
let myFirstFun x=(x+3)*4;;
let circumference r=pi*.r*.2.0;;
let double n=
	let d=2*n in (n,d);;
let make_bigger x=if(x<0.0) then (x*.(-1.0)) else if (x<1.0) then (x+.0.5) else (x*.x);;
let rec append l1 l2= match l1 with | h :: t -> h :: append t l2 | [] -> l2;;
let rec sum l= match l with [] -> 0 | h::t->h+(sum t);;

