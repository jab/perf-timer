all: test lint

.PHONY: test
test:
	PYTHONPATH=src python -m pytest --cov=src/ --no-cov-on-fail tests/

.PHONY: lint
lint:
	PYTHONPATH=src python -m pylint src/ tests/ benchmarks/

test-requirements.txt: setup.py test-requirements.in
	pip-compile --output-file $@ $^
