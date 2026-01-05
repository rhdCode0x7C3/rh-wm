open Core

let connection ~net =
  let open Wayland in
  Eio.Switch.run @@ fun sw ->
  let transport = Unix_transport.connect ~sw ~net () in
  let client = Client.connect ~sw transport in
  let reg = Registry.of_display client in
  let river = Registry.get_exn reg "river_window_manager_v1" in
  river
