# centos_live_with



Apply method in https://www.youtube.com/watch?v=qdIa9vTlg9Q

![s1](assets/s1.png)


Basically, we pack up `ld-linux-x86-64.so.2` and all `*.so` shown by ldd from the dev environment and use `ld-linux-x86-64.so.2 --library-path ./dylib_package_dir ./executable` to run on any prod environment. This method solves a lot of dependency hell problems, especially for `libstdc++.so`, `libc.so` and `libcrypto.so`

More details are in the CI scripts. Being able to run on alpine linux proves this method can be used on any linux, as long as the kernel supports.

