source ./utils/check_active.sh

endpt_temp=$(echo $endpt | tr -d '"') # remove quotes for sagemaker invocation


echo $endpt_temp
# converting txt to csv
#sed 's/ \+/,/g' corpus.txt > corpus.csv

#corpus=$(<corpus.txt)

echo "invoking endpoint..."
aws sagemaker-runtime invoke-endpoint \
    --endpoint-name $endpt_temp \
    --body file://corpus.json \
    --content-type application/json output_file.txt

echo "finished, results in output_file.txt"
echo "result:\n"
cat output_file.txt
echo "\n finished now - remember to run utils/delete_resources.sh to avoid being charged for unused resources"