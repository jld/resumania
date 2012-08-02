let filewrite fn st =
  let o = open_out fn in
  output_string o st;
  close_out o;
  Printf.fprintf stderr "Output written on %s (%d bytes)\n%t"
    fn (String.length st) flush

let syspr cmd =
  Printf.fprintf stderr "(*%s*)\n%t" cmd flush;
  0==Sys.command cmd

let isyspr cmd = ignore(syspr cmd)

let drive stem bl =
  filewrite (stem^".tex") (Latex.xlate bl);
  filewrite (stem^".nr") (Nroff.xlate bl);
  filewrite (stem^".html") (Html.xlate bl);
  filewrite (stem^".rtf") (Rtf.xlate bl);

  if syspr("latex "^stem) then begin
    isyspr("rm -f "^stem^".aux "^stem^".log");
    isyspr("dvips "^stem^" -o");
    (* isyspr("pdflatex "^stem) *)
    isyspr("dvipdfm -v "^stem)
  end;

  if syspr("nroff -c "^stem^".nr > "^stem^".tty") then begin
    isyspr("ul -t ansi "^stem^".tty > "^stem^".ansi");
    isyspr("ul -t dumb "^stem^".tty > "^stem^".txt");
  end
