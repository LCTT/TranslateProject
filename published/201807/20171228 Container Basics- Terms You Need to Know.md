容器基础知识：你需要知道的术语
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/containers-krissia-cruz.jpg?itok=-TNPqdcp)

[在前一篇文章中][1]，我们谈到了<ruby>容器<rt>container</rt></ruby>是什么以及它是如何培育创新并助力企业快速发展的。在以后的文章中，我们将讨论如何使用容器。然而，在深入探讨这个话题之前，我们需要了解关于容器的一些术语和命令。掌握了这些术语，才不至于产生混淆。

让我们来探讨 [Docker][2] 容器世界中使用的一些基本术语吧。

<ruby>容器<rt>Container</rt></ruby>：到底什么是容器呢？它是一个 Docker <ruby>镜像<rt>image</rt></ruby>的运行实例。它包含一个 Docker 镜像、执行环境和说明。它与系统完全隔离，所以可以在系统上运行多个容器，并且完全无视对方的存在。你可以从同一镜像中复制出多个容器，并在需求较高时扩展服务，在需求低时对这些容器进行缩减。

Docker <ruby>镜像<rt>Image</rt></ruby>：这与你下载的 Linux 发行版的镜像别无二致。它是一个安装包，包含了用于创建、部署和执行容器的一系列依赖关系和信息。你可以在几秒钟内创建任意数量的完全相同的容器。镜像是分层叠加的。一旦镜像被创建出来，是不能更改的。如果你想对容器进行更改，则只需创建一个新的镜像并从该镜像部署新的容器即可。

<ruby>仓库<rt>Repository</rt></ruby>（repo）：Linux 的用户对于仓库这个术语一定不陌生吧。它是一个软件库，存储了可下载并安装在系统中的软件包。在 Docker 容器中，唯一的区别是它管理的是通过标签分类的 Docker 镜像。你可以找到同一个应用程序的不同版本或不同变体，他们都有适当的标记。

<ruby>镜像管理服务<rt>Registry</rt></ruby>：可以将其想象成 GitHub。这是一个在线服务，管理并提供了对 Docker 镜像仓库的访问，例如默认的公共镜像仓库——DockerHub。供应商可以将他们的镜像库上传到 DockerHub 上，以便他们的客户下载和使用官方镜像。一些公司为他们的镜像提供自己的服务。镜像管理服务不必由第三方机构来运行和管理。组织机构可以使用预置的服务来管理内部范围的镜像库访问。

<ruby>标签<rt>Tag</rt></ruby>：当你创建 Docker 镜像时，可以给它添加一个合适的标签，以便轻松识别不同的变体或版本。这与你在任何软件包中看到的并无区别。Docker 镜像在添加到镜像仓库时被标记。

现在你已经掌握了基本知识，下一个阶段是理解实际使用 Docker 容器时用到的术语。

**Dockerfile** ：这是一个文本文件，包含为了为构建 Docker 镜像需手动执行的命令。Docker 使用这些指令自动构建镜像。

<ruby>构建<rt>Build</rt></ruby>：这是从 Dockerfile 创建成镜像的过程。

<ruby>推送<rt>Push</rt></ruby>：一旦镜像创建完成，“push” 是将镜像发布到仓库的过程。该术语也是我们下一篇文章要学习的命令之一。

<ruby>拉取<rt>Pull</rt></ruby>：用户可以通过 “pull” 过程从仓库检索该镜像。

<ruby>编组<rt>Compose</rt></ruby>：复杂的应用程序会包含多个容器。docker-compose 是一个用于运行多容器应用程序的命令行工具。它允许你用单条命令运行一个多容器的应用程序，简化了多容器带来的问题。

### 总结

容器术语的范围很广泛，这里是经常遇到的一些基本术语。下一次当你看到这些术语时，你会确切地知道它们的含义。在下一篇文章中，我们将开始使用 Docker 容器。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2017/12/container-basics-terms-you-need-know

作者：[Swapnil Bhartiya][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://linux.cn/article-9468-1.html
[2]:https://www.docker.com/
