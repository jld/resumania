open Rtype;;

let esc = Rutil.escape ['.',"\\&.";
			'\\',"\\\\"]
    
let catmap fn li = String.concat "" (List.map fn li)

let preamble = ".na\n.nh\n"
and postamble = ".pl \\n(nlu\n"

let dotesc s = match s.[0] with '.' -> "\\&"^s | _ -> s

let rec trans_il = function
    Rm(s) -> ".ft R\n"^(esc s)^"\\c\n"
  | Bf(s) -> ".ft B\n"^(esc s)^"\\c\n"
  | It(s) -> ".ft I\n"^(esc s)^"\\c\n"
  | Sc(s) -> trans_il (Rm s)
  | Tt(s) -> trans_il (Rm s)
  | Spec(s) -> trans_il (Rm s)


let trans_ils = catmap trans_il

let embolden = List.map begin function 
    Rm(s) -> Bf(s) | Bf(s) -> Bf(s) | It(s) -> Bf(s) | x -> x end
let boldtrans ils = trans_ils (embolden ils)

let rec trans_blk = function
    Par(il) -> (trans_ils il)^".br\n"
  | Section(il) -> "\n.in 0\n"^(boldtrans il)^".br\n.in 1\n"
  | Subsect(il) -> ".in 1\n"^(boldtrans il)^".br\n.in 2\n"
  | Subsubs(il) -> ".in 2\n"^(boldtrans il)^".br\n.in 3\n"
  | Title(n,il) -> ".ad c\n"^(trans_ils il)^".br\n.na\n"
  | Itemize(bll) -> ".in +2\n"^(catmap begin function bl ->
      ".ti -2\n\\fR*\n"^(trans_bls bl) end bll)
and trans_bls = function x -> catmap trans_blk x (*sigh*)

let xlate bl = preamble^(trans_bls bl)^postamble
