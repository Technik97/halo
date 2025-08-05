open Tape

let rec eval instructions tape =
  match instructions with
  | [] -> ()
  | instr :: rest ->
    let tape =
      match instr with
      | '>' -> move_right tape
      | '<' -> move_left tape
      | '+' -> increment tape
      | '-' -> decrement tape
      | '.' ->
        print_char (char_of_int (get tape));
        flush stdout;
        tape
      | ',' ->
        (* Will implement input later *)
        tape
      | '[' | ']' ->
        (* Skip loops for now *)
        tape
      | _ -> tape
    in
    eval rest tape
