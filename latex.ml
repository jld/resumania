(*
 * Copyright (c) 2003,2012 Jed Davis <jld@panix.com>
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
			'&',"\\&";
			'%',"\\%";
			'#',"\\#";
			'$',"\\$";
			'<',"$<$";
			'>',"$>$";
			'_',"\\_";
			'^',"\\^{}";
			'\\',"$\\backslash$"]

let catmap fn li = String.concat "" (List.map fn li)

let preamble = "\\documentclass{article}\n\
    \\usepackage[margin=1in,nohead]{geometry}\n\
    \\setlength{\\parindent}{0pt}\n\
    \\pagestyle{empty}\n\
    \\raggedright\n\
    \\newcommand{\\centerize}{\\advance\\leftskip0pt plus 2fil }\n\
    \\newcommand{\\myitem}{\\vspace{-1.5ex}\\item}\n\
    \\newcommand{\\mysection}[1]{\\vspace{2ex plus 1ex minus .5ex}\
	  {\\Large\\bfseries\\makebox[0pt][r]{$\\cdot$ }#1\\par}}\n\
    \\newcommand{\\mysubsect}[1]{\\vspace{1ex plus .5ex minus .25ex}\
          {\\large\\bfseries{}#1\\par}}\n\
    \\newcommand{\\mysubsubs}[1]{\\vspace{.5ex plus .25ex minus .125ex}\
	  {\\normalsize\\bfseries#1\\par}}\n\n\
    \\begin{document}\
    \\sffamily\\let\\familydefault\\sfdefault\n"
and postamble = "\\end{document}\n"

let trans_il = function
    Rm(s) -> (esc s)
  | Bf(s) -> "{\\bfseries{}"^(esc s)^"}"
  | It(s) -> "{\\itshape{}"^(esc s)^"}"
  | Tt(s) -> "{\\ttfamily{}"^(esc s)^"}"
  | Sc(s) -> "{\\scshape{}"^(esc s)^"}"
  | Spec("TeX") -> "\\TeX{}"
  | Spec("LaTeX") -> "\\LaTeX{}"
  | Spec(s) -> (esc s)

let trans_ils = catmap trans_il

let rec ntosize = function
    -4 -> "tiny"
  | -3 -> "scriptsize"
  | -2 -> "footnotesize"
  | -1 -> "small"
  | 0 -> "normalsize"
  | 1 -> "large"
  | 2 -> "Large"
  | 3 -> "LARGE"
  | 4 -> "huge"
  | 5 -> "Huge"
  | x when x>5 -> ntosize 5
  | _ -> ntosize (-4)


let rec trans_blk = function
    Par(il) -> (trans_ils il)^"\\par\n"
  | Section(il) -> "\\mysection{"^(trans_ils il)^"}\n"
  | Subsect(il) -> "\\mysubsect{"^(trans_ils il)^"}\n"
  | Subsubs(il) -> "\\mysubsubs{"^(trans_ils il)^"}\n"
  | Itemize(bll) -> "\\begin{itemize}\n"^
      (catmap (function bl -> "\\myitem "^(trans_bls bl)) bll)^"\\end{itemize}\\vspace{-2ex}\n"
  | Title(n,il) -> "{\\"^(ntosize n)^"\\centerize{}"^(trans_ils il)^"\\par}\n"
  | Vskip(ln) -> Printf.sprintf "\\vspace{%gem}" ln
and trans_bls = function x -> catmap trans_blk x (*sigh*)


let xlate bl = preamble^(trans_bls bl)^postamble
