.DEFAULT_GOAL:=help
SHELL:=/bin/bash

.PHONY: help build

build: ## Build a copy of the application
	bazel build //...
	cat bazel-bin/cmd/wasm/main.wasm > app/main.wasm

run: build ## Build and run a copy of the application
	http-server app/.

help: ## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)