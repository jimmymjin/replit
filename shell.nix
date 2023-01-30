#import ./replit.nix and run local server

let
  nixospkgs = import <nixpkgs> {};
in

with nixospkgs;
mkShell {
  buildInputs = [
    (import ./replit.nix { pkgs = nixospkgs; }).deps
    hostname-debian
  ];
  shellHook = ''
     cd src/hugo/blog/;
     hugo server --bind 0.0.0.0 -b http://`hostname -I | cut -d' ' -f 1`:1313;
  '';
}
