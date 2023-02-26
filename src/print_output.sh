export output=$(awk -F'summary_text' '{print $2}' output_file.txt)

# remove first two characters from output
export output=${output:2}

# remove last two characters from output
export output=${output::-2}

# overwrite contents of output_file.txt with output variable
echo $output > output_file.txt

echo $output