.PHONY: build

TAG_USER ?= noahhuppert
TAG_NAME ?= email
TAG_TAG ?= latest
TAG_ARG = ${TAG_USER}/${TAG_NAME}:${TAG_TAG}

# build docker image
build:
	docker build -t "${TAG_ARG}" .
