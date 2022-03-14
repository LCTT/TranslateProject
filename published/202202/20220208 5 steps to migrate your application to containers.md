[#]: subject: "5 steps to migrate your application to containers"
[#]: via: "https://opensource.com/article/22/2/migrate-application-containers"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14273-1.html"

将应用程序迁移到容器的 5 个步骤
======

> 如果你是容器的新手，不要被那些术语所吓倒。这些关键原则将帮助你把应用迁移到云中。

![](https://img.linux.net.cn/data/attachment/album/202202/14/224455i7wz95yiq9hxltw2.jpg)

一般来说，人们想使用你的应用程序这是一件好事。然而，当应用程序在服务器上运行时，应用程序受欢迎是有代价的。随着用户对资源需求的增加，在某些时候，你可能会发现你需要扩展你的应用程序。一种选择是在这种情况下增加更多的服务器，建立一个像 Nginx 这样的 [负载平衡器][2]，以满足需求。但是，这种方法的成本可能很昂贵，因为当需求低的时候，在没有流量的服务器上运行你的应用程序的实例并不会节省资源。容器的优点是它是非持久的，在有需求时启动新实例，而随着需求的减少逐渐消失。如果这听起来像是你需要的功能，那么现在可能是将你的应用程序迁移到容器的时候了。

将应用程序迁移到容器中，很快就会变得迷失方向。虽然容器内的环境可能感觉很熟悉，但许多容器镜像是最小化的，而且它们被设计为无状态的。不过在某种程度上，这也是容器的优势之一。就像 Python 虚拟环境一样，它是一块白板，可以让你构建（或重建）你的应用程序，而没有许多其他环境所提供的无形的默认值。

每一次向云服务的迁移都是独一无二的，但在将你的应用程序移植到容器之前，你应该注意以下几个重要原则。

### 1、理解你的依赖关系

将你的应用程序移植到容器中是一个很好的机会，可以了解你的应用程序实际依赖的东西。由于除了最基本的系统组件外，很少有默认安装的组件，你的应用程序一开始不太可能在容器中运行。

在重构之前，确定你的依赖关系。首先，在你的源代码中用 `grep` 查找 `include`、`import`、`require`、`use` 或你选择的语言中用来声明依赖关系的任何关键词。

```
$ find ~/Code/myproject -type f \
    -iname ".java" \
    -exec grep import {} \;
```

不过，仅仅识别你使用的特定语言的库可能是不够的。审计依赖关系，这样你就能知道是否有语言本身运行所需的低级库，或者特定的模块以预期的功能运行。

### 2、评估你的数据存储

容器是无状态的，当一个容器崩溃或停止运行时，该容器的实例就永远消失了。如果你要在该容器中保存数据，这些数据也会消失。如果你的应用程序存储用户数据，所有的存储必须发生在容器之外，在你的应用程序的实例可以访问的某个位置。

你可以使用映射到容器内某个位置的本地存储来存储简单的应用程序配置文件。这是一种常见的技术，适用于需要管理员提供简单配置值的 Web 应用程序，如管理员的电子邮件地址、网站标题等。比如说：

```
$ podman run \
    --volume /local/data:/storage:Z \
    mycontainer
```

然而，你可以配置一个数据库，如 MariaDB 或 PostgreSQL，将大量数据在几个容器中的共享存储。对于私人信息，如密码，[你可以配置一个机密存储][3]。

对于你需要如何重构你的代码，相应地调整存储位置，这可能意味着改变路径到新的容器存储映射，移植到不同的数据库，甚至是纳入容器特定的模块。

### 3、准备好你的 Git 仓库

容器在构建时通常会从 Git 仓库中拉取源代码。一旦你的 Git 仓库成为你的应用程序的生产就绪代码的标准来源，你必须有一个管理 Git 仓库的计划。要有一个发布分支或生产分支，并考虑使用 [Git 钩子][5] 来拒绝意外的未经批准的提交。

### 4、了解你的构建系统

容器化应用程序可能没有传统的发布周期。当容器被构建时，它们会被从 Git 中拉取出来。你可以启动任何数量的构建系统作为容器构建的一部分，但这可能意味着调整你的构建系统，使其比过去更加自动化。你应该重构你的构建过程，使你完全有信心它能在无人值守的情况下工作。

### 5、构建镜像

构建镜像不一定是复杂的任务。你可以使用 [现有的容器镜像][6] 作为基础，用一个简单的 Docker 文件对其进行调整。另外，你也可以使用 [Buildah][7] 从头开始构建你自己的镜像。

在某种程度上，构建容器的过程与实际重构代码一样，都是开发的一部分。容器的构建是为了获取、组装和执行你的应用程序，所以这个过程必须是自动化的、健壮的。建立一个好的镜像，就为你的应用程序建立了一个坚实可靠的基础。

### 容器化

如果你是容器的新手，不要被这些术语所吓倒。容器只是另一种环境。容器化开发的感知约束实际上可以帮助你专注于你的应用程序，并更好地了解它是如何运行的、它需要什么才能可靠地运行，以及当出错时有哪些潜在的风险。相反，这导致系统管理员在安装和运行你的应用程序时受到的限制要少得多，因为从本质上讲，容器是一个受控的环境。仔细审查你的代码，了解你的应用程序需要什么，并相应地重构它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/migrate-application-containers

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/business_clouds.png?itok=IRsi1qOF (A person holding on to clouds that look like balloons)
[2]: https://opensource.com/article/21/4/load-balancing
[3]: https://www.redhat.com/sysadmin/new-podman-secrets-command
[4]: https://opensource.com/downloads/mariadb-mysql-cheat-sheet
[5]: http://redhat.com/sysadmin/git-hooks
[6]: https://www.redhat.com/sysadmin/top-container-images
[7]: https://opensource.com/article/22/1/build-your-own-container-scratch
