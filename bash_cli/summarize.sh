source ./utils/check_active.sh

endpt_temp=$(echo $endpt | tr -d '"') # remove quotes for sagemaker invocation

# run to_json to clean up user input
python to_json.py

echo "invoking endpoint..."
aws sagemaker-runtime invoke-endpoint \
    --endpoint-name $endpt_temp \
    --body file://corpus.json \
    --content-type application/json output_file.txt

echo -e "finished, results in output_file.txt\n"
echo "result: "
./utils/print_output.sh
echo -e "\nfinished now - remember to run utils/delete_resources.sh to avoid being charged for unused resources"

"""
ideas for where im going:
- add a custom link tag - will *attempt* to parse html from any webpage you pass it and return its summary
- add a custom model tag - will deploy different models apart from the default we're using here
- move to_json to rust, see if we can move model deployment to rust as well


-cd
    - linting, formatting
    - context of a bash script -> put to separate environment
    - put in efs?
        - invoke from lambda? timer instead of event 
    - cloudbuild


- fix delete resources
    - when codespace ended and i came back a few hours later, resources were still running but delete resources errored out


"""