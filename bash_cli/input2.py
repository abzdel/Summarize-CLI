import boto3, json, sagemaker, io
import pandas as pd

endpoint = "huggingface-pytorch-inference-2023-02-17-19-38-32-638" # fix later

runtime = boto3.client("sagemaker-runtime")

endpoint_name = endpoint

# create corpus dataframe that has one sentence
text = "this is a test sentence"
print(text)
corpus = pd.DataFrame([text])

# export corpus to csv
#corpus.to_csv("corpus.csv", index=False)

csv_buffer = open('corpus.csv')
payload = csv_buffer.read()

response = runtime.invoke_endpoint(
    EndpointName=endpoint_name,
    #Body=open("corpus.csv", "rb"),
    Body=payload,
    ContentType='text/csv',
)

print(response)