open Core

let connect ~net =
  let open Wayland in
  Eio.Switch.run @@ fun sw ->
  let transport = Unix_transport.connect ~sw ~net () in
  let client = Client.connect ~sw transport in
  Registry.of_display client
