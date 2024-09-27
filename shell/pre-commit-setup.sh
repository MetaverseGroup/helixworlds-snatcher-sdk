#!/bin/sh

python -m pip install --upgrade pip

pip install pre-commit

pre-commit install

echo "Pre-commit hooks installed successfully."