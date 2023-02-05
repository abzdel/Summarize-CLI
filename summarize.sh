# command line tool - simply calls python script to summarize corpus

# take command line input
corpus=$1

echo $corpus| python api_caller.py # From the shell