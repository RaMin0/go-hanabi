PKG_NAME=$(shell go mod edit -print | head -n1 | cut -d ' ' -f 2)

run:
	@go run $(PKG_NAME)/cmd/hanabi
.PHONY: run

build:
	@go build $(PKG_NAME)/cmd/hanabi
.PHONY: build
