install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black bash_cli/*.py
	black summarize.ipynb

lint:
	pylint --disable=R,C bash_cli/*.py

check:
	chmod +x test/deploy_tests.sh
	chmod +x test/query_tests.sh
	chmod +x test/restore_tests.sh
	chmod +x test/remove_tests.sh

	./test/deploy_tests.sh
	./test/query_tests.sh
	./test/restore_tests.sh
	./test/remove_tests.sh

clean:
	rm -r bash_cli/.*.txt # remove all hidden .txt files in bash_cli - may cause tool to stop working if run when model is deployed


all: install lint format check