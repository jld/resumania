(*
 * Copyright (c) 2003 Jed Davis <jld@panix.com>
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 *    1. Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 * 
 *    2. Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *)

open Rtype;;

let esc = Rutil.escape ['{',"\\{";
			'}',"\\}";
			'\\',"\\\\"] (* Is that all of them? *)
			  
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
    Rm(s) -> (esc s)
  | Bf(s) -> "{\\b "^(esc s)^"}"
  | It(s) -> "{\\i "^(esc s)^"}"
  | Sc(s) -> "{\\scaps "^(esc s)^"}"
  | Tt(s) -> "{\\f1 "^(esc s)^"}"
  | Spec("TeX") -> "{\\expnd-4 T}{\\sub E}X"
  | Spec("LaTeX") -> "{\\expnd-6 L}{\\fs20\\super A}"^(trans_il (Spec"TeX"))
  | Spec(s) -> (esc s)

let trans_ils = catmap trans_il

let vskip hp = Printf.sprintf "{\\fs%d\\par}" hp

let rec trans_blk lvl = function
    Par(il) -> (trans_ils il)^"\\par\n"
  | Section(il) -> "{"^(vskip 32)^(fscmd 3)^"\\b "^(trans_ils il)^"\\par}\n"
  | Subsect(il) -> "{"^(vskip 16)^(fscmd 1)^"\\b "^(trans_ils il)^"\\par}\n"
  | Subsubs(il) -> "{"^(vskip 8)^(fscmd 0)^"\\b "^(trans_ils il)^"\\par}\n"
  | Title(n, il) -> "{"^(fscmd n)^"\\qc "^(trans_ils il)^"\\par}\n"
  | Itemize(bll) -> (vskip 4)^(catmap (function bl ->
      (vskip 4)^match (List.map (trans_blk (lvl+1)) bl) with
	fst::lst -> Printf.sprintf "{\\li%d%s}\n" (lvl*itemgap)
	    (String.concat "" (("{\\fi-240{\\b\\'95}\t"^fst^"}")::lst))
      | _ -> "") bll)  (* TODO: test this with nesting and stuff *)
  | Vskip(ln) -> vskip (int_of_float(24.*.ln))
and trans_bls lvl x = catmap (trans_blk lvl) x (*sigh*)


let xlate bl = preamble^(trans_bls 1 bl)^postamble
