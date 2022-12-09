for i in $(find . *.md); do
    echo $(date -r "$i") >> "$i"
done
