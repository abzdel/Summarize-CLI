install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black bash_cli/*.py
	black summarize.ipynb

lint:
	pylint --disable=R,C bash_cli/*.py

check:
	bats test

clean:
	rm -r bash_cli/.*.txt # remove all hidden .txt files in bash_cli - may cause tool to stop working if run when model is deployed


all: install lint format check