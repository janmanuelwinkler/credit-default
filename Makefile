.DEFAULT_GOAL := help
.PHONY: help install sync lock fmt lint type test cov check pre-commit clean download train evaluate kernel

PY := uv run

help:  ## Show this help.
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install:  ## First-time install: Python, deps, hooks.
	uv python install 3.12
	uv sync
	$(PY) pre-commit install

sync:  ## Sync env to lockfile.
	uv sync

lock:  ## Regenerate lockfile.
	uv lock

fmt:  ## Format with ruff.
	$(PY) ruff format .
	$(PY) ruff check --fix .

lint:  ## Lint without modifying.
	$(PY) ruff check .
	$(PY) ruff format --check .

type:  ## Type-check.
	$(PY) mypy src

test:  ## Run tests.
	$(PY) pytest

cov:  ## Run tests with HTML coverage report.
	$(PY) pytest --cov-report=html
	@echo "Open htmlcov/index.html"

check: lint type test  ## Run all checks (CI parity).

pre-commit:  ## Run all pre-commit hooks against all files.
	$(PY) pre-commit run --all-files

clean:  ## Remove caches and artifacts.
	rm -rf .pytest_cache .mypy_cache .ruff_cache .coverage coverage.xml htmlcov dist build
	find . -name __pycache__ -type d -exec rm -rf {} +

kernel:  ## Register Jupyter kernel from the uv venv.
	$(PY) python -m ipykernel install --user --name credit-default --display-name "Python (credit-default)"

download:  ## Download UCI dataset to data/raw/.
	$(PY) credit-default download

train:  ## Train default model.
	$(PY) credit-default train

evaluate:  ## Evaluate persisted model.
	$(PY) credit-default evaluate