.PHONY: pyvenv pyupdate

VENV           = .venv
VENV_PYTHON    = $(VENV)/bin/python
SYSTEM_PYTHON  = $(or $(shell which python3), $(shell which python))
# If virtualenv exists, use it. If not, find python using PATH
PYTHON         = $(or $(wildcard $(VENV_PYTHON)), $(SYSTEM_PYTHON))
VENV_PIP    = $(VENV)/bin/pip
SYSTEM_PIP  = $(shell which pip)
PIP         = $(or $(wildcard $(VENV_PIP)), $(SYSTEM_PIP))

pyinit: pyvenv pyupdate

pyvenv: ## Create python 3 virtual environment
	$(PYTHON) -m venv .venv

pyupdate: ## Update environment for python
	$(PIP) install -U pip
	$(PIP) install -Ur requirements.txt

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'