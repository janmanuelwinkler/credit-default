"""Credit-default classifier package (MLOps course Module 1)."""

from importlib.metadata import PackageNotFoundError, version

try:
    __version__ = version("credit-default")
except PackageNotFoundError:  # pragma: no cover
    __version__ = "0.0.0+local"

__all__ = ["__version__"]
