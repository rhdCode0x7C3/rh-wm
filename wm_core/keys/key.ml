open Core

type t =
  | Char of char
  | Enter
  | Escape
  | Tab
  | Backspace
  | Space
  | ArrowUp
  | ArrowDown
  | ArrowLeft
  | ArrowRight
  | Home
  | End
  | PageUp
  | PageDown
  | Insert
  | Delete
  | F of int

let validate key = function
  | Char c -> if Char.is_alphanum c then Some key else None
  | F n -> if n >= 1 && n <= 12 then Some key else None
  | _ -> Some key
