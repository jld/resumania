open Rtype;;

Main.drive "jld" [
Title(5,[Rm"Jed Davis"]);
Title(2,[Tt"<jld@panix.com>"]);
Title(0,[Rm"3459 16th St. #2, San Francisco, CA 94114; 857-389-3671"]);
(*Title(1,[Bf"Objective: goes here, if desired"]);*)


Section[Rm"Work History"];

Subsect[Rm"Member of Technical Staff"];
(* What's the best way to indicate organizational unit? *)
Par[Bf"VMware, vSphere (ESXi) Kernel Core Team";Rm", May 2010 - present"];
Itemize[
[Par[Rm"Maintained subsystems ranging from ";
     Rm"memory allocation to filesystem implementation to error reporting"]];
[Par[Rm"Improved filesystem and memory management infrastructure owned by other groups"]];
(* "owned by other groups" is a bit blunt; can it be made more flowery in space avail.? *)
[Par[Rm"Debugged and fixed a variety of code, kernel and userlevel, ";
     Rm"as part of rotating bug triage duties"]]; (* <- phrasing? *)
[Par[Rm"Upgraded the kernel build to a newer C compiler, ";
     Rm"modifying the compiler to make this possible"]];
(* Can I allude to the #kernelworldproblems caused by a compiler change? *)
[Par[Rm"Implemented a system for kernel-specialized low-overhead detection of ";
     Rm"a class of memory usage errors"]]
];

Subsect[Rm"Graduate Teaching Assistant and Research Assistant"];
Par[Bf"Northeastern University";Rm", January 2008 - May 2010"];
(* This section is still a little... unfortunate, but then so was grad school. *)
Itemize[
[Par[Rm"Explored potential applications of NAND flash memory to transparent persistence ";
     Rm"in garbage-collected managed runtime environments."]];
[Par[Rm"Wrote and managed homework submission software, graded assignments, and developed testing tools"]];
[Par[Rm"Led and oversaw laboratory exercises" (* fixme: make this longer and less bad *)]];
[Par[Rm"Investigated novel applications and combinations of verification techniques"]];
[Par[Rm"Assisted with reviewing papers for conferences"]]
];

Subsect[Rm"Student Developer"(* ??? *)];
Par[Bf"Google Summer of Code";Rm", May 2009 - August 2009"];
Itemize[
(* "fault tolerance" may not be the term I want here? *)
[Par[Rm"Extended NetBSD's software RAID driver to improve fault tolerance"]];
[Par[Rm"Had work accepted for inclusion in the next major and minor releases"]]
];

Subsect[Rm"Systems Programmer / System Administrator"];
Par[Bf"Public Access Networks Corp. (Panix)";Rm", February 2004 - December 2006"];
Itemize[
 (* *All* of this needs hit with a stick. *)
[Par[Rm"Modified and extended a large existing codebase to the needs of a managed server product"]];
 (* That means GCS; can it sound more epic? *)
[Par[Rm"Installed and upgraded software for internal and customer use, under an in-house package system"]];
 (* fixme: convey that I compiled it with stone knives and bearskins *)
(*[Par[Rm"Redesigned backup system to increase retention and decrease administrative overhead"]];*)
[Par[Rm"Gained primary responsibility for email system; significantly improved its performance"]];
[Par[Rm"Analyzed and corrected defects in the NetBSD kernel, including Xen paravirtual drivers"]];
 (* Can this be worded better? Can/ought it be two points? *)
(*[Par[Rm"Rewrote the NetBSD/xen paravirtual clock driver and disk backend"]] *)
[Par[Rm"Had 24-hour on-call responsibilities, both rotating and permanent"]]
(* include: asst'd infrastructure (conserver, libcheck, ...), ??? *)
];


Section[Rm"Education"];
(* Is this how I want to format this? *)
Subsect[Rm"Northeastern University, Boston, MA"];
Itemize[
[Par[Bf"M.S.";Rm", Computer Science, 2010"]];
(* FIXME: explain that it was a consolation master's and I was trying to do research.
   Somehow.*)
];
Subsect[Rm"Oberlin College, Oberlin, OH"];
Itemize[
[Par[Bf"B.A.";Rm", Computer Science (high honors) and Mathematics, 2003"]];
(* Does anyone still care about my GRE scores? *)
[Par[Rm"Honors project: composable object-orientation for agent-based modelling"]]
];


Section[Rm"Skills"];
Itemize[
[Par[Bf"Programming Languages: ";
     Rm"C, C++, Coq, Erlang, Forth, Java, ";Tt"m4";Rm", OCaml, Perl, Python, Ruby, Scheme, ";
     Tt"sh";Rm"/";Tt"sed";Rm"/";Rm"AWK; ";Spec"TeX";Rm"/";Spec"LaTeX";
     Rm", x86 assembly (i386, x86_64)"]];
[Par[Bf"Operating Systems: ";
     Rm"Linux (Debian), NetBSD, VMware ESXi"]];
[Par[Bf"Revision Control: ";
     Rm"CVS, Git, Mercurial, Perforce, Subversion"]]
(* Still not sure this section is all it can be.... *)
];

Section[Rm"Miscellaneous"];
Itemize[
[Par[Rm"Judges' Prize and 3rd place, ICFP Programming Competition, 2007 (as team of one)"]];
[Par[Rm"NetBSD Developer (full commit access), 2005 - 2012"]];
[Par[Rm"Lost the 20th International Obfuscated C Code Competition"]]
(* What else? *)
];


Vskip 1.5;
Title(0,[It"References available upon request"])

];;
