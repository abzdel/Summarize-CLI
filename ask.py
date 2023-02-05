from transformers import RagTokenizer, RagRetriever, RagTokenForGeneration

tokenizer = RagTokenizer.from_pretrained("facebook/rag-token-nq")
retriever = RagRetriever.from_pretrained("facebook/rag-token-nq", index_name="exact", use_dummy_dataset=True)
model = RagTokenForGeneration.from_pretrained("facebook/rag-token-nq", retriever=retriever)

"""
for office hours:
- want to store all of the above 3 on some cloud storage/model hosting
- wrap this into a rust program? wouldnt think there would be performance benefits with how I have it set up
- answer is different depending on if i run it through bash or python??

"""

# take commadn line input and convert to string
input_string = input("Enter a question: ")

# take stdin as input and convert to string
#import sys
#input_string = sys.stdin.read()

input_dict = tokenizer.prepare_seq2seq_batch(input_string, return_tensors="pt") 

generated = model.generate(input_ids=input_dict["input_ids"]) 
print(tokenizer.batch_decode(generated, skip_special_tokens=True)[0]) 
