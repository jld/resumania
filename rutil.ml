
let rec iescape etab str buf ofs len =
  match etab with
    [] -> Buffer.add_substring buf str ofs len
  | (chr,esc)::tcdr ->
      try let x = (String.index_from str ofs chr)-ofs in
      if x >= len then raise Not_found else
      iescape tcdr str buf ofs x;
      Buffer.add_string buf esc;
      iescape etab str buf (ofs+x+1) (len-x-1)
      with Not_found -> iescape tcdr str buf ofs len
	  
let escape etab str =
  let buf = Buffer.create ((String.length str)*11/10) in
  iescape etab str buf 0 (String.length str);
  Buffer.contents buf

let rec strx str n = if (n<=0) then "" else str^(strx str (pred n))
