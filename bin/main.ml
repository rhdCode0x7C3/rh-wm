open Wm_core

let () =
  Logging.setup ();
  Logs.debug (fun m -> m "Starting rh-wm at %f" (Core_unix.time ()));
  Eio_main.run (fun env ->
      let _registry = Wm_wayland.Connection.connect ~net:env#net in
      ())
