cd playwright
npx playwright test
cd ..

cd robot-framework
DIR="venv/bin"
BIN_ACTIVATE="./bin/activate"
VENV="venv"

if [ ! -d "$DIR" ]; then
  python3 -m venv venv
  cd "$VENV"
  source "$BIN_ACTIVATE"
  pip install -r ../requirements.txt
else
  cd "$VENV"
  source "$BIN_ACTIVATE"
fi

robot ../tests/testSuite1.robot
deactivate