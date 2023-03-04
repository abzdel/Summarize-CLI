[![Tests](https://github.com/nogibjj/Summarize-CLI/actions/workflows/bats.yml/badge.svg)](https://github.com/nogibjj/Summarize-CLI/actions/workflows/bats.yml)
[![Makefile](https://github.com/nogibjj/Summarize-CLI/actions/workflows/makefile.yml/badge.svg)](https://github.com/nogibjj/Summarize-CLI/actions/workflows/makefile.yml)
## Summarize CLI

Summarize CLI is a project that leverages the [Pegasus-Xsum model](https://huggingface.co/google/pegasus-xsum) from Hugging Face to generate summaries of input text. The tool is implemented in Python and Bash and is deployed to AWS SageMaker for remote inference. The project includes a command-line interface as well as a Jupyter notebook version of the same logic for interactive use.

To use Summarize CLI, the user will need Python 3, AWS CLI, an AWS account, and optionally Jupyter notebook. The installation process is straightforward, requiring only the cloning of the repository and the installation of the required Python packages.

Once installed, Summarize CLI can be used from the command line to generate summaries of input text using the Pegasus-Xsum model. This tool provides a useful tool for generating summaries of input text, making it a valuable resource for anyone who needs to summarize large volumes of text quickly and accurately.

## Architectural Diagram

![ids721 project 1 drawio](https://user-images.githubusercontent.com/55398496/222925681-bab8755e-caef-4791-bfcf-c7d1de29a308.png)

## Prerequisites
To use Summarize CLI, you will need the following:

- Python 3
- AWS CLI
- An AWS account
- Jupyter notebook (optional)

## How to run

1. Clone repository

```
git clone https://github.com/nogibjj/Summarize-CLI.git
```

2. Install dependencies
```
make install
```
3. Deploy model (takes a while)
```
./summarize deploy (or ./summarize d)
```
4. Put desired input in *corpus.txt* in root directory. Must be less than 1024 words as per the model's restrictions

5. Query endpoint
```
./summarize query (or ./summarize q)
```
6. View results in *output_file.txt*

7. ***IMPORTANT: Always turn off your resources after using the tool!***
```
./summarize remove (or ./summarize rem)
```

## Jupyter notebook
To use the Jupyter notebook version of Summarize CLI, open the summarize.ipynb notebook in Jupyter and follow the instructions in the notebook.
