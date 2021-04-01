[#]: subject: (Reverse Engineering a Docker Image)
[#]: via: (https://theartofmachinery.com/2021/03/18/reverse_engineering_a_docker_image.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13258-1.html)

一次 Docker 镜像的逆向工程
======

![](https://img.linux.net.cn/data/attachment/album/202104/01/215523oajrgjo77irb7nun.jpg)

这要从一次咨询的失误说起：政府组织 A 让政府组织 B 开发一个 Web 应用程序。政府机构 B 把部分工作外包给某个人。后来，项目的托管和维护被外包给一家私人公司 C。C 公司发现，之前外包的人（已经离开很久了）构建了一个自定义的 Docker 镜像，并将其成为系统构建的依赖项，但这个人没有提交原始的 Dockerfile。C 公司有合同义务管理这个 Docker 镜像，可是他们他们没有源代码。C 公司偶尔叫我进去做各种工作，所以处理一些关于这个神秘 Docker 镜像的事情就成了我的工作。

幸运的是，Docker 镜像的格式比想象的透明多了。虽然还需要做一些侦查工作，但只要解剖一个镜像文件，就能发现很多东西。例如，这里有一个 [Prettier 代码格式化][1] 的镜像可供快速浏览。

首先，让 Docker <ruby>守护进程<rt>daemon</rt></ruby>拉取镜像，然后将镜像提取到文件中：

```
docker pull tmknom/prettier:2.0.5
docker save tmknom/prettier:2.0.5 > prettier.tar
```

是的，该文件只是一个典型 tarball 格式的归档文件：

```
$ tar xvf prettier.tar
6c37da2ee7de579a0bf5495df32ba3e7807b0a42e2a02779206d165f55f1ba70/
6c37da2ee7de579a0bf5495df32ba3e7807b0a42e2a02779206d165f55f1ba70/VERSION
6c37da2ee7de579a0bf5495df32ba3e7807b0a42e2a02779206d165f55f1ba70/json
6c37da2ee7de579a0bf5495df32ba3e7807b0a42e2a02779206d165f55f1ba70/layer.tar
88f38be28f05f38dba94ce0c1328ebe2b963b65848ab96594f8172a9c3b0f25b.json
a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/
a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/VERSION
a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/json
a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/layer.tar
d4f612de5397f1fc91272cfbad245b89eac8fa4ad9f0fc10a40ffbb54a356cb4/
d4f612de5397f1fc91272cfbad245b89eac8fa4ad9f0fc10a40ffbb54a356cb4/VERSION
d4f612de5397f1fc91272cfbad245b89eac8fa4ad9f0fc10a40ffbb54a356cb4/json
d4f612de5397f1fc91272cfbad245b89eac8fa4ad9f0fc10a40ffbb54a356cb4/layer.tar
manifest.json
repositories
```

如你所见，Docker 在命名时经常使用<ruby>哈希<rt>hash</rt></ruby>。我们看看 `manifest.json`。它是以难以阅读的压缩 JSON 写的，不过 [JSON 瑞士军刀 jq][2] 可以很好地打印 JSON：

```
$ jq . manifest.json
[
  {
    "Config": "88f38be28f05f38dba94ce0c1328ebe2b963b65848ab96594f8172a9c3b0f25b.json",
    "RepoTags": [
      "tmknom/prettier:2.0.5"
    ],
    "Layers": [
      "a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/layer.tar",
      "d4f612de5397f1fc91272cfbad245b89eac8fa4ad9f0fc10a40ffbb54a356cb4/layer.tar",
      "6c37da2ee7de579a0bf5495df32ba3e7807b0a42e2a02779206d165f55f1ba70/layer.tar"
    ]
  }
]
```

请注意，这三个<ruby>层<rt>Layer</rt></ruby>对应三个以哈希命名的目录。我们以后再看。现在，让我们看看 `Config` 键指向的 JSON 文件。它有点长，所以我只在这里转储第一部分：

```
$ jq . 88f38be28f05f38dba94ce0c1328ebe2b963b65848ab96594f8172a9c3b0f25b.json | head -n 20
{
  "architecture": "amd64",
  "config": {
    "Hostname": "",
    "Domainname": "",
    "User": "",
    "AttachStdin": false,
    "AttachStdout": false,
    "AttachStderr": false,
    "Tty": false,
    "OpenStdin": false,
    "StdinOnce": false,
    "Env": [
      "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    ],
    "Cmd": [
      "--help"
    ],
    "ArgsEscaped": true,
    "Image": "sha256:93e72874b338c1e0734025e1d8ebe259d4f16265dc2840f88c4c754e1c01ba0a",
```

最重要的是 `history` 列表，它列出了镜像中的每一层。Docker 镜像由这些层堆叠而成。Dockerfile 中几乎每条命令都会变成一个层，描述该命令对镜像所做的更改。如果你执行 `RUN script.sh` 命令创建了 `really_big_file`，然后用 `RUN rm really_big_file` 命令删除文件，Docker 镜像实际生成两层：一个包含 `really_big_file`，一个包含 `.wh.really_big_file` 记录来删除它。整个镜像文件大小不变。这就是为什么你会经常看到像 `RUN script.sh && rm really_big_file` 这样的 Dockerfile 命令链接在一起——它保障所有更改都合并到一层中。

以下是该 Docker 镜像中记录的所有层。注意，大多数层不改变文件系统镜像，并且 `empty_layer` 标记为 `true`。以下只有三个层是非空的，与我们之前描述的相符。

```
$ jq .history 88f38be28f05f38dba94ce0c1328ebe2b963b65848ab96594f8172a9c3b0f25b.json
[
  {
    "created": "2020-04-24T01:05:03.608058404Z",
    "created_by": "/bin/sh -c #(nop) ADD file:b91adb67b670d3a6ff9463e48b7def903ed516be66fc4282d22c53e41512be49 in / "
  },
  {
    "created": "2020-04-24T01:05:03.92860976Z",
    "created_by": "/bin/sh -c #(nop)  CMD [\"/bin/sh\"]",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:06.617130538Z",
    "created_by": "/bin/sh -c #(nop)  ARG BUILD_DATE",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:07.020521808Z",
    "created_by": "/bin/sh -c #(nop)  ARG VCS_REF",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:07.36915054Z",
    "created_by": "/bin/sh -c #(nop)  ARG VERSION",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:07.708820086Z",
    "created_by": "/bin/sh -c #(nop)  ARG REPO_NAME",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:08.06429638Z",
    "created_by": "/bin/sh -c #(nop)  LABEL org.label-schema.vendor=tmknom org.label-schema.name=tmknom/prettier org.label-schema.description=Prettier is an opinionated code formatter. org.label-schema.build-date=2020-04-29T06:34:01Z org
.label-schema.version=2.0.5 org.label-schema.vcs-ref=35d2587 org.label-schema.vcs-url=https://github.com/tmknom/prettier org.label-schema.usage=https://github.com/tmknom/prettier/blob/master/README.md#usage org.label-schema.docker.cmd=do
cker run --rm -v $PWD:/work tmknom/prettier --parser=markdown --write '**/*.md' org.label-schema.schema-version=1.0",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:08.511269907Z",
    "created_by": "/bin/sh -c #(nop)  ARG NODEJS_VERSION=12.15.0-r1",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:08.775876657Z",
    "created_by": "/bin/sh -c #(nop)  ARG PRETTIER_VERSION",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:26.399622951Z",
    "created_by": "|6 BUILD_DATE=2020-04-29T06:34:01Z NODEJS_VERSION=12.15.0-r1 PRETTIER_VERSION=2.0.5 REPO_NAME=tmknom/prettier VCS_REF=35d2587 VERSION=2.0.5 /bin/sh -c set -x &&     apk add --no-cache nodejs=${NODEJS_VERSION} nodejs-np
m=${NODEJS_VERSION} &&     npm install -g prettier@${PRETTIER_VERSION} &&     npm cache clean --force &&     apk del nodejs-npm"
  },
  {
    "created": "2020-04-29T06:34:26.764034848Z",
    "created_by": "/bin/sh -c #(nop) WORKDIR /work"
  },
  {
    "created": "2020-04-29T06:34:27.092671047Z",
    "created_by": "/bin/sh -c #(nop)  ENTRYPOINT [\"/usr/bin/prettier\"]",
    "empty_layer": true
  },
  {
    "created": "2020-04-29T06:34:27.406606712Z",
    "created_by": "/bin/sh -c #(nop)  CMD [\"--help\"]",
    "empty_layer": true
  }
]
```

太棒了！所有的命令都在 `created_by` 字段中，我们几乎可以用这些命令重建 Dockerfile。但不是完全可以。最上面的 `ADD` 命令实际上没有给我们需要添加的文件。`COPY` 命令也没有全部信息。我们还失去了 `FROM` 语句，因为它们扩展成了从基础 Docker 镜像继承的所有层。

我们可以通过查看<ruby>时间戳<rt>timestamp</rt></ruby>，按 Dockerfile 对层进行分组。大多数层的时间戳相差不到一分钟，代表每一层构建所需的时间。但是前两层是 `2020-04-24`，其余的是 `2020-04-29`。这是因为前两层来自一个基础 Docker 镜像。理想情况下，我们可以找出一个 `FROM` 命令来获得这个镜像，这样我们就有了一个可维护的 Dockerfile。

`manifest.json` 展示第一个非空层是 `a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/layer.tar`。让我们看看它：

```
$ cd a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/
$ tar tf layer.tf | head
bin/
bin/arch
bin/ash
bin/base64
bin/bbconfig
bin/busybox
bin/cat
bin/chgrp
bin/chmod
bin/chown
```

看起来它可能是一个<ruby>操作系统<rt>operating system</rt></ruby>基础镜像，这也是你期望从典型 Dockerfile 中看到的。Tarball 中有 488 个条目，如果你浏览一下，就会发现一些有趣的条目：

```
...
dev/
etc/
etc/alpine-release
etc/apk/
etc/apk/arch
etc/apk/keys/
etc/apk/keys/alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub
etc/apk/keys/alpine-devel@lists.alpinelinux.org-5243ef4b.rsa.pub
etc/apk/keys/alpine-devel@lists.alpinelinux.org-5261cecb.rsa.pub
etc/apk/protected_paths.d/
etc/apk/repositories
etc/apk/world
etc/conf.d/
...
```

果不其然，这是一个 [Alpine][3] 镜像，如果你注意到其他层使用 `apk` 命令安装软件包，你可能已经猜到了。让我们解压 tarball 看看：

```
$ mkdir files
$ cd files
$ tar xf ../layer.tar
$ ls
bin  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
$ cat etc/alpine-release
3.11.6
```

如果你拉取、解压 `alpine:3.11.6`，你会发现里面有一个非空层，`layer.tar` 与 Prettier 镜像基础层中的 `layer.tar` 是一样的。

出于兴趣，另外两个非空层是什么？第二层是包含 Prettier 安装包的主层。它有 528 个条目，包含 Prettier、一堆依赖项和证书更新：

```
...
usr/lib/libuv.so.1
usr/lib/libuv.so.1.0.0
usr/lib/node_modules/
usr/lib/node_modules/prettier/
usr/lib/node_modules/prettier/LICENSE
usr/lib/node_modules/prettier/README.md
usr/lib/node_modules/prettier/bin-prettier.js
usr/lib/node_modules/prettier/doc.js
usr/lib/node_modules/prettier/index.js
usr/lib/node_modules/prettier/package.json
usr/lib/node_modules/prettier/parser-angular.js
usr/lib/node_modules/prettier/parser-babel.js
usr/lib/node_modules/prettier/parser-flow.js
usr/lib/node_modules/prettier/parser-glimmer.js
usr/lib/node_modules/prettier/parser-graphql.js
usr/lib/node_modules/prettier/parser-html.js
usr/lib/node_modules/prettier/parser-markdown.js
usr/lib/node_modules/prettier/parser-postcss.js
usr/lib/node_modules/prettier/parser-typescript.js
usr/lib/node_modules/prettier/parser-yaml.js
usr/lib/node_modules/prettier/standalone.js
usr/lib/node_modules/prettier/third-party.js
usr/local/
usr/local/share/
usr/local/share/ca-certificates/
usr/sbin/
usr/sbin/update-ca-certificates
usr/share/
usr/share/ca-certificates/
usr/share/ca-certificates/mozilla/
usr/share/ca-certificates/mozilla/ACCVRAIZ1.crt
usr/share/ca-certificates/mozilla/AC_RAIZ_FNMT-RCM.crt
usr/share/ca-certificates/mozilla/Actalis_Authentication_Root_CA.crt
...
```

第三层由 `WORKDIR /work` 命令创建，它只包含一个条目：

```
$ tar tf 6c37da2ee7de579a0bf5495df32ba3e7807b0a42e2a02779206d165f55f1ba70/layer.tar
work/
```

[原始 Dockerfile 在 Prettier 的 git 仓库中][4]。

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2021/03/18/reverse_engineering_a_docker_image.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://github.com/tmknom/prettier
[2]: https://stedolan.github.io/jq/
[3]: https://www.alpinelinux.org/
[4]: https://github.com/tmknom/prettier/blob/35d2587ec052e880d73f73547f1ffc2b11e29597/Dockerfile
