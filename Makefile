GOCMD = go
GOBUILD = $(GOCMD) build
GOCLEAN = $(GOCMD) clean
GOTEST = $(GOCMD) test
GOGET = $(GOCMD) get
GOMOD = $(GOCMD) mod
GOFMT = $(GOCMD) fmt
GOVET = $(GOCMD) vet
PACKAGENAME = valleyshadow
BINNAME = $(PACKAGENAME)

build: darwin 

all: darwin linux

darwin:
	GOOS=darwin GOARCH=amd64 $(GOBUILD) -a -o bin/$(BINNAME).darwin backend/*.go

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -a -installsuffix cgo -o bin/$(BINNAME).linux backend/*.go

clean:
	cd backend; $(GOCLEAN)
	rm -rf bin

dep:
	cd backend; $(GOGET) -u
	$(GOMOD) tidy
	$(GOMOD) verify

fmt:
	cd backend; $(GOFMT)

vet:
	cd backend; $(GOVET)

check:
	go get honnef.co/go/tools/cmd/staticcheck
	~/go/bin/staticcheck -checks all,-S1002,-ST1003 backend/*.go
