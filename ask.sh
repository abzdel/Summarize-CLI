# command line tool - simply calls python script to summarize corpus

# take command line input

#!/bin/bash
first=$1
shift
rest="$*"  # Assuming the first character of $IFS is a space.

printf '%s ' "$first" "$rest"
printf '%s' "$first" "$rest" | python ask.py
#python ask.py

# if i just run the program and wait for it to ask for input, it works
# want a way to just type ./ask.sh "ask the question here" and have it work


#printf :%s:\\n' '"$first" "$rest"'

#echo $corpus| python api_caller.py # From the shell