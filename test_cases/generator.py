def generate(iteration):
    return "word"+ str(iteration + 1) # start at 1 so we can look at last record and get num words

# generate 1024 words
with open('test_cases/1024words.txt', 'w') as f:
    for i in range(1024):
        f.write(str(generate(i)) + ' ')

# generate 1025 words - should fail
with open('test_cases/1025words.txt', 'w') as f:
    for i in range(1025):
        f.write(str(generate(i)) + ' ')