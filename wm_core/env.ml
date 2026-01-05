open Core

type t = Val of string | Vals of string list
type error = Unset of string | Bad_type

let pp ppf t =
  match t with
  | Val s -> Format.fprintf ppf "%s" s
  | Vals l -> Format.fprintf ppf "%s" (String.concat l ~sep:":")

let make s =
  let l = String.split s ~on:':' in
  if List.length l = 1 then Val s else Vals l

let get key =
  match Sys_unix.unsafe_getenv key with
  | Some s -> Ok (make s)
  | None -> Error (Unset key)

let value t = match t with Val v -> Ok v | _ -> Error Bad_type
let values t = match t with Vals l -> Ok l | _ -> Error Bad_type
