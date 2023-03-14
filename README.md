# Code Style for Primenumbers.in

## TLDR;

- cd into your project git repo and run;
```sh
curl -s https://gist.githubusercontent.com/dhruvSHA256/ae1c759688baee09e2ce60757c4c48eb/raw/b496864de133c9e8cc86aab25515d6bfb1a3426d/install.sh | bash
```
- PS: still need to config pycharm plugins

## Linting

We use pylint for linting python files, which
enforces code style rules specified in the [.pylintrc](.pylintrc) file.

### Installing [Pylint](https://pypi.org/project/pylint/)
- Make sure you are using a python virtual env
- If not create it, and source venv
```sh
$ /usr/bin/python3 -m venv .venv && source ./.venv/bin/activate
$ which python
```
- Install `pylint` using pip
```sh
pip install pylint
```
- Copy the [.pylintrc](.pylintrc) file to project root dir

### Installing [Pylint Plugin](https://github.com/leinardi/pylint-pycharm) in pycharm

- Open settings and search for `pylint` plugin
- Install and restart the IDE when prompted.

#### Configure pycharm to use pylint

- Path to pylintrc: .pylintrc
- Arguments: --ignore-pattern=venv

## Formatting

Manually format code is a tedious task and should be deligated to existing tools.
We use black for formatting code with just one config change (using 120 line length)

### Installing [Black](https://pypi.org/project/black/)

- Install `black` using pip
```sh
pip install black[d]
```

### Installing [Black connect](https://plugins.jetbrains.com/plugin/14321-blackconnect) in pycharm

- Open settings and search for `black connect` plugin
- Install and restart the IDE when prompted.

#### Configure pycharm to use black

- Check Trigger on code reformat
- Change line length to 120
- Start blackd

## Precommit hooks

Although we have automated linting and formatting of code, we must prevent user from
pushing unformatted code to the repo.
For this we will use , which will run user specified hooks (linting and formatting in our case)
on every commit and will refuse to push code if any hook fails.

## Installing [pre-commit](https://pypi.org/project/pre-commit/)

- Install `pre-commit` using pip
```sh
pip install pre-commit
```
- Copy [.pre-commit-config.yaml](.pre-commit-config.yaml) to project root dir
- Install pre-commit hooks
```sh
pre-commit install
```
- Run precommit once for all files to test if everything is working
```
pre-commit run --all-files
```
- if getting pylint errors, fix them and then commit again
