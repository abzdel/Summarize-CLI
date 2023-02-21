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