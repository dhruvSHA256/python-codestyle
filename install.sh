#!/bin/bash

if [[ ! -d .git ]]; then
    echo "[*] error: Not a git repo !!!"
    exit 1
fi

precommit_config="https://gist.githubusercontent.com/dhruvSHA256/ae1c759688baee09e2ce60757c4c48eb/raw/427ceee22c6890ac84628356b4c7704ddaa13b52/.pre-commit-config.yaml"
pylint_config="https://gist.githubusercontent.com/dhruvSHA256/ae1c759688baee09e2ce60757c4c48eb/raw/427ceee22c6890ac84628356b4c7704ddaa13b52/.pylintrc"
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
    wget $precommit_config
fi

if [[ ! -f "./.pylintrc" ]]; then
    echo "[*] No pylint config found, downloading default pylint config: "
    wget $pylint_config
fi

echo ""
echo -e "[*] Installing required pip modules"
pip install pylint black[d] pre-commit

echo ""
echo "[*] Installing git pre-commit hook in current repo"
pre-commit install

echo ""
echo "[*] running pre-commit hook once for testing"
pre-commit run --all-files
