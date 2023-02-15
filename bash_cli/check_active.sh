# run aws sagemaker list-models in a loop and save each "ModelName" to local file
# repeat same step for endpoint (check if config is deleted with it)

aws sagemaker list-models | jq ".Models[0].ModelName" > modelname.txt
aws sagemaker list-endpoints | jq ".Endpoints[0].EndpointName" > endpointname.txt

# parse models.json for modelname

