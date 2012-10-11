(*
 * Copyright (c) 2003 Jed Davis <jld@panix.com>
 * 
 * All rights reserved.
 *)

open Rtype;;

Main.drive "csadmin" [
Title(5,[Rm"Jedidiah L. Davis"]);
Title(2,[Tt"<jldavis@cs.oberlin.edu>"]);
Title(0,[Rm"[REDACTED], Oberlin College, Oberlin OH 44074; 440/[REDACTED]"]);
Title(1,[Bf"Objective: Position as a System Administrator"]);

Section[Rm"Education"];
Subsect[Rm"Oberlin College, Oberlin, OH"];
Itemize[
[Par[Rm"Majors: Computer Science (honors), Mathematics; Minor: Chemistry"]];
[Par[Rm"B.A. May 2003; GPA: 3.79 (CS), 3.23 (overall)"]];
[Par[Rm"Related Coursework: Operating Systems, Computer Organization, Database Systems, Compilers, Data Structures and Algorithms (2 semesters), Computer Graphics"]]; (* More, if there's space? *)
];

Section[Rm"Computer Skills"];
Itemize[
[Par[Rm"Systems: Linux, Mac OS X, NetBSD, Solaris, DEC Tru64, Classic MacOS"]];
(* You know, there really should be some mention of Windows there. *)
[Par[Rm"Languages: ";Tt"sh";Rm", ";Tt"sed";Rm", AWK, ";Tt"m4";Rm", Tcl, Perl, C, C++, Objective-C, Scheme, ML, AppleScript, ";Spec"TeX";Rm", ";Spec"LaTeX";Rm", ";Tt"troff";Rm", XML, XSLT, HTML"]]; (* More!! *)
(* Applications? * emacs, vi, lex/yacc, X11,  *)
(* General? * Ability to quickly absorb new concepts/technologies *)
];

Section[Rm"Experience"];
Subsect[Rm"Student System Administrator"];
Par[Rm"Computer Science Program, Oberlin College, September 2001 - June 2003"];
Itemize[
[Par[Rm"Installed, maintained, upgraded, and supported a variety of software for the CS labs"]];
[Par[Rm"Developed tools to simplify the administration of 44 dual-boot Linux/Windows lab machines, and to improve user experience"]];
[Par[Rm"Assisted in migrating to the program's new main Unix server, a Sun, from its DEC Alpha predecessor"]];
[Par[Rm"Took primary responsibility, following supervisor's departure on 7 March 2003, for the well-being of the program's systems"]]
(* More? *)
];


Section[Rm"Awards"];
Itemize[
[Par[Rm"Fifth Place, ACM Collegiate Programming Competition, East Central North American Region, November 2002"]];
[Par[Rm"Baum Prize, Oberlin Mathematics Department, 2000-2002"]];
[Par[Rm"Top 200 in US, William Lowell Putnam Mathematical Competition, December 2002"]]
];

Section[Rm"Organizations"];
Subsect[Rm"Computer Science Majors' Committee"];
Par[Rm"September 2002 - May 2003"];
Itemize[
[Par[Rm"Elected to represent student interests in the organization and administration of the program on such issues as lab policy, faculty hiring, attracting prospective majors, and community-building events."]]
];
Subsect[Rm"Oberlin Linux Users' Group"];
Par[Rm"Member: January 2000 - present; Treasurer: September 2001 - present"];
Itemize[
[Par[Rm"OLUG provides education and support for Linux and related Free Software to the Oberlin community; meetings range from general discussion and collective troubleshooting to topical lectures given by members."]]
];
Subsect[Rm"CS Public Software Group"];
Par[Rm"January 2000 - present"];
Itemize[
[Par[Rm"A group of students who install and maintain miscellaneous software and locally-written tools, separately from but in cooperation with the system administrator."]]
];
]
