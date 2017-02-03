(*
 * Copyright (c) 2003-2017 Jed Davis <jld@xlerb.net>
 * 
 * All rights reserved.
 *)

open Rtype;;

Main.drive "jld" [
Title(5,[Rm"Jed Davis"]);
Title(2,[Tt"<jld@xlerb.net>"]);
Title(0,[Rm"2000 Walnut St. #215, Boulder, CO 80302; 415-845-4647"]);
(*Title(1,[Bf"Objective: goes here, if desired"]);*)


Section[Rm"Work History"];

Subsect[Rm"Mozilla Corporation"];
Par[Bf"Software Engineer";Rm", February 2013 - present"];
(* That title seems dull, but I'm not putting "Bit Herder" on my formal resume. *)
Itemize[
(* Should I just name Firefox/Gecko/FxOS instead of being generic? *)
(* Especially given that I name NetBSD elsewhere *)
[Par[Rm"Designed and implemented system-level security sandboxing technology for a Web renderer"]];
[Par[Rm"Refactored legacy code for asynchrony and process separation"]];
[Par[Rm"Developed tools to investigate system-level performance on a novel mobile OS"]];
(* Some recognition of the NSS work would be nice, but hard to summarize *)
(* Also this could surely be made to sound more impressive (cf. the older jobs) *)
];

Subsect[Rm"VMware, vSphere (ESXi) Kernel Core Team"];
(* What's the best way to indicate organizational unit? *)
Par[Bf"Member of Technical Staff";Rm", May 2010 - January 2013"];
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
     Rm"a class of memory usage errors"]];
];

Subsect[Rm"Previously:"];
(* Is it suboptimal that I'm eliding employer names? *)
(* Did I trim too much from the originals? *)

(* ## Grad school ## *)
Itemize[
[Par[Rm"Researched potential applications of NAND flash memory to transparent persistence ";
     Rm"in garbage-collected managed runtime environments."]];

(* ## GSoC ## *)
[Par[Rm"Improved crash recovery efficiency of NetBSD's software RAID driver"]];

(* ## Panix ## *)
[Par[Rm"Had primary responsibility for a small ISP's email system; significantly improved its performance"]];
[Par[Rm"Analyzed and corrected defects in the NetBSD kernel, including Xen paravirtual drivers"]];
];


Section[Rm"Education"];
(* Is this how I want to format this? *)
Subsect[Rm"Northeastern University, Boston, MA"];
Itemize[
[Par[Bf"M.S.";Rm", Computer Science, 2010"]];
(* FIXME: explain that it was a consolation master's and I was trying to do research.
   And make that sound like a good thing. *)
];
Subsect[Rm"Oberlin College, Oberlin, OH"];
Itemize[
[Par[Bf"B.A.";Rm", Computer Science (high honors) and Mathematics, 2003"]];
(* Does anyone still care about my GRE scores? *)
[Par[Rm"Honors project: composable object-orientation for agent-based modelling"]];
];

Section[Rm"Skills"];
Itemize[
[Par[Bf"Programming Languages: ";
     Rm"C, C++, Coq, Erlang, Forth, Haskell, JavaScript, ";Tt"m4";
     Rm", OCaml, Perl, Python, Rust, Scheme, ";
     Tt"sh";Rm"/";Tt"sed";Rm"/";Rm"AWK; ";Spec"TeX";Rm"/";Spec"LaTeX";
     Rm", x86 assembly (i386, x86_64)"]];
[Par[Bf"Operating Systems: ";
     Rm"Linux (Debian), FreeBSD, NetBSD, VMware ESXi"]];
[Par[Bf"Revision Control: ";
     Rm"Git, Mercurial, Subversion, Perforce, CVS"]];
(* Still not sure this section is all it can be.... *)
(* Specifically, this reeks of being a holdover from when I was much younger. *)
];

Section[Rm"Miscellaneous"];
Itemize[
[Par[Rm"Judges' Prize and 3rd place, ICFP Programming Competition, 2007 (as team of one)"]];
[Par[Rm"Implemented the Rust language's optional pointer optimization"]];
[Par[Rm"Lost the 20th International Obfuscated C Code Competition"]];
(* What else? *)
];


Vskip 1.5;
Title(0,[It"References available upon request"]);

];;
