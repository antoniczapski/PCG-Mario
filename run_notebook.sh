#!/usr/bin/env bash
set -euo pipefail

VENV_DIR="${HOME}/envs/pcg"
source "${VENV_DIR}/bin/activate"

python -m jupyter nbconvert \
  --to notebook --execute plgrid_grokking_modadd.ipynb \
  --ExecutePreprocessor.timeout=-1 \
  --output plgrid_grokking_modadd.executed.ipynb

echo "Wrote: plgrid_grokking_modadd.executed.ipynb"
