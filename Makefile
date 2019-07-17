.PHONY: all clean test

clean:
	rm -rf coverage
	rm -rf dist
	rm -rf build
	rm -rf doc/_build
	rm -rf doc/auto_examples
	rm -rf doc/generated
	rm -rf doc/modules
	rm -rf examples/.ipynb_checkpoints

test-code:
	pytest genover

test-doc:
	pytest doc/*.rst

test-coverage:
	rm -rf coverage .coverage
	pytest --cov=genover genover

test: test-coverage test-doc

html:
	export SPHINXOPTS=-W; make -C doc html

code-analysis:
	flake8 genover | grep -v __init__
	pylint -E genover/ -d E1103,E0611,E1101