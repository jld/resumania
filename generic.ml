open Rtype;;

Main.drive "generic" [
Title(5,[Rm"Jedidiah L. Davis"]);
Title(2,[Tt"<jldavis@cs.oberlin.edu>"]);
Title(0,[Rm"[REDACTED], Oberlin OH, 44074; 440/[REDACTED] (current)"]);
Title(0,[Rm"[REDACTED], Wynnewood, PA 19096; 610/[REDACTED] (permanent)"]);
(*Title(1,[Bf"Objective: for computers to help people rather than hinder them"]);*)

Section[Rm"Education"];
Subsect[Rm"Oberlin College, Oberlin, OH"];
Itemize[
[Par[Bf"Majors:";Rm" Computer Science (high honors), Mathematics; ";Bf"Minor:";Rm" Chemistry"]];
[Par[Bf"B.A.";Rm" May 2003; ";Bf"GPA:";Rm" 3.80 (CS), 3.24 (overall); ";Bf"GRE/CS:";Rm" 880 (97th percentile)"]];
[Par[Bf"Related Coursework:";Rm" Operating Systems, Computer Organization, Database Systems, Compilers, Computer Graphics, Data Structures and Algorithms (2 semesters), Theory of Computer Science, Group Theory, Linear Algebra, Number Theory, Discrete Mathematics, Multivariable Calculus, Probability, Computer Science Honors"]]; (* prune? *)
];

Section[Rm"Computer Skills"];
Itemize[
[Par[Bf"Systems:";Rm" Linux, Mac OS X, NetBSD, Solaris, DEC Tru64; Classic MacOS"]];
[Par[Bf"Languages:";Rm" ";Tt"sh";Rm", ";Tt"sed";Rm", AWK, ";Tt"m4";Rm", Tcl (Expect), Perl; C, C++, Objective-C (gcc, gdb); Scheme, OCaml; AppleScript; ";Spec"TeX";Rm", ";Spec"LaTeX";Rm", ";Tt"troff";Rm", XML, XSLT, HTML; FORTH; Java; SQL (PostgreSQL)"]];
[Par[Bf"Miscellany:";Rm" OpenGL, Sockets, POSIX, STL (C++ Standard Library), lex/yacc, DNS"]] (* more? *)
(* General? * Ability to quickly absorb new concepts/technologies *)
];

Section[Rm"Experience"];
Subsect[Rm"Student System Administrator"];
Par[Rm"Computer Science Program, Oberlin College, September 2001 - June 2003"];
Itemize[
[Par[Rm"Installed, maintained, upgraded, and supported a variety of software for the CS labs"]];
[Par[Rm"Developed tools to simplify the administration of 44 dual-boot Linux/Windows lab machines"]];
[Par[Rm"Created, maintained, and supported locally-written programs and scripts for the general user audience"]];
[Par[Rm"Assisted in migrating to the program's new main Unix server, a Sun, from its DEC Alpha predecessor"]];
[Par[Rm"Took primary responsibility for the program's systems after supervisor's departure in March 2003"]];
[Par[Rm"Designed and wrote a backup system to take better advantage of the program's tape changer"]]
(* MAYBE: TopCoder contract work? *)
];

Section[Rm"Awards"];
Itemize[
[Par[Rm"Fifth Place, ACM Collegiate Programming Competition, East Central North American Region, 2002"]];
[Par[Rm"Top 200 in US, William Lowell Putnam Mathematical Competition, 2002"]];
[Par[Rm"Baum Prize, Oberlin Mathematics Department (best Putnam score at Oberlin), 2000-2002"]]
(* PONDER: are there any more?  are HS-era awards (NM, AP) relevant? *)
];

Section[Rm"Organizations"];
Subsect[Rm"Oberlin Linux Users' Group"];
Par[Rm"Member: January 2000 - May 2003; Treasurer: September 2001 - May 2003"];
Itemize[
[Par[Rm"OLUG provides education and support for Linux and related Free Software to the Oberlin community; meetings range from general discussion and troubleshooting to topical lectures given by members."]]
];
Subsect[Rm"CS Public Software Group"];
Par[Rm"January 2000 - May 2003"];
Itemize[
[Par[Rm"A group of students who install and maintain miscellaneous software and locally-written tools, separately from but in cooperation with the system administrator."]]
];

(* PERHAPS: a random-personal-interest thing? *)

Vskip 1.5;
Title(0,[It"References available upon request"])

]
