如何在 Docker 中设置 Go 并部署应用
============================================================

嗨，在本教程中，我们将学习如何使用 docker 部署 golang web 应用程序。 你可能已经知道，由于 golang 的高性能和可靠性，docker 是完全是用 golang 写的。在我们详细介绍之前，请确保你已经安装了 docker 以及 golang 并对它们有基本了解。

###  关于 docker

Docker 是一个开源程序，它可以将应用及其完整的依赖包捆绑到一起，并打包为容器，与宿主机共享相同的 Linux 内核。另一方面，像 VMware 这样的基于 hypervisor 的虚拟化操作系统容器提供了高级别的隔离和安全性，这是由于客户机和主机之间的通信是通过 hypervisor 来实现的，它们不共享内核空间。但是硬件仿真也导致了性能的开销，所以容器虚拟化诞生了，以提供一个轻量级的虚拟环境，它将一组进程和资源与主机以及其它容器分组及隔离，因此，容器内部的进程无法看到容器外部的进程或资源。

### 用 Go 语言创建一个 “Hello World” web 应用

首先我们为 Go 应用创建一个目录，它会在浏览器中显示 “Hello World”。创建一个 `web-app` 目录并使它成为当前目录。进入 `web-app` 应用目录并编辑一个名为 `main.go` 的文件。

```
root@demohost:~# mkdir web-app
root@demohost:~# cd web-app/
root@demohost:~/web-app# vim.tiny main.go

package main
import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello %s", r.URL.Path[1:])
}

func main() {
    http.HandleFunc("/World", handler)
    http.ListenAndServe(":8080", nil)
}
```

使用下面的命令运行上面的 “Hello World” Go 程序。在浏览器中输入 `http://127.0.0.1:8080/World` 测试，你会在浏览器中看到 “Hello World”。

```
root@demohost:~/web-app# PORT=8080 go run main.go
```

下一步是将上面的应用在 docker 中容器化。因此我们会创建一个 dockerfile 文件，它会告诉 docker 如何容器化我们的 web 应用。

```
root@demohost:~/web-app# vim.tiny Dockerfile

# 得到最新的 golang docker 镜像
FROM golang:latest

# 在容器内部创建一个目录来存储我们的 web 应用，接着使它成为工作目录。
RUN mkdir -p /go/src/web-app
WORKDIR /go/src/web-app

# 复制 web-app 目录到容器中
COPY . /go/src/web-app

# 下载并安装第三方依赖到容器中
RUN go-wrapper download
RUN go-wrapper install

# 设置 PORT 环境变量
ENV PORT 8080

# 给主机暴露 8080 端口，这样外部网络可以访问你的应用
EXPOSE 8080

# 告诉 Docker 启动容器运行的命令
CMD ["go-wrapper", "run"]
```

### 构建/运行容器

使用下面的命令构建你的 Go web-app，你会在成功构建后获得确认。

```
root@demohost:~/web-app# docker build --rm -t web-app .
Sending build context to Docker daemon 3.584 kB
Step 1 : FROM golang:latest
latest: Pulling from library/golang
386a066cd84a: Already exists
75ea84187083: Pull complete
88b459c9f665: Pull complete
a31e17eb9485: Pull complete
1b272d7ab8a4: Pull complete
eca636a985c1: Pull complete
08158782d330: Pull complete
Digest: sha256:02718aef869a8b00d4a36883c82782b47fc01e774d0ac1afd434934d8ccfee8c
Status: Downloaded newer image for golang:latest
---> 9752d71739d2
Step 2 : RUN mkdir -p /go/src/web-app
---> Running in 9aef92fff9e8
---> 49936ff4f50c
Removing intermediate container 9aef92fff9e8
Step 3 : WORKDIR /go/src/web-app
---> Running in 58440a93534c
---> 0703574296dd
Removing intermediate container 58440a93534c
Step 4 : COPY . /go/src/web-app
---> 82be55bc8e9f
Removing intermediate container cae309ac7757
Step 5 : RUN go-wrapper download
---> Running in 6168e4e96ab1
+ exec go get -v -d
---> 59664b190fee
Removing intermediate container 6168e4e96ab1
Step 6 : RUN go-wrapper install
---> Running in e56f093b6f03
+ exec go install -v
web-app
---> 584cd410fdcd
Removing intermediate container e56f093b6f03
Step 7 : ENV PORT 8080
---> Running in 298e2a415819
---> c87fd2b43977
Removing intermediate container 298e2a415819
Step 8 : EXPOSE 8080
---> Running in 4f639a3790a7
---> 291167229d6f
Removing intermediate container 4f639a3790a7
Step 9 : CMD go-wrapper run
---> Running in 6cb6bc28e406
---> b32ca91bdfe0
Removing intermediate container 6cb6bc28e406
Successfully built b32ca91bdfe0
```

