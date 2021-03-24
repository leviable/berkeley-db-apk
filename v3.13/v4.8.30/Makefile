
WORKDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

ALPINE_VERSION := 3.13
IMAGE := ghcr.io/leviable/apk-builder:$(ALPINE_VERSION)

DOCKER_BUILDKIT ?= 1

PRIV_KEY ?= $(WORKDIR)/../../keys/builder.rsa
PUB_KEY ?= $(WORKDIR)/../../keys/builder.rsa.pub

.PHONY: build
build:
	docker run --rm -it \
		-e PACKAGER_PRIVKEY=/home/builder/.abuild/builder.rsa \
		-v $(WORKDIR)/APKBUILD:/apk-builder/APKBUILD \
		-v $(WORKDIR)/atomic.patch:/apk-builder/atomic.patch \
		-v $(WORKDIR)/build.sh:/apk-builder/build.sh \
		-v $(PRIV_KEY):/home/builder/.abuild/builder.rsa \
		-v $(PUB_KEY):/home/builder/.abuild/builder.rsa.pub \
		-v $(WORKDIR)/packages:/home/builder/packages \
		--entrypoint "./build.sh" \
		$(IMAGE)

.PHONY: shell
shell:
	docker run --rm -it \
		-e PACKAGER_PRIVKEY=/home/builder/.abuild/builder.rsa \
		-v `pwd`:/apk-builder \
		-v `pwd`/../../keys/builder.rsa:/home/builder/.abuild/builder.rsa \
		-v `pwd`/../../keys/builder.rsa.pub:/home/builder/.abuild/builder.rsa.pub \
		-v `pwd`/packages:/home/builder/packages \
		$(IMAGE)
