# Variables
SOURCE = persil

# Functions
define clean
	rm -rf *.egg-info .pytest_cache build dist
	find . -name "*.pyc" | xargs rm -f
	find . -name __pycache__ | xargs rm -rf
	rm -f *.spec
endef

# Commands
all: lint test
test: unit
publish: clean lint test upload
	$(call clean)

clean:
	$(call clean)

deps:
	pip3 install -U pip
	pip3 install -r requirements.txt

lint:
	@echo Linting source code...
	ruff $(SOURCE) test
	@echo

format:
	@echo Formatting source code using black
	black $(SOURCE) bench test
	@echo

unit:
	@echo Running unit tests...
	pytest -svvv test
	@echo

upload:
	python setup.py sdist bdist_wheel
	twine upload dist/*
