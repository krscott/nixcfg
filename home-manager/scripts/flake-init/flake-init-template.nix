# flake.nix template
# Kris Scott
#
# How to use:
# 1. Update description and binName
# 2. Uncomment commented code lines and update as needed
# 3. Delete this how-to comment

{
  description = "TODO";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      binName = "my-prog";
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = function:
        nixpkgs.lib.genAttrs supportedSystems (system:
          function { 
            inherit system;
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in {
      packages = forAllSystems ({ pkgs, ... }:
        {
          default = pkgs.clangStdenv.mkDerivation {
            name = binName;
            src = ./.;

            # buildInputs = with pkgs; [
            #   cairo
            #   cmake
            #   meson
            #   ninja
            #   pkg-config
            # ];

            # configurePhase = ''
            #   meson build
            # '';

            # buildPhase = ''
            #   (
            #     cd build
            #     meson compile
            #   )
            # '';

            # installPhase = ''
            #   mkdir -p $out/bin
            #   cp build/src/${binName} $out/bin
            # '';
          };
        }
      );

      apps = forAllSystems ({ system, ... }: {
        default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/${binName}";
        };
      });

      # devShells = forAllSystems ({ system, pkgs, ... }:
      #   let
      #     llvm = pkgs.llvmPackages_latest;
      #   in {
      #     default = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
      #       packages = with pkgs; self.packages.${system}.default.buildInputs ++ [
      #         # debugger
      #         llvm.lldb
      #         gdb

      #         # fix headers not found
      #         clang-tools

      #         # LSP and compiler
      #         llvm.libstdcxxClang

      #         # other tools
      #         cppcheck
      #         llvm.libllvm
      #         valgrind

      #         # stdlib for cpp
      #         llvm.libcxx
      #       ];
      #     };
      #   });
    };
}

