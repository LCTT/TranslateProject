怎么去使用 Ansible Container 去管理 Linux 容器
============================================================

### Ansible Container 处理 Dockerfile 的不足和对容器化项目提供完整的管理。

![Ansible Container: A new way to manage containers](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/container-ship.png?itok=pqZYgQ7K "Ansible Container: A new way to manage containers")
Image by : opensource.com

我喜欢容器，并且每天都使用这个技术。在过去几个月，在一组项目中已经解决了我遇到的问题，即便如此，容器并不完美。

我刚开始时，用 [Docker][11] 使用容器，因为这个项目使这个技术非常流行。除此之外，使用这个容器引擎，我学到了怎么去使用 **[docker-compose][6]** 以及怎么去用它管理我的项目。使用它使我的生产力猛增！一个命令去运行我的项目，而不管它有多复杂。因此，我太高兴了。

使用一段时间之后，我发现了一些问题。最明显的问题是创建窗口镜像的过程。Docker 工具使用一个定制的文件格式作为一个 Recipe 去制作容器镜像 — Dockerfiles。这个格式很容易学会，并且很短的一段时间之后，你就可以为你自己制作容器镜像了。但是，一旦你希望去掌握最佳实践或者有复杂场景的想法，问题就会出现。

Ansible 的更多资源

*   [Ansible 是怎么工作的][1]

*   [免费的 Ansible 电子书][2]

*   [Ansible 快速上手视频][3]

*   [下载和安装 Ansible][4]

让我们先休息一会儿，先去了解一个不同的东西：[Ansible][22] 的世界。你知道它吗？它棒极了，是吗？你不这么认为？好吧，是时候去学习一些新事物了。Ansible 是一个项目，它允许你通过写一些任务去管理你的基础设施，并在你选择的环境中运行它们。不需要去安装和设置任何的服务；你可以从你的笔记本电脑中去很很容易地做任何事情。许多人已经接受 Ansible 了。

想像一下这样的场景：你在 Ansible 中，你写了很多的 Ansible 角色和 playbooks，你可以用它们去管理你的基础设施，并且想把它们运用到容器中。你应该怎么做？开始通过 shell 脚本和 Dockerfiles 去写容器镜像定义？听起来好像不对。

来自 Ansible 开发团队的一些人问到这个问题，并且它们意识到，人们每天使用那些同样的 Ansible 角色和 playbooks 也可以用来制作容器镜像。但是 Ansible 能做到的不止这些 — 它可以被用于去管理容器化项目的完整的生命周期。从这些想法中，[Ansible Container][12] 项目诞生了。它使用已有的可以变成容器镜像的 Ansible 角色，甚至可以被用于应用程序在生产系统中从构建到部署的完整生命周期。

现在让我们讨论一下，在 Dockerfiles 环境中关于最佳实践时可能存在的问题。这里有一个警告：这将是非常具体且技术性的。出现最多的三个问题有：

### 1\. 在 Dockerfiles 中内嵌的 Shell 脚本。

当写 Dockerfiles 时，你可以通过 **/bin/sh -c** 解释指定的脚本。它可以做类似这样的事情：

```
RUN dnf install -y nginx
```

RUN 处是一个 Dockerfile 指令并且其它的都是参数（它传递给 shell）。但是，想像一个更复杂的场景：

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

这仅是从 [the official golang image][13] 中拿来的一个。它看起来并不好看，是不是？

### 2\. 你解析 Dockerfiles 并不容易。

Dockerfiles 是一个没有正式规范的新格式。如果你需要在你的基础设施（比如，让构建过程自动化一点）中去处理 Dockerfiles 将会很复杂。仅有的规划是 [这个代码][14]，它是 **dockerd** 的一部分。问题是你不能使用它作为一个库（library）。最容易的解决方案是你自己写一个解析器，然后祈祷它运行的很好。使用一些众所周知的标记语言不是更好吗？比如，YAML 或者 JSON。

### 3\. 管理困难。

如果你熟悉容器镜像的内部结构，你可能知道每个镜像是由层（layers）构成的。一旦容器被创建，这些层就使用联合文件系统技术堆叠在一起（像煎饼一样）。问题是，你并不能显式地管理这些层 — 你不能说，“这儿开始一个新层”，你被迫使用一种可读性不好的方法去改变你的 Dockerfile。最大的问题是，必须遵循一套最佳实践以去达到最优结果 — 新来的人在这个地方可能很困难。

### Ansible 语言和 Dockerfiles 比较

相比 Ansible，Dockerfiles 的最大缺点，也是 Ansible 的优点，作为一个语言，Ansible 更强大。例如，Dockerfiles 没有直接的变量概念，而 Ansible 有一个完整的模板系统（变量只是它其中的一个特性）。Ansible 包含了很多更易于使用的模块，比如，[**wait_for**][15]，它可以被用于服务就绪检查，比如，在处理之前等待服务准备就绪。在 Dockerfiles 中，做任何事情都通过一个 shell 脚本。因此，如果你想去找出已准备好的服务，它必须使用 shell（或者独立安装）去做。使用 shell 脚本的其它问题是，它会变得很复杂，维护成为一种负担。很多人已经找到了这个问题，并将这些 shell 脚本转到 Ansible。

如果你对这个主题感兴趣，并且想去了解更多内容，请访问 [Open Source Summit][16]，在 Prague 去看 [我的演讲][17]，时间是 10 月 23 日，星期一，4:20 p.m. 在 Palmovka room 中。

 _看更多的 Tomas Tomecek  演讲，[从 Dockerfiles 到 Ansible Container][7]，在 [Open Source Summit EU][8]，它将在 10 月 23-26 日在 Prague 召开。_ 



### 关于作者

 [![human](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/ja.jpeg?itok=4ATUEAbd)][18] Tomas Tomecek - 工程师、Hacker、演讲者、Tinker、Red Hatter。喜欢容器、linux、开源软件、python 3、rust、zsh、tmux。[More about me][9]

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/dockerfiles-ansible-container

作者：[Tomas Tomecek][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

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


