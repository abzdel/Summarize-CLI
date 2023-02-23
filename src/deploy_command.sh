# check if model is active
# if model is active, then don't deploy
if [ "$model_active" = true ]; then
    echo "model is already active. run 'query' command to invoke endpoint or 'remove' to remove model & endpoint."
    exit 1
fi

python bash_cli/deploy.py
echo "model deployed. run tool with 'query' command to invoke endpoint"

source bash_cli/utils/check_active.sh


# create flag variable to check if model is active
# if model is active, then don't deploy
model_active=true


inspect_args
endpt_check=${args[show_endpoint]}
model_check=${args[show_model]}

if [ "$endpt_check"]; then
    echo "endpoint: $endpt"
    echo "endpoint config: $endptconfig"
fi

if [ "$model_check"]; then
    echo "model: $model"
fi
