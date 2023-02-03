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