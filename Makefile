.PHONY: test

strace:
	strace -e trace=open,close -o strace_output.txt -y mold --version

test:
	sudo podman run --rm -it \
		-u $(id -u):$(id -g) \
		-v ${PWD}:/app -w /app \
		centos:7 \
		bash -c "package/ld-linux-x86-64.so.2 --library-path /app/package ./mold --version"
test_i:
	sudo podman run --rm -it \
		-u $(id -u):$(id -g) \
		-v ${PWD}:/app -w /app \
		centos:7 \
		bash 