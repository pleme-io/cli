{
  description = "Go CLI framework library for building command-line interfaces";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoLibraryCheck = (import "${substrate}/lib/go-library-check.nix").mkGoLibraryCheck;
    in {
      checks.default = mkGoLibraryCheck pkgs {
        pname = "cli";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-wE5GPDNe5p0WrgoO3TupIHDTH+HpyfD5vuzZsuwB80o="; # COMPUTING
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
