source ./utils/check_active.sh

endpt_temp=$(echo $endpt | tr -d '"') # remove quotes for sagemaker invocation

corpus=$(<corpus.txt)

echo "invoking endpoint..."
aws sagemaker-runtime invoke-endpoint \
    --endpoint-name $endpt_temp \
    --body 'testing a regular string as corpus' summary.txt

echo "finished, results in summary.txt"