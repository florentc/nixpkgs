{ buildGoModule, lib, fetchFromGitHub }:

buildGoModule rec {
  pname = "clickhouse-backup";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "AlexAkulov";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-07se1eMnyhnccaIMtNHv9NPFGqR+WWvIsmjwUGrsQSI=";
  };

  vendorSha256 = "sha256-+LNLhUfWyLD9a0fj7M5OjR9CUMQ+XjOxNa5n3mn2X9U=";

  postConfigure = ''
    export CGO_ENABLED=0
  '';

  meta = with lib; {
    homepage = "https://github.com/AlexAkulov/clickhouse-backup";
    description = "Tool for easy ClickHouse backup and restore with cloud storages support";
    license = licenses.mit;
    maintainers = with maintainers; [ ma27 ];
    platforms = platforms.linux;
  };
}
