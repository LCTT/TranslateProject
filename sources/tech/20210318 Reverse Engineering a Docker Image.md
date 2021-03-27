[#]: subject: (Reverse Engineering a Docker Image)
[#]: via: (https://theartofmachinery.com/2021/03/18/reverse_engineering_a_docker_image.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Reverse Engineering a Docker Image
======

This started with a consulting snafu: Government organisation A got government organisation B to develop a web application. Government organisation B subcontracted part of the work to somebody. Hosting and maintenance of the project was later contracted out to a private-sector company C. Company C discovered that the subcontracted somebody (who was long gone) had built a custom Docker image and made it a dependency of the build system, but without committing the original Dockerfile. That left company C with a contractual obligation to manage a Docker image they had no source code for. Company C calls me in once in a while to do various things, so doing something about this mystery meat Docker image became my job.

Fortunately, the Docker image format is a lot more transparent than it could be. A little detective work is needed, but a lot can be figured out just by pulling apart an image file. As an example, here’s a quick walkthrough of an image for [the Prettier code formatter][1].

First let’s get the Docker daemon to pull the image, then extract the image to a file:

```
docker pull tmknom/prettier:2.0.5
docker save tmknom/prettier:2.0.5 > prettier.tar
```

Yes, the file is just an archive in the classic tarball format:

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

As you can see, Docker uses hashes a lot for naming things. Let’s have a look at the `manifest.json`. It’s in hard-to-read compacted JSON, but the [`jq` JSON Swiss Army knife][2] can pretty print it for us:

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

Note that the three layers correspond to the three hash-named directories. We’ll look at them later. For now, let’s look at the JSON file pointed to by the `Config` key. It’s a little long, so I’ll just dump the first bit here:

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

The most interesting part is the `history` list, which lists every single layer in the image. A Docker image is a stack of these layers. Almost every statement in a Dockerfile turns into a layer that describes the changes to the image made by that statement. If you have a `RUN script.sh` statement that creates `really_big_file` that you then delete with `RUN rm really_big_file`, you actually get two layers in the Docker image: one that contains `really_big_file`, and one that contains a `.wh.really_big_file` tombstone to cancel it out. The overall image file isn’t any smaller. That’s why you often see Dockerfile statements chained together like `RUN script.sh && rm really_big_file` — it ensures all changes are coalesced into one layer.

Here are all the layers recorded in the Docker image. Notice that most layers don’t change the filesystem image and are marked `"empty_layer": true`. Only three are non-empty, which matches up with what we saw before.

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

Fantastic! All the statements are right there in the `created_by` fields, so we can almost reconstruct the Dockerfile just from this. Almost. The `ADD` statement at the very top doesn’t actually give us the file we need to `ADD`. `COPY` statements are also going to be opaque. We also lose `FROM` statements because they expand out to all the layers inherited from the base Docker image.

We can group the layers by Dockerfile by looking at the timestamps. Most layer timestamps are under a minute apart, representing how long each layer took to build. However, the first two layers are from `2020-04-24`, and the rest of the layers are from `2020-04-29`. This would be because the first two layers are from a base Docker image. Ideally we’d figure out a `FROM` statement that gets us that image, so that we have a maintainable Dockerfile.

The `manifest.json` says that the first non-empty layer is `a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/layer.tar`. Let’s take a look:

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

Okay, that looks like it might be an operating system base image, which is what you’d expect from a typical Dockerfile. There are 488 entries in the tarball, and if you scroll through them, some interesting ones stand out:

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

Sure enough, it’s an [Alpine][3] image, which you might have guessed if you noticed that the other layers used an `apk` command to install packages. Let’s extract the tarball and look around:

```
$ mkdir files
$ cd files
$ tar xf ../layer.tar
$ ls
bin  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
$ cat etc/alpine-release
3.11.6
```

If you pull `alpine:3.11.6` and extract it, you’ll find that there’s one non-empty layer inside it, and the `layer.tar` is identical to the `layer.tar` in the base layer of the Prettier image.

Just for the heck of it, what’s in the other two non-empty layers? The second layer is the main layer containing the Prettier installation. It has 528 entries, including Prettier, a bunch of dependencies and certificate updates:

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

The third layer is created by the `WORKDIR /work` statement, and it contains exactly one entry:

```
$ tar tf 6c37da2ee7de579a0bf5495df32ba3e7807b0a42e2a02779206d165f55f1ba70/layer.tar
work/
```

[The original Dockerfile is in the Prettier git repo.][4]

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2021/03/18/reverse_engineering_a_docker_image.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://github.com/tmknom/prettier
[2]: https://stedolan.github.io/jq/
[3]: https://www.alpinelinux.org/
[4]: https://github.com/tmknom/prettier/blob/35d2587ec052e880d73f73547f1ffc2b11e29597/Dockerfile
