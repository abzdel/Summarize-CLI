# check if corpus is too long
if [[ $(wc -w output_file.txt) > 1024 ]]; then
    echo "corpus is too long. please shorten to 1025 words or less"
    exit 1
fi
echo $(wc -w output_file.txt)
source ./bash_cli/utils/check_active.sh

endpt_temp=$(echo $endpt | tr -d '"') # remove quotes for sagemaker invocation

# run to_json to clean up user input
python bash_cli/to_json.py

echo "invoking endpoint..."
aws sagemaker-runtime invoke-endpoint \
    --endpoint-name $endpt_temp \
    --body file://bash_cli/corpus.json \
    --content-type application/json output_file.txt

echo -e "finished, results in output_file.txt\n"
echo "result: "
./bash_cli/utils/print_output.sh
