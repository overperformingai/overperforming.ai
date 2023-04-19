SHELL := /bin/bash

install:
	python3.9 -m venv .venv \
	&& source .venv/bin/activate \
	&& pip install -r requirements.txt \
	&& jupyter contrib nbextension install --user \
	&& jupyter labextension install jupyterlab-plotly

activate:
	source .venv/bin/activate

edit: activate
	source .venv/bin/activate && \
	jupyter lab --allow-root --no-browser
	
install-template:
	mkdir -p .venv/share/jupyter/nbconvert/templates/overperformingai \
	&& cp src/template/default/* .venv/share/jupyter/nbconvert/templates/overperformingai/

dist: activate install-template
	.venv/bin/python3.9 -m jupyter nbconvert src/index.ipynb --execute --output ../dist/index.html --template overperformingai --to html --TagRemovePreprocessor.remove_input_tags='{"remove_cell"}'

setup-py39:
	sudo apt-get update \
	&& sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev \
	&& mkdir tmppy39 \
	&& cd tmppy39 \
	&& wget https://www.python.org/ftp/python/3.9.15/Python-3.9.15.tgz \
	&& tar -xf Python-3.9.15.tgz \
	&& cd Python-3.9.15 \
	&& ./configure --enable-optimizations \
	&& make -j 6 \
	&& sudo make altinstall \
	&& sudo apt install python3-pip \
	&& cd ../../ && rm -r tmppy39
	