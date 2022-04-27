export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y wget tar curl strace

package_dir=package
mkdir -p ${package_dir} && rm -rf ${package_dir}/*

ldd mold | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ${package_dir}

if [ -f /usr/lib64/ld-linux-x86-64.so.2 ]
then
    cp /usr/lib64/ld-linux-x86-64.so.2 ${package_dir}
fi

if [ -f /lib64/ld-linux-x86-64.so.2 ]
then
    cp /lib64/ld-linux-x86-64.so.2 ${package_dir}
fi

ls ${package_dir}
tar cvf lib-package.tar.gz ${package_dir}