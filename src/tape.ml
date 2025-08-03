type tape = {
  left: int list;
  current: int;
  right: int list;
}

let init () = { left = []; current = 0; right = [] }

let move_right tape = 
  match tape.right with 
  | r :: rs -> { left = tape.current :: tape.left; current = r; right = rs}
  | [] -> { left = tape.current :: tape.left; current = 0; right = [] }

let move_left tape = 
  match tape.left with 
  | l :: ls -> { left = ls; current = l; right = tape.current :: tape.right }
  | [] -> { left = []; current = 0; right = tape.current :: tape.right }

let increment tape = 
  { tape with current = (tape.current + 1) mod 256 }

let decrement tape = 
  { tape with current = (tape.current - 1 + 256) mod 256 }

let get tape = tape.current

let set tape value = { tape with current = value }
