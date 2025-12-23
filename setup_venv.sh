#!/usr/bin/env bash
set -euo pipefail

VENV_DIR="${HOME}/envs/pcg"
PYTHON_BIN="${PYTHON_BIN:-python3}"

mkdir -p "$(dirname "$VENV_DIR")"

if [[ ! -d "$VENV_DIR" ]]; then
  "$PYTHON_BIN" -m venv "$VENV_DIR"
fi

source "${VENV_DIR}/bin/activate"
python -m pip install -U pip wheel setuptools

# base deps
pip install -r requirements.txt

# PyTorch GPU wheel (works with your driver; uses packaged CUDA runtime)
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# quick sanity check
python - <<'PY'
import torch
print("torch:", torch.__version__)
print("cuda available:", torch.cuda.is_available())
if torch.cuda.is_available():
    print("gpu:", torch.cuda.get_device_name(0))
PY

echo "Done. Activate later with: source ${VENV_DIR}/bin/activate"
