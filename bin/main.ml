let () = Eio_main.run (fun env -> Wm_wayland.Connection.connection ~net:env#net)
