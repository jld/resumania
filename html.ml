open Rtype;;


let catmap fn li = String.concat "" (List.map fn li)

let preamble = "<HTML>\n<HEAD></HEAD>\n<BODY>\n"
and postamble = "</BODY>\n</HTML>\n"

let entag tag payload = 
  Printf.sprintf "<%s>%s</%s>" tag payload tag

let rec trans_il = function
    Rm(s) -> s
  | Bf(s) -> entag "B" s
  | It(s) -> entag "I" s
  | Tt(s) -> entag "TT" s
  | Sc(s) -> s  (* This could be emulated with <SMALL> *)
  | Spec("TeX") -> "T<sub><small>E</small></sub>X"
  | Spec("LaTeX") -> "L<sup><small>A</small></sup>"^(trans_il (Spec"TeX"))
  | Spec(s) -> s
	
let trans_ils = catmap trans_il

let rec trans_blki = function 
    Par(il) -> entag "P" (trans_ils il)
  | Section(il) -> entag "H2" ("<BR>"^(trans_ils il))
  | Subsect(il) -> entag "H3" (trans_ils il)
  | Subsubs(il) -> entag "H4" (trans_ils il)
  | Title(n,il) -> 
      let hno = if n<0 then 5 else if n>4 then 1 else 5-n
      in Printf.sprintf "<H%d align=\"center\">%s</H%d>"
	hno (trans_ils il) hno
  | Itemize(bll) -> entag "UL" 
	(catmap (function bl -> entag "LI" (trans_bls bl)) bll)
and trans_blk = function x -> (trans_blki x)^"\n"
and trans_bls = function x -> catmap trans_blk x (*sigh*)


let xlate bl = preamble^(trans_bls bl)^postamble

