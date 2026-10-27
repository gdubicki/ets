.PHONY: all build lint test shorttest snapshot update-readme clean

all: build

build:
	go build

lint:
	golangci-lint run ./...
	for d in fixtures/*/; do (cd $$d && golangci-lint run ./...) || exit 1; done

test:
	go test -v -race

shorttest:
	go test -v -race -short

snapshot:
	goreleaser --snapshot --skip=publish --clean

update-readme:
	tools/update-readme.sh
	doctoc README.md

clean:
	@- $(RM) ets
