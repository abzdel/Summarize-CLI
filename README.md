# Summarize-CLI


## What I have right now
- Two Python scripts
    - get_webpage (incomplete): takes user input (from bash script) and parses HTML for main body text
    - api_caller (complete): uses HF inference API to query model and print out the summarized result
        - doesnt appear to be an API equivalent in Rust, so I plan to run the Python script in main Rust program

- summarize.sh
    - hard-coded corpus of a soccer player from wikipedia
        - once I figure out how to properly parse the html of different inputs, I will automate this
    - take corpus (currently hard-coded) as an input and pass to api_caller.py

- goal
    - move everything (save api_caller) to a Rust release target


- current process
1. new python program to load in onnx model and run prediction from command line input
2. run this program inside of rust



check following folder to find where hugging face stuff is being saved: 
Downloading and preparing dataset wiki_dpr/dummy.psgs_w100.nq.no_index to /home/codespace/.cache/huggingface/datasets/wiki_dpr/dummy.psgs_w100.nq.no_index-dummy=True,with_index=False/0.0.0/74d4bff38a7c18a9498fafef864a8ba7129e27cb8d71b22f5e14d84cb17edd54...
