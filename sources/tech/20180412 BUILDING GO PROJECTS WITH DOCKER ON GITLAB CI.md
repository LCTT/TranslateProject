translating----geekpi

BUILDING GO PROJECTS WITH DOCKER ON GITLAB CI
===============================================

### Intro

This post is a summary of my research on building Go projects in a Docker container on CI (Gitlab, specifically). I found solving private dependencies quite hard (coming from a Node/.NET background) so that is the main reason I wrote this up. Please feel free to reach out if there are any issues or a submit pull request on the Docker image.

### Dep

As dep is the best option for managing Go dependencies right now, the build will need to run `dep ensure` before building.

Note: I personally do not commit my `vendor/` folder into source control, if you do, I’m not sure if this step can be skipped or not.

The best way to do this with Docker builds is to use `dep ensure -vendor-only`. [See here][1].

### Docker Build Image

I first tried to use `golang:1.10` but this image doesn’t have:

*   curl

*   git

*   make

*   dep

*   golint

I have created my own Docker image for builds ([github][2] / [dockerhub][3]) which I will keep up to date - but I offer no guarantees so you should probably create and manage your own.

### Internal Dependencies

We’re quite capable of building any project that has publicly accessible dependencies so far. But what about if your project depends on another private gitlab repository?

Running `dep ensure` locally should work with your git setup, but once on CI this doesn’t apply and builds will fail.

### Gitlab Permissions Model

This was [added in Gitlab 8.12][4] and the most useful feature we care about is the `CI_JOB_TOKEN` environment variable made available during builds.

This basically means we can clone [dependent repositories][5] like so

```
git clone https://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.com/myuser/mydependentrepo

```

However we do want to make this a bit more user friendly as dep will not magically add credentials when trying to pull code.

We will add this line to the `before_script` section of the `.gitlab-ci.yml`.

```
before_script:
  - echo -e "machine gitlab.com\nlogin gitlab-ci-token\npassword ${CI_JOB_TOKEN}" > ~/.netrc

```

Using the `.netrc` file allows you to specify which credentials to use for which server. This method allows you to avoid entering a username and password every time you pull (or push) from Git. The password is stored in plaintext so you shouldn’t do this on your own machine. This is actually for `cURL` which Git uses behind the scenes. [Read more here][6].

Project Files
============================================================

### Makefile

While this is optional, I have found it makes things easier.

Configuring these steps below means in the CI script (and locally) we can run `make lint`, `make build` etc without repeating steps each time.

```
GOFILES = $(shell find . -name '*.go' -not -path './vendor/*')
GOPACKAGES = $(shell go list ./...  | grep -v /vendor/)

default: build

workdir:
	mkdir -p workdir

build: workdir/scraper

workdir/scraper: $(GOFILES)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o workdir/scraper .

test: test-all

test-all:
	@go test -v $(GOPACKAGES)

lint: lint-all

lint-all:
	@golint -set_exit_status $(GOPACKAGES)

```

### .gitlab-ci.yml

This is where the Gitlab CI magic happens. You may want to swap out the image for your own.

```
image: sjdweb/go-docker-build:1.10

stages:
  - test
  - build

before_script:
  - cd $GOPATH/src
  - mkdir -p gitlab.com/$CI_PROJECT_NAMESPACE
  - cd gitlab.com/$CI_PROJECT_NAMESPACE
  - ln -s $CI_PROJECT_DIR
  - cd $CI_PROJECT_NAME
  - echo -e "machine gitlab.com\nlogin gitlab-ci-token\npassword ${CI_JOB_TOKEN}" > ~/.netrc
  - dep ensure -vendor-only

lint_code:
  stage: test
  script:
    - make lint

unit_tests:
  stage: test
  script:
    - make test

build:
  stage: build
  script:
    - make

```

### What This Is Missing

I would usually be building a Docker image with my binary and pushing that to the Gitlab Container Registry.

You can see I’m building the binary and exiting, you would at least want to store that binary somewhere (such as a build artifact).

--------------------------------------------------------------------------------

via: https://seandrumm.co.uk/blog/building-go-projects-with-docker-on-gitlab-ci/

作者：[ SEAN DRUMM][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://seandrumm.co.uk/
[1]:https://github.com/golang/dep/blob/master/docs/FAQ.md#how-do-i-use-dep-with-docker
[2]:https://github.com/sjdweb/go-docker-build/blob/master/Dockerfile
[3]:https://hub.docker.com/r/sjdweb/go-docker-build/
[4]:https://docs.gitlab.com/ce/user/project/new_ci_build_permissions_model.html
[5]:https://docs.gitlab.com/ce/user/project/new_ci_build_permissions_model.html#dependent-repositories
[6]:https://github.com/bagder/everything-curl/blob/master/usingcurl-netrc.md
