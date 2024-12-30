SHELL := /bin/bash

install:
	python3.10 -m venv .venv \
	&& source .venv/bin/activate \
	&& pip install -r requirements.txt \
	&& npm i jupyterlab-plotly

activate:
	source .venv/bin/activate

edit: activate
	source .venv/bin/activate && \
	jupyter lab --allow-root --no-browser
	
install-template:
	mkdir -p .venv/share/jupyter/nbconvert/templates/overperformingai \
	&& cp src/template/default/* .venv/share/jupyter/nbconvert/templates/overperformingai/

dist: activate install-template
	.venv/bin/python3.10 -m jupyter nbconvert src/index.ipynb --execute --output ../dist/index.html --template overperformingai --to html --TagRemovePreprocessor.remove_input_tags='{"remove_cell"}'
