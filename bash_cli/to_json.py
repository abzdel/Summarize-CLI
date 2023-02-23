# read in corpus.txt file
file = open("corpus.txt", "r")
text = file.read()

# remove all double quotes from text
text = text.replace('"', '')

# force text to appear on one line
text = text.replace("\r","")
text = text.replace("\n","")


# create a file named corpus.json
with open('bash_cli/corpus.json', 'w') as f:
    f.write('{"inputs": "')
    f.write(text)
    f.write('"}')
