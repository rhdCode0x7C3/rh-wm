open Core

type t =
  | Val of string
  | Vals of string list
      (** Val: the raw value of an environment variable. Vals: The raw value,
          split on ':'. Useful for $PATH and other path lists. *)

type error = Unset of string | Bad_type

val pp : Format.formatter -> t -> unit [@@ocaml.toplevel_printer]
  
val get : string -> (t, error) Result.t
val value : t -> (string, error) Result.t
val values : t -> (string list, error) Result.t
