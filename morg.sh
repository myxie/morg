#!/bin/bash 

find . -name "*.md" | while read i; do 
    file_name="${i##*/}"; md_dir="${i%${file_name}}";html_dir="${md_dir//md/html}";
    if [ ! -d "$html_dir" ]
    then 
        echo "${html_dir} does not exist";
        mkdir $html_dir
    fi
    pandoc -f markdown -t html "${i}" -o "${html_dir}${file_name//md/html}"
done
