open Tape

let is_valid_char c = 
  match c with 
  | '>' | '<' | '+' | '-' | '.' | ',' | '[' | ']' -> true
  | _ -> false

let _parse (code : string): char list = 
  code 
  |> String.to_seq 
  |> Seq.filter is_valid_char
  |> List.of_seq

let () = 
  let tape = Tape.init () in 
  let tape = tape |> increment |> increment |> move_right |> increment in
  Printf.printf "Left: %s\n" (String.concat ";" (List.map string_of_int tape.left));
  Printf.printf "Current: %d\n" tape.current;
  Printf.printf "Right: %s\n" (String.concat ";" (List.map string_of_int tape.right)) 
