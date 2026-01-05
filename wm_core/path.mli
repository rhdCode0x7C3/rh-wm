type fragment = string
type t = Absolute of fragment list | Relative of fragment list

val pp : Format.formatter -> t -> unit [@@ocaml.toplevel_printer]
val to_string : t -> string
val of_string : string -> t
val of_env : (Env.t, Env.error) Result.t -> (t, Env.error) Result.t
val equal : t -> t -> bool
val to_fragments : t -> string list
val concat : t list -> t
