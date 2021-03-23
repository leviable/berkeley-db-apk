
WORKDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

ALPINE_VERSION := 3.13
IMAGE := levinoecker/apk-builder:$(ALPINE_VERSION)

DOCKER_BUILDKIT ?= 1

.PHONY: build
build:
	docker run --rm -it \
		-e PACKAGER_PRIVKEY=/home/builder/.abuild/builder.rsa \
		-v `pwd`:/apk-builder \
		-v `pwd`/../../keys/builder.rsa:/home/builder/.abuild/builder.rsa \
		-v `pwd`/../../keys/builder.rsa.pub:/home/builder/.abuild/builder.rsa.pub \
		-v `pwd`/packages:/home/builder/packages \
		$(IMAGE) abuild -r

.PHONY: shell
shell:
	docker run --rm -it \
		-e PACKAGER_PRIVKEY=/home/builder/.abuild/builder.rsa \
		-v `pwd`:/apk-builder \
		-v `pwd`/../../keys/builder.rsa:/home/builder/.abuild/builder.rsa \
		-v `pwd`/../../keys/builder.rsa.pub:/home/builder/.abuild/builder.rsa.pub \
		-v `pwd`/packages:/home/builder/packages \
		$(IMAGE)
