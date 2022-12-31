{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.rustup
    pkgs.rustc
    pkgs.cargo
    pkgs.wasm-pack
    pkgs.cargo-generate
    pkgs.pkg-config
    pkgs.nodePackages.npm
    pkgs.nodejs-16_x
  ];
  buildInputs = [
    pkgs.openssl
  ];
  shellHook =
    ''
      NODE_OPTIONS=--openssl-legacy-provider;
    '';
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}
