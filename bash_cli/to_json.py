# read in corpus.txt file
file = open("corpus.txt", "r", encoding="UTF-8")
text = file.read()

# remove all double quotes from text
text = text.replace('"', "")

# force text to appear on one line
text = text.replace("\r", "")
text = text.replace("\n", "")


# create a file named corpus.json
with open("bash_cli/corpus.json", "w", encoding="UTF-8") as f:
    f.write('{"inputs": "')
    f.write(text)
    f.write('"}')
