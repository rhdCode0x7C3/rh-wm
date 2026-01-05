let setup () =
  Logs.set_reporter (Logs_fmt.reporter ());
  let log_level =
    match Defaults.is_dev () with Ok true -> Logs.Debug | _ -> Logs.Warning
  in
  Logs.set_level (Some log_level)
