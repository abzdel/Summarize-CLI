source ./utils/check_active.sh

# take out quotes from environment variables, store in temp variables
model_temp=$(echo $model | tr -d '"')
endpt_temp=$(echo $endpt | tr -d '"')
endptconfig_temp=$(echo $endptconfig | tr -d '"')


# load in model and endpoint names
echo "deleting resources..."
aws sagemaker delete-model --model-name $model_temp
echo "model deleted"
aws sagemaker delete-endpoint --endpoint-name $endpt_temp
echo "endpoint deleted"
aws sagemaker delete-endpoint-config --endpoint-config-name $endptconfig_temp
echo "endpoint config deleted"

echo "all resources successfully deleted!"