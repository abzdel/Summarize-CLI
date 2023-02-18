from sagemaker_inference import content_types, decoder, default_inference_handler, encoder, errors
import pandas as pd

def default_input_fn(input_data, content_type, context=None):
        """A default input_fn that can handle JSON, CSV and NPZ formats.

        Args:
            input_data: the request payload serialized in the content_type format
            content_type: the request content_type
            context (obj): the request context (default: None).

        Returns: input_data deserialized into torch.FloatTensor or torch.cuda.FloatTensor depending if cuda is available.
        """
        return decoder.decode(input_data, content_type)

# open corpus.csv
corpus = "this is a test corpus with a few different words in it."

# run default input_fn on corpus.csv
new = default_input_fn(corpus, content_type='text/csv')

# export new as txt
print(type(new))


import boto3

# Create a low-level client representing Amazon SageMaker Runtime
sagemaker_runtime = boto3.client("sagemaker-runtime", region_name="us-east-1")

# The name of the endpoint. The name must be unique within an AWS Region in your AWS account. 
endpoint_name='<endpoint-name>'

# After you deploy a model into production using SageMaker hosting 
# services, your client applications use this API to get inferences 
# from the model hosted at the specified endpoint.
response = sagemaker_runtime.invoke_endpoint(
                            EndpointName="huggingface-pytorch-inference-2023-02-18-22-05-11-000", 
                            Body=bytes('{"features": ["This is great!"]}', 'utf-8'),
                            ContentType="text/csv"
                            )

# Optional - Print the response body and decode it so it is human read-able.
print(response['Body'].read().decode('utf-8'))