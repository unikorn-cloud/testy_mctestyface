# Application version encoded in all the binaries.
VERSION = 0.0.0

# Main target, builds all binaries.
.PHONY: all
all:

# Create container images.  Use buildkit here, as it's the future, and it does
# good things, like per file .dockerignores and all that jazz.
.PHONY: images
images:
	if [ -n "$(RELEASE)" ]; then docker buildx create --name unikorn --use; fi
	docker buildx build --platform linux/amd64 --push -f Dockerfile -t ghcr.io/unikorn-cloud/test:${VERSION} .
	if [ -n "$(RELEASE)" ]; then docker buildx rm unikorn; fi
