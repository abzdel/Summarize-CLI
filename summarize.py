from sagemaker.huggingface import HuggingFaceModel
import sagemaker

role = sagemaker.get_execution_role()
# Hub Model configuration. https://huggingface.co/models
hub = {
	'HF_MODEL_ID':'philschmid/bart-large-cnn-samsum',
	'HF_TASK':'summarization'
}

# create Hugging Face Model Class
huggingface_model = HuggingFaceModel(
	transformers_version='4.17.0',
	pytorch_version='1.10.2',
	py_version='py38',
	env=hub,
	role=role, 
)

print("deploying model to SageMaker Inference. this may take a few minutes...")
# deploy model to SageMaker Inference
predictor = huggingface_model.deploy(
	initial_instance_count=1, # number of instances
	instance_type='ml.m5.xlarge' # ec2 instance type
)

while True:
    text = input("\nenter text to summarize: ")
    print("(enter 'exit' at any time to terminate program)\n")

    if text == "exit":
        break
    print("predicting...\n")

    print("Summarized text: \n" + predictor.predict({"inputs": text})[0].get('summary_text'))
    print("\n")

# way to output the predictor and use as an environment variable?

print("program terminated. deleting model and endpoint...")

# delete model
predictor.delete_model()

# delete endpoint - also deletes the endpoint configuration
predictor.delete_endpoint()
