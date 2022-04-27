mkdir -p package
grep -oP '\/usr[^\>]+' $1 |  xargs -I '{}' cp '{}' package
cp /usr/lib/ld-linux-x86-64.so* package