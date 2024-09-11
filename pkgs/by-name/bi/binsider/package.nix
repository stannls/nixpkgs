{ lib, rustPlatform, fetchFromGitHub }:
rustPlatform.buildRustPackage rec {
  pname = "binsider";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-+QgbSpiDKPTVdSm0teEab1O6OJZKEDpC2ZIZ728e69Y=";
  };

  cargoHash = "sha256-lXYTZ3nvLrfEgo7AY/qSQYpXsyrdJuQQw43xREezNn0=";

  checkFlags = [
    # skipping app tests because they are also failing in the upstream
    "--skip=app::tests::test_init"
    "--skip=app::tests::test_extract_strings"
  ];

  meta = with lib; {
    description = "Static and dynamic analysis tui.";
    homepage = "https://github.com/orhun/binsider";
    license = licenses.asl20;
    maintainers = with maintainers; [ stannis ];
    mainProgram = "binsider";
  };
}
