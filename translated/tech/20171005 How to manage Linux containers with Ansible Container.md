用 Ansible Container 去管理 Linux 容器
============================================================

> Ansible Container 解决了 Dockerfile 的不足，并对容器化项目提供了完整的管理。

![Ansible Container: A new way to manage containers](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/container-ship.png?itok=pqZYgQ7K "Ansible Container: A new way to manage containers")

Image by : opensource.com

我喜欢容器，并且每天都使用这个技术。即便如此，容器并不完美。不过，在过去几个月里，一系列项目已经解决了我遇到的一些问题。

我刚开始时，用 [Docker][11] 使用容器，这个项目使得这种技术非常流行。除了使用这个容器引擎之外，我学到了怎么去使用 [docker-compose][6] 以及怎么去用它管理我的项目。使用它使得我的生产力猛增！一个命令就可以运行我的项目，而不管它有多复杂。因此，我太高兴了。

使用一段时间之后，我发现了一些问题。最明显的问题是创建容器镜像的过程。Docker 工具使用一个定制的文件格式作为生成容器镜像的依据：Dockerfile。这个格式易于学习，并且很短的一段时间之后，你就可以自己制作容器镜像了。但是，一旦你希望进一步掌握它或者考虑到复杂场景，问题就会出现。

让我们打断一下，先去了解一个不同的东西：[Ansible][22] 的世界。你知道它吗？它棒极了，是吗？你不这么认为？好吧，是时候去学习一些新事物了。Ansible 是一个允许你通过写一些任务去管理你的基础设施，并在你选择的环境中运行它们的项目。不需要去安装和设置任何的服务；你可以从你的笔记本电脑中很容易地做任何事情。许多人已经接受 Ansible 了。

想像一下这样的场景：你在 Ansible 中，你写了很多的 Ansible <ruby>角色<rt>role</rt></ruby>和<ruby>剧本<rt>playbook</rt></ruby>，你可以用它们去管理你的基础设施，并且你想把它们运用到容器中。你应该怎么做？通过 shell 脚本和 Dockerfile 去写容器镜像定义？听起来好像不对。

来自 Ansible 开发团队的一些人问到这个问题，并且他们意识到，人们每天编写和使用的那些同样的 Ansible 角色和剧本也可以用来制作容器镜像。但是 Ansible 能做到的不止这些 —— 它可以被用于去管理容器化项目的完整生命周期。从这些想法中，[Ansible Container][12] 项目诞生了。它利用已有的 Ansible 角色转变成容器镜像，甚至还可以被用于生产环境中从构建到部署的完整生命周期。

现在让我们讨论一下，我之前提到过的在 Dockerfile 环境中的最佳实践问题。这里有一个警告：这将是非常具体且技术性的。出现最多的三个问题有：

### 1、 在 Dockerfile 中内嵌的 Shell 脚本

当写 Dockerfile 时，你可以指定会由 `/bin/sh -c` 解释执行的脚本。它类似如下：

```
RUN dnf install -y nginx
```

这里 `RUN` 是一个 Dockerfile 指令，其它的都是参数（它们传递给 shell）。但是，想像一个更复杂的场景：

```
RUN set -eux; \
    \
# this "case" statement is generated via "update.sh"
    %%ARCH-CASE%%; \
    \
    url="https://golang.org/dl/go${GOLANG_VERSION}.${goRelArch}.tar.gz"; \
    wget -O go.tgz "$url"; \
    echo "${goRelSha256} *go.tgz" | sha256sum -c -; \
```

这仅是从 [golang 官方镜像][13] 中拿来的一段。它看起来并不好看，是不是？

### 2、 解析 Dockerfile 并不容易

Dockerfile 是一个没有正式规范的新格式。如果你需要在你的基础设施（比如，让构建过程自动化一点）中去处理 Dockerfile 将会很复杂。仅有的规范是 [这个代码][14]，它是 **dockerd** 的一部分。问题是你不能使用它作为一个<ruby>库<rt>library</rt></ruby>来使用。最容易的解决方案是你自己写一个解析器，然后祈祷它运行的很好。使用一些众所周知的标记语言不是更好吗？比如，YAML 或者 JSON。

