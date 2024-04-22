{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./playit.nix {}
