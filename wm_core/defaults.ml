open Core

let is_dev () =
  let open Result.Let_syntax in
  let%bind envvar = Env.get "RHUL_DEV" in
  let%map value = Env.value envvar in
  Bool.of_string value
