echo "deleting resources..."
aws sagemaker delete-model --model-name $(cat modelname.txt)
echo "model deleted"
aws sagemaker delete-endpoint --endpoint-name $(cat endpointname.txt)
echo "endpoint deleted"