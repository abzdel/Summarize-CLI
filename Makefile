install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black bash_cli/*.py
	black summarize.ipynb
	black test_cases/generator.py

lint:
	pylint --disable=R,C bash_cli/*.py
	pylint --disable=R,C test_cases/generator.py

test:
	echo "no tests yet"

clean:
	rm -r bash_cli/.*.txt # remove all hidden .txt files in bash_cli - may cause tool to stop working if run when model is deployed

all: install lint format