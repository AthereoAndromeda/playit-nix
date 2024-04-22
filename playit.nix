{ stdenv, lib
, autoPatchelfHook
, fetchurl
}:

stdenv.mkDerivation rec {
  pname = "playit-agent-bin";
  version = "0.0.1";

  src = fetchurl {
    url = "https://github.com/playit-cloud/playit-agent/releases/download/v0.15.13/playit-linux-amd64";
    hash = "sha256-ZgdYCbQgCtAGth7JzHB9tkwuNBnF85NBDDNfONwkgmY=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  sourceRoot = ".";

  unpackPhase = "cp $src playit";

  buildPhase = "chmod a+x playit";

  installPhase = ''
    runHook preInstall
    install -m755 -D playit $out/bin/playit
    runHook postInstall
  '';

  meta = with lib; {
    inherit pname version;
  };
}
