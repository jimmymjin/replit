{ stdenv
, clang
}:
stdenv.mkDerivation {
  name = "hello";

  src = ./src;

  buildPhase = ''
	  ${clang}/bin/clang main.c -o main
  '';

  installPhase = ''
		mkdir -p $out/bin
		cp -r main $out/bin
  '';
}