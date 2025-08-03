let is_valid_char c = 
  match c with 
  | '>' | '<' | '+' | '-' | '.' | ',' | '[' | ']' -> true
  | _ -> false

let parse (code : string): char list = 
  code 
  |> String.to_seq 
  |> Seq.filter is_valid_char
  |> List.of_seq

let () = 
  let code = "++Hello World[->+<]" in
  let instructions = parse code in 
  List.iter (Printf.printf "%c") instructions;
  print_newline ()
