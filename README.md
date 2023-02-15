# Summarize-CLI


## New, completed program
- run python summarize.py
    - this deploys the model to sagemaker and calls predict in an infintie loop that the user terminates
    - user can summarize as many things as they want
    - once user types 'exit', model and endpoint (+ its config) are deleted
        - if you exit the program through different method, resources will stay up - would like to find solution for this
        - would be suboptimal if someone less well-versed with aws used this tool and ended up using resources without knowing

## conversion plan - bash tool (utilizes aws cli)
- run summarize.sh
    - ideally, will take a flag if we need to deploy the model, shut it down, or just use its existing resources for inference (can we maybe find a way to pause the resources on aws?)