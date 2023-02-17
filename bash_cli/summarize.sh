source ./utils/check_active.sh

endpt_temp=$(echo $endpt | tr -d '"') # remove quotes for sagemaker invocation

# converting txt to csv
#sed 's/ \+/,/g' corpus.txt > corpus.csv

#corpus=$(<corpus.txt)

echo "invoking endpoint..."
aws sagemaker-runtime invoke-endpoint \
    --endpoint-name $endpt_temp \
    --body file://corpus.csv \
    --content-type text/csv \
    output_file.txt

echo "finished, results in output_file.txt"