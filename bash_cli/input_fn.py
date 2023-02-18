import boto3
import os
import json
from sagemaker_inference import content_types, decoder
import numpy as np

def input_fn(file):
    # read in txt file
    with open(file, 'r') as f:
        text = f.read()
    
    # parse and replace any " with ''
    text = text.replace('"', '')

    # overwrite the corpus.txt file with the new text
    with open(file, 'w') as f:
        f.write(text)
    
input_fn('corpus.txt')
print("text cleaned")
