
test:
	go run ~/gopath/src/github.com/client9/gospell/cmd/sample/sample.go
	misspell content/post/2016*.md

build: test
	hugo
