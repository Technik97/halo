{
  description = "OCaml development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        ocamlPackages = pkgs.ocamlPackages;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # OCaml toolchain
            ocaml
            dune_3  # Using newer dune version
            ocamlPackages.ocaml-lsp
            ocamlPackages.ocamlformat
            ocamlPackages.utop
            ocamlPackages.findlib

            # Additional packages
            ocamlPackages.re
            rlwrap
          ];

          shellHook = ''
            echo "OCaml dev shell ready!"
            echo "OCaml: $(ocaml --version)"
            echo "Dune: $(dune --version)"
          '';
        };
      });
}