现在可以运行我们的 web-app 了，可以执行下面的命令。

```
root@demohost:~/web-app# docker run -p 8080:8080 --name="test" -d web-app
7644606b9af28a3ef1befd926f216f3058f500ffad44522c1d4756c576cfa85b
```

进入 `http://localhost:8080/World`  浏览你的 web 应用。你已经成功容器化了一个可重复的/确定性的 Go web 应用。使用下面的命令来启动、停止并检查容器的状态。

```
### 列出所有容器
root@demohost:~/ docker ps -a

### 使用 id 启动容器
root@demohost:~/ docker start CONTAINER_ID_OF_WEB_APP

### 使用 id 停止容器
root@demohost:~/ docker stop CONTAINER_ID_OF_WEB_APP
```

### 重新构建镜像

假设你正在开发 web 应用程序并在更改代码。现在要在更新代码后查看结果，你需要重新生成 docker 镜像、停止旧镜像并运行新镜像，并且每次更改代码时都要这样做。为了使这个过程自动化，我们将使用 docker 卷在主机和容器之间共享一个目录。这意味着你不必为在容器内进行更改而重新构建镜像。容器如何检测你是否对 web 程序的源码进行了更改？答案是有一个名为 “Gin” 的好工具 [https://github.com/codegangsta/gin][1]，它能检测是否对源码进行了任何更改，然后重建镜像/二进制文件并在容器内运行更新过代码的进程。

要使这个过程自动化，我们将编辑 Dockerfile 并安装 Gin 将其作为入口命令来执行。我们将开放 `3030` 端口（Gin 代理），而不是 `8080`。 Gin 代理将转发流量到  web 程序的 `8080` 端口。

```
root@demohost:~/web-app# vim.tiny Dockerfile

# 得到最新的 golang docker 镜像
FROM golang:latest

# 在容器内部创建一个目录来存储我们的 web 应用，接着使它称为工作目录。
RUN mkdir -p /go/src/web-app
WORKDIR /go/src/web-app

# 复制 web 程序到容器中
COPY . /go/src/web-app

# 下载并安装第三方依赖到容器中
RUN go get github.com/codegangsta/gin
RUN go-wrapper download
RUN go-wrapper install

# 设置 PORT 环境变量
ENV PORT 8080

# 给主机暴露 8080 端口，这样外部网络可以访问你的应用
EXPOSE 3030

# 启动容器时运行 Gin
CMD gin run

# 告诉 Docker 启动容器运行的命令
CMD ["go-wrapper", "run"]
```

现在构建镜像并启动容器：

```
root@demohost:~/web-app# docker build --rm -t web-app .
```

我们会在当前 web 程序的根目录下运行 docker，并通过暴露的 `3030` 端口链接 CWD （当前工作目录）到容器中的应用目录下。

```
root@demohost:~/web-app# docker run -p 3030:3030 -v `pwd`:/go/src/web-app --name="test" -d web-app
````

打开 `http://localhost:3030/World`， 你就能看到你的 web 程序了。现在如果你改变了任何代码，会在浏览器刷新后反映在你的浏览器中。

### 总结

就是这样，我们的 Go web 应用已经运行在 Ubuntu 16.04 Docker 容器中运行了！你可以通过使用 Go 框架来快速开发 API、网络应用和后端服务，从而扩展当前的网络应用。

--------------------------------------------------------------------------------

via: http://linoxide.com/containers/setup-go-docker-deploy-application/

作者：[Dwijadas Dey][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/dwijadasd/
[1]:https://github.com/codegangsta/gin
