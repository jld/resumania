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
  | Vskip(ln) -> Rutil.strx "\n" (int_of_float ln)
and trans_bls = function x -> catmap trans_blk x (*sigh*)

let xlate bl = preamble^(trans_bls bl)^postamble
