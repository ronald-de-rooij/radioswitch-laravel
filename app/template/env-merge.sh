#! /bin/sh
original_file=$1
patch_file=$2

# loop from here:
# https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
while IFS="" read -r line || [ -n "$line" ]
do
    if [ ! "$line" ]; then
       continue
    fi
    # (?<==) is the lookbehind for = to keep it
    # otherwise it will match key1/key2 in regular text
     search_string=$(echo "$line" | perl -ne 's/(?<==).*//g; print;')
    #printf 'search string: "%s"\n' "$search_string"
    #sed  -i -e "s/$search_string.*/$line/g" $original_file
    if grep "$search_string.*" $original_file; then
      sed  -i -e "s/$search_string.*/$line/g" $original_file
    else
      sed -i -e "$ a $line" $original_file
    fi
done < "$patch_file"