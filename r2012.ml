open Rtype;;

Main.drive "jld" [
Title(5,[Rm"Jed Davis"]);
Title(2,[Tt"<jld@panix.com>"]);
Title(0,[Rm"3459 16th St. #2, San Francisco, CA; 857-389-3671"]);
(*Title(1,[Bf"Objective: goes here, if desired"]);*)

(* FIXME 2012: Could drop this below the work history.... *)
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

Section[Rm"Work History"];

(* TODO: compact the two NEU assistantships *)
Subsect[Rm"Graduate Teaching Assistant"];
Par[Bf"Northeastern University";Rm", January 2009 - May 2010"];
Itemize[
[Par[Rm"Graded programming homework assignments and developed related testing tools"]];
[Par[Rm"Wrote and managed homework submission software"]];
[Par[Rm"Led and oversaw laboratory exercises" (* fixme: make this longer and less bad *)]]
];

Subsect[Rm"Student Developer"(* ??? *)];
Par[Bf"Google Summer of Code";Rm", May 2009 - August 2009"];
Itemize[
(* "fault tolerance" may not be the term I want here? *)
[Par[Rm"Extended NetBSD's software RAID driver to improve fault tolerance"]];
[Par[Rm"Had work accepted for inclusion in the next major and minor releases"]]
];

Subsect[Rm"Graduate Research Assistant"];
Par[Bf"Northeastern University";Rm", January 2008 - December 2008"];
Itemize[
[Par[Rm"Worked with Panagiotis Manolios on formal verification methods"]];
[Par[Rm"Investigated novel applications and combinations of verification techniques"]];
[Par[Rm"Assisted with reviewing papers for conferences"]]
(* suggest that I'd bootstrapped myself into an unknown field *)
];


Subsect[Rm"Systems Programmer / System Administrator"];
Par[Bf"Public Access Networks Corp. (Panix)";Rm", February 2004 - December 2006"];
Itemize[
 (* *All* of this needs hit with a stick. *)
[Par[Rm"Modified and extended a large existing codebase to the needs of a managed server product"]]; (* That means GCS; can it sound more epic? *)

[Par[Rm"Installed and upgraded software for internal and customer use, under an in-house package system"]]; (* fixme: convey that I compiled it with stone knives and bearskins *)

[Par[Rm"Redesigned backup system to increase retention and decrease administrative overhead"]];

[Par[Rm"Gained primary responsibility for email system; significantly improved its performance"]];

[Par[Rm"Analyzed and corrected defects in the NetBSD kernel, including Xen paravirtual drivers"]]; (* Can this be worded better? Can/ought it be two points? *)
(*[Par[Rm"Rewrote the NetBSD/xen paravirtual clock driver and disk backend"]] *)

[Par[Rm"Had 24-hour on-call responsibilities, both rotating and permanent"]]

(* include: asst'd infrastructure (conserver, libcheck, ...), ??? *)
];


Section[Rm"Skills"];
Itemize[
[Par[Bf"Programming Languages:";Rm" C, C++, OCaml, Scheme, Erlang, Perl, Common Lisp, Forth, Java, ";Tt"sh";Rm"/";Tt"sed";Rm"/";Rm"AWK, ";Tt"m4";Rm", i386 assembly, ";Spec"TeX";Rm"/";Spec"LaTeX"]];
(* What else? *)

(* FIXME: This section needs to be refactored; I'm just not sure how. *)
];

Section[Rm"Miscellaneous"];
Itemize[
[Par[Rm"NetBSD Developer (full commit access), 2005 - 2012"]];
[Par[Rm"Judges' Prize and 3rd place, ICFP Programming Competition, 2007 (as team of one)"]]
(* What else? *)
];


Vskip 1.5;
Title(0,[It"References available upon request"])

];;
