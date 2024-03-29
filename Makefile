SHELL := /bin/bash

.PHONY: tools lint build dependencies test

tools:
		# install gometalinter
		go get -u github.com/alecthomas/gometalinter

		# install gox
		go get -v github.com/mitchellh/gox

		# install all known linters:
		gometalinter --install

lint:
		gometalinter --config="linters.json" ./...

build:
		@mkdir -p bin/
		go build -o ./bin/vault-init
		@echo

dependencies:
		dep ensure

test:
		go test -v ./...
