{ lib
, aiohttp
, buildPythonPackage
, fetchFromGitHub
, poetry-core
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pybravia";
  version = "0.2.5";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "Drafteed";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-QWn5VdZlbxm2/ZvsQWlKuVPPBcqFkyt75Odh9Mf9Bqk=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    aiohttp
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [
    "pybravia"
  ];

  meta = with lib; {
    description = "Library for remote control of Sony Bravia TVs 2013 and newer";
    homepage = "https://github.com/Drafteed/pybravia";
    changelog = "https://github.com/Drafteed/pybravia/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
