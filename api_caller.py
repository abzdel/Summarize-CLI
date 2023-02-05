import requests


#HF_ACCESS_TOKEN = os.environ.get("HF_ACCESS_TOKEN") # get your key from https://huggingface.co/settings/token
HF_ACCESS_TOKEN = "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"

# sending request to hugging face inference api
API_URL = "https://api-inference.huggingface.co/models/distilbert-base-cased-distilled-squad"
headers = {"Authorization": f"Bearer {HF_ACCESS_TOKEN}"}


def query(payload):
	response = requests.post(API_URL, headers=headers, json=payload)
	return response.json()
	
# text is command line input
text = "What is the capital of France?"

output = query({
	"inputs": {
		"question": text,
		"context": "unknown",
	},
})

print(output)