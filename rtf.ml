open Rtype;;

let catmap fn li = String.concat "" (List.map fn li)

let fscmd ns =
  "\\fs"^(match ns with
    x when x <= -4 -> "12"
  | -3 -> "17"
  | -2 -> "19"
  | -1 -> "22"
  | 0 -> "24"
  | 1 -> "29"
  | 2 -> "34"
  | 3 -> "41"
  | 4 -> "48"
  | _ -> "60"
	 )

let tabstops = 
  let rec helper bg step rm = if rm>bg
   then ("\\tx"^(string_of_int bg))::(helper (bg+step) step rm) else []
in fun step rm -> String.concat "" (List.rev (helper 0 step rm))

let itemgap = 720

let preamble = "{\\rtf1\\ansi\
    {\\fonttbl\\f0\\fswiss Lucida Grande;\\f1\\fmodern Courier;}\\f0"
  ^(fscmd 0)^"\n"^(tabstops itemgap 9360)^"\n"
and postamble = "}\n"

let rec trans_il = function
    Rm(s) -> s
  | Bf(s) -> "{\\b "^s^"}"
  | It(s) -> "{\\i "^s^"}"
  | Sc(s) -> "{\\scaps "^s^"}"
  | Tt(s) -> "{\\f1 "^s^"}"
  | Spec("TeX") -> "{\\expnd-4 T}{\\fs18\\sub E}X"
  | Spec("LaTeX") -> "{\\expnd-6 L}{\\fs18\\super A}"^(trans_il (Spec"TeX"))
  | Spec(s) -> s

let trans_ils = catmap trans_il

let vskip hp = Printf.sprintf "{\\fs%d\\par}" hp

let rec trans_blk lvl = function
    Par(il) -> (trans_ils il)^"\\par\n"
  | Section(il) -> "{"^(vskip 32)^(fscmd 3)^"\\b "^(trans_ils il)^"\\par}\n"
  | Subsect(il) -> "{"^(vskip 16)^(fscmd 1)^"\\b "^(trans_ils il)^"\\par}\n"
  | Subsubs(il) -> "{"^(vskip 8)^(fscmd 0)^"\\b "^(trans_ils il)^"\\par}\n"
  | Title(n, il) -> "{"^(fscmd n)^"\\qc "^(trans_ils il)^"\\par}\n"
  | Itemize(bll) -> (catmap (function bl ->
      (vskip 4)^match (List.map (trans_blk (lvl+1)) bl) with
	fst::lst -> Printf.sprintf "{\\li%d%s}\n" (lvl*itemgap)
	    (String.concat "" (("{\\fi-240{\\b\149}\t"^fst^"}")::lst))
      | _ -> "") bll)  (* TODO: test this with nesting and stuff *)
and trans_bls lvl x = catmap (trans_blk lvl) x (*sigh*)


let xlate bl = preamble^(trans_bls 1 bl)^postamble
