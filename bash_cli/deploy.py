from sagemaker.huggingface import HuggingFaceModel
import sagemaker

#role = sagemaker.get_execution_role()
role = ''
# Hub Model configuration. https://huggingface.co/models
hub = {"HF_MODEL_ID": "google/pegasus-xsum", "HF_TASK": "summarization"}

# create Hugging Face Model Class
huggingface_model = HuggingFaceModel(
    transformers_version="4.17.0",
    pytorch_version="1.10.2",
    py_version="py38",
    env=hub,
    role=role,
)

print("deploying model to SageMaker. this may take a few minutes...")
# deploy model to SageMaker Inference
predictor = huggingface_model.deploy(
    initial_instance_count=1,  # number of instances
    instance_type="ml.m5.xlarge",  # ec2 instance type
)

print("\nmodel deployed!")
