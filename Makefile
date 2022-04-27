.PHONY: test

strace:
	strace -e trace=open,close -o strace_output.txt -y mold --version

test:
	sudo podman run --rm -it -v ${PWD}:/app -w /app centos:7 bash