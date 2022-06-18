.PHONY: test

strace:
	strace -e trace=open,close -o strace_output.txt -y mold --version

build:
	sudo docker run --rm \
		--privileged \
		-u $(id -u):$(id -g) \
		-v ${PWD}:/app -w /app \
		ubuntu:20.04 \
		bash scripts/create_package.sh

test:
	sudo docker run --rm \
		-u $(id -u):$(id -g) \
		-v ${PWD}:/app -w /app \
		${image_name} \
		sh -c "package/ld-linux-x86-64.so.2 --library-path /app/package ./mold --version"
