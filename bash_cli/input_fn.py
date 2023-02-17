from sagemaker_inference import content_types, decoder
import sys
import pandas as pd
def input_fn(input_data, content_type):
        """A default input_fn that can handle JSON, CSV and NPZ formats.
         
        Args:
            input_data: the request payload serialized in the content_type format
            content_type: the request content_type

        Returns: input_data deserialized into torch.FloatTensor or torch.cuda.FloatTensor depending if cuda is available.
        """
        return decoder.decode(input_data, content_type)

# import corpus.txt, convert to csv, and save as corpus.csv
df = pd.read_csv('corpus.txt', sep='\t', header=None)
df.to_csv('corpus.csv', index=False, header=False)

print(df)
#input_type = sys.argv[2]
#output_data = input_fn(input_data, input_type)
