#!/bin/bash

precommit_config="https://raw.githubusercontent.com/primenumbers-in/codestyle/main/.pre-commit-config.yaml"
pylint_config="https://raw.githubusercontent.com/primenumbers-in/codestyle/main/.pylintrc"
venv="./.venv"

if [[ ! -d .venv || ! -d venv ]]; then
    echo "[*] No venv found, making: "
    /usr/bin/python3 -m venv .venv
fi

if [[ -z $VIRTUAL_ENV ]]; then
    echo "[*] venv not activated, activating: "
    source $venv/bin/activate
fi

if [[ ! -f "./.pre-commit-config.yaml" ]]; then
    echo "[*] No precommit config found, downloading default precommit config: "
    wget $pylint_config
fi

if [[ ! -f "./.pylintrc" ]]; then
    echo "[*] No pylint config found, downloading default pylint config: "
    wget $pylint_config
fi

echo "[*] Installing required pip modules"
pip install pylint black[d] pre-commit

echo "[*] Installing git pre-commit hook in current repo"
pre-commit install

echo "[*] running pre-commit hook once for testing"
pre-commit run --all-files