### 3、 管理困难

如果你熟悉容器镜像的内部结构，你可能知道每个镜像是由<ruby>层<rt>layer</rt></ruby>构成的。一旦容器被创建，这些层就使用联合文件系统技术堆叠在一起（像煎饼一样）。问题是，你并不能显式地管理这些层 — 你不能说，“这儿开始一个新层”，你被迫使用一种可读性不好的方法去改变你的 Dockerfile。最大的问题是，必须遵循一套最佳实践以去达到最优结果 — 新来的人在这个地方可能很困难。

### Ansible 语言和 Dockerfile 比较

相比 Ansible，Dockerfile 的最大缺点，也是 Ansible 的优点，作为一个语言，Ansible 更强大。例如，Dockerfile 没有直接的变量概念，而 Ansible 有一个完整的模板系统（变量只是它其中的一个特性）。Ansible 包含了很多更易于使用的模块，比如，[wait_for][15]，它可以被用于服务就绪检查，比如，在处理之前等待服务准备就绪。在 Dockerfile 中，做任何事情都通过一个 shell 脚本。因此，如果你想去找出已准备好的服务，它必须使用 shell（或者独立安装）去做。使用 shell 脚本的其它问题是，它会变得很复杂，维护成为一种负担。很多人已经发现了这个问题，并将这些 shell 脚本转到 Ansible。

### 关于作者

 [![human](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/ja.jpeg?itok=4ATUEAbd)][18] 
 
Tomas Tomecek - 工程师、Hacker、演讲者、Tinker、Red Hatter。喜欢容器、linux、开源软件、python 3、rust、zsh、tmux。[More about me][9]

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/dockerfiles-ansible-container

作者：[Tomas Tomecek][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tomastomecek
[1]:https://www.ansible.com/how-ansible-works?intcmp=701f2000000h4RcAAI
[2]:https://www.ansible.com/ebooks?intcmp=701f2000000h4RcAAI
[3]:https://www.ansible.com/quick-start-video?intcmp=701f2000000h4RcAAI
[4]:https://docs.ansible.com/ansible/latest/intro_installation.html?intcmp=701f2000000h4RcAAI
[5]:https://opensource.com/article/17/10/dockerfiles-ansible-container?imm_mid=0f9013&cmp=em-webops-na-na-newsltr_20171201&rate=Wiw_0D6PK_CAjqatYu_YQH0t1sNHEF6q09_9u3sYkCY
[6]:https://github.com/docker/compose
[7]:http://sched.co/BxIW
[8]:http://events.linuxfoundation.org/events/open-source-summit-europe
[9]:https://opensource.com/users/tomastomecek
[10]:https://opensource.com/user/175651/feed
[11]:https://opensource.com/tags/docker
[12]:https://www.ansible.com/ansible-container
[13]:https://github.com/docker-library/golang/blob/master/Dockerfile-debian.template#L14
[14]:https://github.com/moby/moby/tree/master/builder/dockerfile
[15]:http://docs.ansible.com/wait_for_module.html
[16]:http://events.linuxfoundation.org/events/open-source-summit-europe
[17]:http://events.linuxfoundation.org/events/open-source-summit-europe/program/schedule
[18]:https://opensource.com/users/tomastomecek
[19]:https://opensource.com/users/tomastomecek
[20]:https://opensource.com/users/tomastomecek
[21]:https://opensource.com/article/17/10/dockerfiles-ansible-container?imm_mid=0f9013&cmp=em-webops-na-na-newsltr_20171201#comments
[22]:https://opensource.com/tags/ansible
[23]:https://opensource.com/tags/containers
[24]:https://opensource.com/tags/ansible
[25]:https://opensource.com/tags/docker
[26]:https://opensource.com/tags/open-source-summit


