# [HareVim](https://github.com/TypingHare/hare-vim)

## OCaml

Run `:LangEnable ocaml`, then restart Neovim. In each project's opam switch,
install the tools and launch Neovim from that environment:

```sh
opam install ocaml-lsp-server ocamlformat dune
opam exec -- nvim
```

HareVim uses `ocamllsp` for completion, navigation, type errors and compiler
warnings, and Conform's `ocamlformat` for formatting `.ml` and `.mli` on save.
These tools use the active environment rather than Mason so the language server
matches the project's OCaml compiler. Restart Neovim when switching environments.
Native OCaml syntax highlighting is retained, including lexer and parser sources.

Use the project's existing `.ocamlformat` and install its required formatter
version. For a new project, create `.ocamlformat` at its root with
`version = <output of ocamlformat --version>`. OCamlFormat requires this file by
default.

Compiler warnings supplied by OCaml-LSP serve as the linting layer; no separate
`nvim-lint` command is needed. Run `opam exec -- dune build --watch` in another
terminal for updated project-wide build diagnostics. No debugger is configured.

See the [OCaml editor setup guide](https://ocaml.org/docs/set-up-editor) and
[OCaml-LSP documentation](https://github.com/ocaml/ocaml-lsp).
