type inline =
    Rm of string
  | Bf of string
  | It of string
  | Tt of string
  | Sc of string
  | Spec of string

type ilst = inline list

type block =
    Par of ilst
  | Section of ilst
  | Subsect of ilst
  | Subsubs of ilst
  | Itemize of block list list
  | Title of int*ilst

type xlator = block list -> string
