
### 10.23 `README.md`

```markdown
# credit-default

[![CI](https://github.com/your-handle/credit-default/actions/workflows/ci.yml/badge.svg)](https://github.com/your-handle/credit-default/actions/workflows/ci.yml)
[![Python 3.12](https://img.shields.io/badge/python-3.12-blue.svg)](https://www.python.org/)
[![Code style: ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)

> A typed, tested, packaged credit-default classifier — the foundation project for a 12-week MLOps course.

## Quick start

```bash
git clone https://github.com/your-handle/credit-default
cd credit-default
make install
make download
make train
make evaluate
Project layout
src/credit_default/   # the importable package
tests/                # pytest suite
notebooks/            # exploratory notebooks (not part of the package)
data/, models/        # gitignored runtime artifacts
Make targets
Run make help to see all targets. The most useful ones:

Target	What it does
make install	Install Python 3.12, deps, pre-commit hooks.
make check	Lint + type-check + tests (CI parity).
make train	Run the end-to-end training pipeline.
make pre-commit	Run all pre-commit hooks against all files.
Dataset
UCI Default of Credit Card Clients (Yeh, 2009; CC BY 4.0). 30,000 rows × 23 features. Binary target: default.payment.next.month.

Course context
This repository is the artifact of Module 1 of a 12-week MLOps course. Subsequent modules will:

M2 containerize this project with Docker.
M3 add MLflow tracking + DVC versioning.
M4 add Dagster orchestration + GitHub Actions CI/CD beyond Module 1's basics.
M5 add a Feast feature store + BentoML serving.
M6 add Evidently monitoring + drift detection.
License
MIT. See LICENSE.


### 10.24 `notebooks/01_exploration.ipynb` (placeholder)

You can leave this as a one-cell stub for now — the *cleaned* exploration. The point in Module 1 is just to demonstrate that you've registered the kernel and that notebooks can `import credit_default`.

```python
# notebooks/01_exploration.ipynb
%load_ext autoreload
%autoreload 2

from credit_default.config import get_settings
from credit_default.data import load_raw
from credit_default.features import clean_categoricals

settings = get_settings()
df = clean_categoricals(load_raw(settings))
df.describe(include="all").T.head(10)