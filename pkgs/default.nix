{ lib, stdenv, fetchurl, ... }:

stdenv.mkDerivation rec {
  pname = "my-package";
  version = "1.0";

  src = fetchurl {
    url = "https://example.com/my-package-1.0.tar.gz";
    sha256 = "...";
  };

  meta = with lib; {
    description = "A custom package";
    license = licenses.mit;
  };
}
