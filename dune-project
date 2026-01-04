(lang dune 3.20)
(name rh-wm)
(version dev)
(generate_opam_files)

(source (gitlab rhd0x7C3/rh-wm))
(license MIT)
(authors "rhdCode <rhdCode0x7C3@icloud.com>")
(maintainers "rhdCode <rhdCode0x7C3@icloud.com>")

(package
  (name rh-wm)
  (synopsis "Window manager for River written in OCaml")
  (description "Window manager for River written in OCaml")
  (depends (ocaml (>= 5.2.0))
           (core (>= 0.17.1))
           (core_unix (>= 0.17.1))
           (cmdliner (>= 2.0.0))
           ;; Wayland
           (wayland (>= 2.2))
           ;; Dev setup
           (utop :with-dev-setup)
           (ocamlformat :with-dev-setup)
           (ocp-indent :with-dev-setup)
           (merlin :with-dev-setup)
           (ocaml-lsp-server :with-dev-setup)))
