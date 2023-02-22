install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black dblib/*.py

lint:
	pylint --disable=R,C dblib

test:
	echo "no tests yet"

clean:
	rm -r bash_cli/.*.txt # remove all .txt files in bash_cli
	rm -r .*.txt # remove all .txt files in base folder (can end up here depending on where script is run)

	#rm -r to_json/target # remove target files - too big to store in git

all: install lint format