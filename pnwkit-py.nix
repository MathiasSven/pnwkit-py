{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, wheel
, aiohttp
, beautifulsoup4
, requests
, pythonRelaxDepsHook
}:

buildPythonPackage rec {
  pname = "pnwkit-py";
  version = "2.6.26";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mrvillage";
    repo = "pnwkit-py";
    rev = "v${version}";
    hash = "sha256-/Qv9CblxrouR9t/i8T0OXcZcb9UrUd7crAEuPhsv+AY=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
    pythonRelaxDepsHook
  ];

  pythonRelaxDeps = true;
  propagatedBuildInputs = [
    aiohttp
    beautifulsoup4
    requests
  ];

  pythonImportsCheck = [ "pnwkit" ];

  meta = with lib; {
    description = "A Python wrapper for the Politics and War API. Check out the JavaScript (https://github.com/bsnk-dev/pnwkit) and Google Apps Script (https://github.com/bsnk-dev/pnwkit.gs) versions";
    homepage = "https://github.com/mrvillage/pnwkit-py";
    license = licenses.mit;
    maintainers = with maintainers; [ mathiassven ];
  };
}