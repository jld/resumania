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

let esc = Rutil.escape ['<',"&lt;";
			'>',"&gt;";
			'&',"&amp;"]

let catmap fn li = String.concat "" (List.map fn li)

let preamble = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n\
    <HTML><HEAD><title></title>\n\
    <meta http-equiv='content-type' content='text/html; charset=utf-8'>\n\
    <style type='text/css'><!--\n\
    .head { text-align: center; margin: 0; font-weight: normal }\n\
    BODY { font-family: 'Lucida Grande', sans-serif }\n\
    H1 { font-size: 2.5em } H2 { font-size: 2em } H3 { font-size: 1.7em }\n\
    H4 { font-size: 1.4em } H5 { font-size: 1.2em } H6 { font-size: 1.0em }\n\
    .s1 { margin: .78em 0 0 } .s2 { margin: .55em 0 0 } .s3 { margin: .33em 0 0 }\n\
    UL { margin-top: .3333em; margin-bottom: 0 } \
    LI { margin-top: .1667em; margin-bottom: 0 } \
    P { margin: .1667em 0 0 }\n\
    sub.tex { font-size: 1em; margin-left: -.1667em; \
              margin-right: -.125em; vertical-align: -.5ex }\n\
    sup.tex { font-size: .8em; margin-left: -.36em; \
              margin-right: -.15em; vertical-align: .25em }\n\
    --></style>\n\
    </HEAD>\n<BODY>\n" (* unconfuse emacs: '"' *)
and postamble = "</BODY>\n</HTML>\n"

let entag tag ?(attr) payload = 
  Printf.sprintf "<%s%s>%s</%s>" tag 
    (match attr with Some s -> " "^s | None -> "" )
    payload tag

let rec trans_il = function
    Rm(s) -> esc s
  | Bf(s) -> entag "B" (esc s)
  | It(s) -> entag "I" (esc s)
  | Tt(s) -> entag "TT" (esc s)
  | Sc(s) -> s  (* This could be emulated with <SMALL> *)
  | Spec("TeX") -> "T<sub class='tex'>E</sub>X"
  | Spec("LaTeX") -> "L<sup class='tex'>A</sup>"^(trans_il (Spec"TeX"))
  | Spec(s) -> (esc s)
	
let trans_ils = catmap trans_il

let rec trans_blki = function 
    Par(il) -> entag "P" (trans_ils il)
  | Section(il) -> entag "H3" ~attr:"class='s1'" ((trans_ils il))
  | Subsect(il) -> entag "H5" ~attr:"class='s2'" (trans_ils il)
  | Subsubs(il) -> entag "H6" ~attr:"class='s3'" (trans_ils il)
  | Title(n,il) -> 
      let hno = if n<0 then 6 else if n>5 then 1 else 6-n
      in Printf.sprintf "<H%d align='center' class='head'>%s</H%d>"
	hno (trans_ils il) hno
  | Itemize(bll) -> entag ~attr:"compact" "UL" 
	(catmap (function bl -> entag "LI" (trans_bls bl)) bll)
  | Vskip(ln) -> entag "div" ~attr:(Printf.sprintf "style='height:%gem'" ln) 
	(Rutil.strx "<br>" (int_of_float ln))
and trans_blk = function x -> (trans_blki x)^"\n"
and trans_bls = function x -> catmap trans_blk x (*sigh*)


let xlate bl = preamble^(trans_bls bl)^postamble

