使用多阶段构建
============================================================

多阶段构建是 `Docker 17.05` 或更高版本提供的新功能。这对致力于优化 `Dockerfile` 的人来说，使得 `Dockerfile` 易于阅读和维护。

> 致谢: 特别感谢 [Alex Ellis][1] 授权使用他的关于 `Docker` 多阶段构建的博客文章 [Builder pattern vs. Multi-stage builds in Docker][2] 作为以下示例的基础.

### 在多阶段构建之前

关于构建镜像最具挑战性的事情之一是保持镜像体积小巧. `Dockerfile` 中的每条指令都会在镜像中增加一层, 并且在移动到下一层之前, 需要记住清除不需要的构件. 要编写一个非常高效的 `Dockerfile`, 传统上您需要使用 `shell` 技巧和其他逻辑来尽可能地减少层数, 并确保每一层都具有上一层所需的构件, 而不是其他任何东西.
实际上, 有一个 `Dockerfile` 用于开发(其中包含构建应用程序所需的所有内容), 以及另一个用于生产的瘦客户端, 它只包含您的应用程序以及运行它所需的内容. 这被称为"建造者模式". 维护两个 `Dockerfile` 并不理想.

下面分别是一个 `Dockerfile.build` 和 遵循上面的构建器模式的 `Dockerfile` 的例子:

`Dockerfile.build`:

```
FROM golang:1.7.3
WORKDIR /go/src/github.com/alexellis/href-counter/
RUN go get -d -v golang.org/x/net/html  
COPY app.go .
RUN go get -d -v golang.org/x/net/html \
  && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

```

注意这个例子还使用 Bash && 运算符人为地将两个 `RUN` 命令压缩在一起, 以避免在镜像中创建额外的层. 这很容易失败, 很难维护. 例如, 插入另一个命令时, 很容易忘记继续使用 `\` 字符.

`Dockerfile`:

```
FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY app .
CMD ["./app"]  

```

`build.sh`:

```
#!/bin/sh
echo Building alexellis2/href-counter:build

docker build --build-arg https_proxy=$https_proxy --build-arg http_proxy=$http_proxy \  
    -t alexellis2/href-counter:build . -f Dockerfile.build

docker create --name extract alexellis2/href-counter:build  
docker cp extract:/go/src/github.com/alexellis/href-counter/app ./app  
docker rm -f extract

echo Building alexellis2/href-counter:latest

docker build --no-cache -t alexellis2/href-counter:latest .
rm ./app

```

当您运行 `build.sh` 脚本时, 它会构建第一个镜像, 从中创建一个容器, 以便将该构件复制出来, 然后构建第二个镜像. 这两个镜像和应用构件会占用您的系统的空间.

多阶段构建大大简化了这种情况!

### 使用多阶段构建

在多阶段构建中, 您需要在 `Dockerfile` 中多次使用 `FROM` 声明. 每次 `FROM` 指令可以使用不同的基础镜像, 并且每次 `FROM` 指令都会开始新阶段的构建. 您可以选择将构件从一个阶段复制到另一个阶段, 在最终镜像中, 不会留下您不需要的所有内容. 为了演示这是如何工作的, 让我们调整前一节中的 `Dockerfile` 以使用多阶段构建。

`Dockerfile`:

```
FROM golang:1.7.3
WORKDIR /go/src/github.com/alexellis/href-counter/
RUN go get -d -v golang.org/x/net/html  
COPY app.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/alexellis/href-counter/app .
CMD ["./app"]  

```

您只需要单一个 `Dockerfile`. 不需要分隔构建脚本. 只需运行 `docker build` .

```
$ docker build -t alexellis2/href-counter:latest .

```

最终的结果是和以前体积一样小的生产镜像, 复杂性显着降低. 您不需要创建任何中间镜像, 也不需要将任何构件提取到本地系统.

它是如何工作的呢? 第二条 `FROM` 指令以 `alpine:latest` 镜像作为基础开始新的建造阶段. `COPY --from=0` 这一行将刚才前一个阶段产生的构件复制到这个新阶段. Go SDK和任何中间构件都被保留下来, 而不是只保存在最终的镜像中.
### 命名您的构建阶段

默认情况下, 这些阶段没有命名, 您可以通过它们的整数来引用它们, 从第一个 `FROM` 指令的 0 开始. 但是, 您可以通过在 `FROM` 指令中使用 `as <NAME>`
来为阶段命名. 以下示例通过命名阶段并在 `COPY` 指令中使用名称来改进前一个示例. 这意味着, 即使您的 `Dockerfile` 中的指令稍后重新排序, `COPY` 也不会中断。

```
FROM golang:1.7.3 as builder
WORKDIR /go/src/github.com/alexellis/href-counter/
RUN go get -d -v golang.org/x/net/html  
COPY app.go    .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/alexellis/href-counter/app .
CMD ["./app"]  
```

> 译者话: 1.此文章系译者第一次翻译英文文档，有描述不清楚或错误的地方，请读者给予反馈，不胜感激。2.本文只是简单介绍多阶段构建，如果读者需要深入了解，请自行查阅资料。
--------------------------------------------------------------------------------

via: https://docs.docker.com/engine/userguide/eng-image/multistage-build/#name-your-build-stages

作者：[docker docs ][a]
译者：[iron0x](https://github.com/iron0x)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://docs.docker.com/engine/userguide/eng-image/multistage-build/
[1]:https://twitter.com/alexellisuk
[2]:http://blog.alexellis.io/mutli-stage-docker-builds/
