mkdir -p package
grep -oP '\/usr[^\>]+' $1 |  xargs -I '{}' cp '{}' package
cp /usr/lib64/ld-linux-x86-64.so.2 package