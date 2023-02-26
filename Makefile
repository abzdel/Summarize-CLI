install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black bash_cli/*.py
	black summarize.ipynb
	black tests/generator.py

lint:
	pylint --disable=R,C bash_cli/*.py
	pylint --disable=R,C tests/generator.py

test:
	bats test

clean:
	rm -r .*.txt # remove all hidden .txt files in bash_cli - may cause tool to stop working if run when model is deployed

all: install lint format test