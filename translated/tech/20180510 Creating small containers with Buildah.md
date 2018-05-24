使用 Buildah 创建小体积的容器
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open%20source_collaboration_0.png?itok=YEl_GXbv)
我最近加入了 Red Hat，在这之前我在另外一家科技公司工作了很多年。在我的上一份工作岗位上，我开发了不少不同类型的软件产品，这些产品是成功的，但都有版权保护。不仅法规限制了我们不能在公司外将软件共享，而且我们在公司内部也基本不进行共享。在那时，我觉得这很有道理：公司花费了时间、精力和预算用于开发软件，理应保护并要求软件涉及的利益。

时间如梭，去年我加入 Red Hat 并培养出一种完全不同的理念。[Buildah 项目][1]是我最早加入的项目之一，该项目用于构建 OCI (Open Container Initiative) 标准的镜像，特别擅长让你精简已创建镜像的体积。那时 Buildah 还处于非常早期的阶段，包含一些瑕疵，不适合用于生产环境。

刚接触项目不久，我做了一些小变更，然后询问公司内部 git 仓库地址，以便提交我做的变更。收到的回答是：没有内部仓库，直接将变更提交到 GitHub 上。这让我感到困惑，将我的变更提交到 GitHub 意味着：任何人都可以查看这部分代码并在他们自己的项目中使用。况且代码还有一些瑕疵，这样做简直有悖常理。但作为一个新人，我只是惊讶地摇了摇头并提交了变更。

一年后，我终于相信了开源软件的力量和价值。我仍为 Buildah 项目工作，我们最近遇到的一个主题很形象地说明了这种力量和价值。标题为 [Buildah 镜像体积并不小？][2] 的主题由 Tim Dudgeon (@tdudgeon) 提出。简而言之，他发现使用 Buildah 创建的镜像比使用 Docker 创建的镜像体积更大，而且 Buildah 镜像中并不包含一些额外应用，但 Docker 镜像中却包含它们。

为了比较，他首先操作如下：
```
$ docker pull centos:7
$ docker images
REPOSITORY            TAG              IMAGE ID                 CREATED             SIZE
docker.io/centos          7                   2d194b392dd1        2 weeks ago         195 MB
```

他发现 Docker 镜像的体积为 195MB。Tim 接着使用 Buildah 创建了一个（基于 scratch 的）最小化镜像，仅仅将 `coreutils` 和 `bash` 软件包加入到镜像中，使用的脚本如下：
```
$ cat  ./buildah-base.sh
#!/bin/bash

set -x

# build a minimal image
newcontainer=$(buildah from scratch)
scratchmnt=$(buildah mount $newcontainer)

# install the packages
yum install --installroot $scratchmnt bash coreutils --releasever 7 --setopt install_weak_deps=false -y
yum clean all -y --installroot $scratchmnt --releasever 7

sudo buildah config --cmd /bin/bash $newcontainer

# set some config info
buildah config --label name=centos-base $newcontainer

# commit the image
buildah unmount $newcontainer
buildah commit $newcontainer centos-base

$ sudo ./buildah-base.sh

$ sudo buildah images
IMAGE ID               IMAGE NAME                                             CREATED AT            SIZE
8379315d3e3e     docker.io/library/centos-base:latest           Mar 25, 2018 17:08   212.1 MB
```

Tim 想知道为何 Buildah 镜像体积反而大 17MB，毕竟 `python` 和 `yum` 软件包都没有安装到 Buildah 镜像中，而这些软件已经安装到 Docker 镜像中。这个结果并不符合预期，在 Github 的相关主题中引发了广泛的讨论。

不仅 Red Hat 的员工参与了讨论，还有不少公司外人士也加入了讨论，这很有意义。值得一提的是，GitHub 用户 @pixdrift 主导了很多重要的讨论并提出很多发现，他指出在 Buildah 镜像中文档和语言包就占据了比 100MB 略多一点的空间。Pixdrift 建议在 yum 安装器中强制指定语言，据此提出如下修改过的 `buildah-bash.sh` 脚本：
```
#!/bin/bash

set -x

# build a minimal image
newcontainer=$(buildah from scratch)
scratchmnt=$(buildah mount $newcontainer)

# install the packages
yum install --installroot $scratchmnt bash coreutils --releasever 7 --setopt=install_weak_deps=false --setopt=tsflags=nodocs --setopt=override_install_langs=en_US.utf8 -y
yum clean all -y --installroot $scratchmnt --releasever 7

sudo buildah config --cmd /bin/bash $newcontainer

# set some config info
buildah config --label name=centos-base $newcontainer

# commit the image
buildah unmount $newcontainer
buildah commit $newcontainer centos-base
```

Tim 运行这个新脚本，得到的镜像体积缩减至 92MB，相比之前的 Buildah 镜像体积减少了 120MB，这比较接近我们的预期；然而，c出于工程师的天性，56% 的体积缩减不能让他们满足。讨论继续深入下去，涉及如何移除个人语言包以节省更多空间。如果想了解讨论细节，点击 [Buildah 镜像体积并不小？][2] 链接。说不定你也能给出有帮助的点子，甚至更进一步成为 Buildah 项目的贡献者。这个主题的解决从一个侧面告诉我们，Buildah 软件可以多么快速和容易地创建体积最小化的容器，该容器仅包含你高效运行任务所需的软件。额外的好处是，你无需运行一个守护进程。

这个镜像体积缩减的主题让我意识到开源软件的力量。来自不同公司的大量开发者，在一天多的时间内，以开放讨论的形式进行合作解决问题。虽然解决这个具体问题并没有修改已有代码，但 Red Hat 公司外开发者对 Buildah 做了很多代码贡献，进而帮助项目变得更好。这些贡献也吸引了更多人才关注项目代码；如果像之前那样，代码作为版权保护软件的一部分放置在私有 git 仓库中，不会获得上述好处。我只用了一年的时间就转向拥抱 [开源方式][3]，而且可能不会再转回去了。

文章最初发表于 [Project Atomic][4]，已获得转载许可。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/containers-buildah

作者：[Tom Sweeney][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tomsweeneyredhat
[1]:https://github.com/projectatomic/buildah
[2]:https://github.com/projectatomic/buildah/issues/532
[3]:https://twitter.com/opensourceway
[4]:http://www.projectatomic.io/blog/2018/04/open-source-what-a-concept/
