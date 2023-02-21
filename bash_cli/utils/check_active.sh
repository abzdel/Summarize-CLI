# run aws sagemaker list-models in a loop and save each "ModelName" to local file
# repeat same step for endpoint (check if config is deleted with it)

# parse json for model and endpoint names
aws sagemaker list-models | jq ".Models[0].ModelName" > .modelname.txt
aws sagemaker list-endpoints | jq ".Endpoints[0].EndpointName" > .endpointname.txt
aws sagemaker list-endpoint-configs | jq ".EndpointConfigs[0].EndpointConfigName" > .endpointconfigname.txt

# export above to environment variables
# may be a better way to eliminate the multiple steps here
# must source this script in the delete_resources.sh script
export model=$(cat .modelname.txt)
export endpt=$(cat .endpointname.txt)
export endptconfig=$(cat .endpointconfigname.txt)
