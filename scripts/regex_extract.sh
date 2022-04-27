mkdir -p package
grep -oP '\/usr[^\>]+' $1 |  xargs -I '{}' cp '{}' package

if [ -f /usr/lib64/ld-linux-x86-64.so.2 ]
then
    cp /usr/lib64/ld-linux-x86-64.so.2 package
fi

if [ -f /lib64/ld-linux-x86-64.so.2]
then
    cp /lib64/ld-linux-x86-64.so.2 package
fi