open Core

type fragment = string
type t = Absolute of fragment list | Relative of fragment list

let sep = Filename.dir_sep

let pp ppf t =
  let concat fragments = String.concat fragments ~sep in
  match t with
  | Absolute l -> Format.fprintf ppf "Abs %s" (concat l)
  | Relative l -> Format.fprintf ppf "Rel %s" (concat l)

let to_string t = match t with Absolute l | Relative l -> String.concat l ~sep

let of_string s =
  let l = String.split s ~on:(Char.of_string sep) in
  if String.is_empty (List.hd_exn l) then Absolute l else Relative l

let of_env (envvar : (Env.t, Env.error) Result.t) =
  let open Result.Let_syntax in
  let%bind var = envvar in
  let%map value = Env.value var in
  of_string value

let equal a b =
  match (a, b) with
  | Absolute a, Absolute b | Relative a, Relative b ->
      List.equal String.equal a b
  | _ -> false

let to_fragments = function Absolute l | Relative l -> l

let concat l =
  let rec aux acc l =
    match l with
    | [] -> acc
    | h :: t -> (
        if not (List.is_empty acc) then
          match h with
          | Absolute _ -> failwith "nope"
          | Relative p -> aux (acc @ p) t
        else match h with Absolute p | Relative p -> aux (acc @ p) t)
  in
  let new_l = aux [] l in
  match List.hd l with
  | Some (Absolute _) -> Absolute new_l
  | _ -> Relative new_l
