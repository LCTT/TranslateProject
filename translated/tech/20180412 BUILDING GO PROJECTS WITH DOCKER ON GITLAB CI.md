在 GITLAB CI 中使用 DOCKER 构建 GO 项目
===============================================

### 介绍

这篇文章是我在 CI 的 Docker 容器中构建 Go 项目的研究总结（特别是在 Gitlab 中）。我发现很难解决私有依赖问题（来自 Node/.NET 背景），因此这是我写这篇文章的主要原因。如果 Docker 镜像上存在任何问题或提交请求，请随时与我们联系。

### Dep

由于 dep 是现在管理 Go 依赖关系的最佳选择，因此在构建前之前运行 `dep ensure`。

注意：我个人不会将我的 `vendor/`  文件夹提交到源码控制，如果你这样做，我不确定这个步骤是否可以跳过。

使用 Docker 构建的最好方法是使用 `dep ensure -vendor-only`。 [见这里][1]。

### Docker 构建镜像

我第一次尝试使用  `golang:1.10`，但这个镜像没有：

*   curl

*   git

*   make

*   dep

*   golint

我已经为我将不断更新的构建创建好了镜像（[github][2] / [dockerhub][3]） - 但我不提供任何保证，因此你应该创建并管理自己的 Dockerhub。

### 内部依赖关系

我们完全有能力创建一个有公共依赖关系的项目。但是如果你的项目依赖于另一个私人 gitlab 仓库呢？

在本地运行 `dep ensure` 应该可以和你的 git 设置一起工作，但是一旦在 CI 上不适用，构建就会失败。

### Gitlab 权限模型

这是在[ Gitlab 8.12 中添加的][4]，我们关心的最有用的功能是在构建期提供的 `CI_JOB_TOKEN` 环境变量。

这基本上意味着我们可以像这样克隆[依赖仓库][5]

```
git clone https://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.com/myuser/mydependentrepo

```

然而，我们希望使这更友好一点，因为 dep 在试图拉取代码时不会奇迹般地添加凭据。

我们将把这一行添加到 `.gitlab-ci.yml` 的 `before_script` 部分。

```
before_script:
  - echo -e "machine gitlab.com\nlogin gitlab-ci-token\npassword ${CI_JOB_TOKEN}" > ~/.netrc

```

使用 `.netrc` 文件可以指定哪个凭证用于哪个服务器。这种方法可以避免每次从 Git 中拉取（或推送）时输入用户名和密码。密码以明文形式存储，因此你不应在自己的计算机上执行此操作。这实际用于 Git 在背后使用  `cURL`。 [在这里阅读更多][6]。

项目文件
============================================================

### Makefile

虽然这是可选的，但我发现它使事情变得更容易。

配置这些步骤意味着在 CI 脚本（和本地）中，我们可以运行 `make lint`、`make build` 等，而无需每次重复步骤。

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

这是 Gitlab CI 魔术发生的地方。你可能想使用自己的镜像。

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

### 缺少了什么

我通常会用我的二进制文件构建 Docker 镜像，并将其推送到 Gitlab 容器注册器中。

你可以看到我正在构建二进制文件并退出，你至少需要将该二进制文件（例如生成文件）存储在某处。

--------------------------------------------------------------------------------

via: https://seandrumm.co.uk/blog/building-go-projects-with-docker-on-gitlab-ci/

作者：[ SEAN DRUMM][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://seandrumm.co.uk/
[1]:https://github.com/golang/dep/blob/master/docs/FAQ.md#how-do-i-use-dep-with-docker
[2]:https://github.com/sjdweb/go-docker-build/blob/master/Dockerfile
[3]:https://hub.docker.com/r/sjdweb/go-docker-build/
[4]:https://docs.gitlab.com/ce/user/project/new_ci_build_permissions_model.html
[5]:https://docs.gitlab.com/ce/user/project/new_ci_build_permissions_model.html#dependent-repositories
[6]:https://github.com/bagder/everything-curl/blob/master/usingcurl-netrc.md
