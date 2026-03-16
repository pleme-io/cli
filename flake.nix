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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "library";
    pname = "cli";
    vendorHash = "sha256-wE5GPDNe5p0WrgoO3TupIHDTH+HpyfD5vuzZsuwB80o=";
    description = "Go CLI framework library for building command-line interfaces";
    homepage = "https://github.com/pleme-io/cli";
  };
}
