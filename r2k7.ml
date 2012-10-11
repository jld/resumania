(*
 * Copyright (c) 2003-2007 Jed Davis <jld@panix.com>
 * 
 * All rights reserved.
 *)

open Rtype;;

Main.drive "stdres" [
Title(5,[Rm"Jed Davis"]);
Title(2,[Tt"<jlpd@acm.org>"]);
Title(0,[Rm"[REDACTED], Somerville, MA 02143; 617-[REDACTED]"]);
(*Title(1,[Bf"Objective: goes here, if desired"]);*)

Section[Rm"Experience"];
(* PANIX GOES HERE *)

Subsect[Rm"Student System Administrator"];
Par[Rm"Computer Science Program, Oberlin College, September 2001 - June 2003"];
(* Condense these points, perhaps *)
Itemize[
[Par[Rm"Installed, maintained, upgraded, and supported a variety of software for the CS labs"]];
[Par[Rm"Developed tools to simplify the administration of 44 dual-boot Linux/Windows lab machines"]];
[Par[Rm"Created, maintained, and supported locally-written programs and scripts for the general user audience"]];
[Par[Rm"Assisted in migrating to the program's new main Unix server, a Sun, from its DEC Alpha predecessor"]];
[Par[Rm"Took primary responsibility for the program's systems after supervisor's departure in March 2003"]];
[Par[Rm"Designed and wrote a backup system to take better advantage of the program's tape changer"]]
];


Section[Rm"Awards"];
Itemize[
[Par[Rm"Judge's Prize and 3rd place, ICFP Programming Competition, 2007 (as team of one)"]];
[Par[Rm"22nd place (of XXX), ICFP Programming Competition, 2006 (as team of one)"]]; (* XXX XXX *)
[Par[Rm"Top 200 in US, William Lowell Putnam Mathematical Competition, 2002"]];
[Par[Rm"Baum Prize, Oberlin Mathematics Department (best Putnam score at Oberlin), 2000-2002"]]
];


Section[Rm"Education"];
Subsect[Rm"Oberlin College, Oberlin, OH"];
Itemize[
[Par[Bf"Majors:";Rm" Computer Science (high honors), Mathematics; ";Bf"Minor:";Rm" Chemistry"]];

[Par[Bf"B.A.";Rm" May 2003; ";Bf"GPA:";Rm" 3.80 (CS), 3.24 (overall); ";
     Bf"GRE/CS:";Rm" 880 (97th percentile); ";
     Bf"GRE/general:";Rm" 800 quantitative (94th percentile), 750 verbal (99th percentile), 4.5 writing"]];
(* GRE may need abbreviated; or its own line *)

(* [Par[Bf"Related Coursework:";Rm" Operating Systems, Computer Organization, Database Systems, Compilers, Computer Graphics, Data Structures and Algorithms (2 semesters), Theory of Computer Science, Group Theory, Linear Algebra, Number Theory, Discrete Mathematics, Multivariable Calculus, Probability, Computer Science Honors"]]; *)
(* Consider reinstating a pruned version of the above. *)
];


Section[Rm"Computer Skills"];
Itemize[
(* Lop/Axe? *)
[Par[Bf"Systems:";Rm" Linux, Mac OS X, NetBSD, Solaris, DEC Tru64; Classic MacOS"]];
(* Reconsider; definitely reorder: *)
[Par[Bf"Languages:";Rm" ";Tt"sh";Rm", ";Tt"sed";Rm", AWK, ";Tt"m4";Rm", Tcl (Expect), Perl; C, C++, Objective-C (gcc, gdb); Scheme, OCaml; AppleScript; ";Spec"TeX";Rm", ";Spec"LaTeX";Rm", ";Tt"troff";Rm", XML, XSLT, HTML; FORTH; Java; SQL (PostgreSQL)"]];
(* Reconsider/Rename? *)
[Par[Bf"Miscellany:";Rm" OpenGL, Sockets, POSIX, STL (C++ Standard Library), lex/yacc, DNS, Literate Programming (";Tt"CWEB";Rm")"]] (* more? *)
(* Other buzzword classes? *)
];

(* Perhaps a random-personal-interest thing? *)

Vskip 1.5;
Title(0,[It"References available upon request"])
]
