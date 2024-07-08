all: install_dependencies build_binaries format lint test 

install_dependencies:
  go get ./...

build_binaries: install_dependencies
  go build -o ./httpserver cmd/httpserver/main.go
  go build -o ./ginserver cmd/ginserver/main.go

run_binaries: build_binaries
  ./httpserver
  ./ginserver

format:
  go fmt ./...
lint:
  golangci-lint run ./...

test:
  go test ./... -v

build_images:
  docker-compose build

run_containers:
  docker-compose up