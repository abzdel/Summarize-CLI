# check if model is active
# if model is active, then don't deploy
if [[ $(aws sagemaker list-models | jq ".Models[0].ModelName") != null ]]; then
    echo "model is already active. run 'query' command to invoke endpoint or 'remove' to remove model & endpoint."
    exit 1
fi

# do the same for endpoint
if [[ $(aws sagemaker list-endpoints | jq ".Endpoints[0].EndpointName") != null ]]; then
    echo "endpoint is already active. run 'query' command to invoke endpoint or 'remove' to remove model & endpoint."
    exit 1
fi

# deploy
python bash_cli/deploy.py
echo "model deployed. run tool with 'query' command to invoke endpoint"

# source check_active script to make sure we have endpoint & model names in environment
source bash_cli/utils/check_active.sh

# check if user wants to see endpoint or model names
inspect_args
endpt_check=${args[show-endpoint]}
model_check=${args[show-model]}

if [[ "$endpt_check" ]]; then
    echo "endpoint: $endpt"
    echo "endpoint config: $endptconfig"
fi

if [[ "$model_check" ]]; then
    echo "model: $model"
fi
