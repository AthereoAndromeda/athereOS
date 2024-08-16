{
  lib,
  stdenv,
}:
stdenv.mkDerivation {
  pname = "anurati-font";
  version = "1.0.0";

  src = ./anurati;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/anurati
    mv *.otf $out/share/fonts/anurati

    runHook postInstall
  '';

  meta = with lib; {
    description = "Cool Space Font";
    # homepage = "https://anytype.io/";
    # license = licenses.unfree;
    # maintainers = with maintainers; [running-grass];
    # platforms = ["x86_64-linux"];
  };
}
