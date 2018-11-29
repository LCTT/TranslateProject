Linux 开发的五大必备工具
======
> Linux 上的开发工具如此之多，以至于会担心找不到恰好适合你的。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/dev-tools.png?itok=kkDNylRg)

Linux 已经成为工作、娱乐和个人生活等多个领域的支柱，人们已经越来越离不开它。在 Linux 的帮助下，技术的变革速度超出了人们的想象，Linux 开发的速度也以指数规模增长。因此，越来越多的开发者也不断地加入开源和学习 Linux 开发地潮流当中。在这个过程之中，合适的工具是必不可少的，可喜的是，随着 Linux 的发展，大量适用于 Linux 的开发工具也不断成熟。甚至可以说，这样的工具已经多得有点惊人。

为了选择更合适自己的开发工具，缩小选择范围是很必要的。但是这篇文章并不会要求你必须使用某个工具，而只是缩小到五个工具类别，然后对每个类别提供一个例子。然而，对于大多数类别，都会有不止一种选择。下面我们来看一下。

### 容器

放眼于现实，现在已经是容器的时代了。容器既及其容易部署，又可以方便地构建开发环境。如果你针对的是特定的平台的开发，将开发流程所需要的各种工具都创建到容器映像中是一种很好的方法，只要使用这一个容器映像，就能够快速启动大量运行所需服务的实例。

一个使用容器的最佳范例是使用 [Docker][1]，使用容器（或 Docker）有这些好处：

  * 开发环境保持一致
  * 部署后即可运行
  * 易于跨平台部署
  * Docker 映像适用于多种开发环境和语言
  * 部署单个容器或容器集群都并不繁琐

通过 [Docker Hub][2]，几乎可以找到适用于任何平台、任何开发环境、任何服务器、任何服务的映像，几乎可以满足任何一种需求。使用 Docker Hub 中的映像，就相当于免除了搭建开发环境的步骤，可以直接开始开发应用程序、服务器、API 或服务。

Docker 在所有 Linux 平台上都很容易安装，例如可以通过终端输入以下命令在 Ubuntu 上安装 Docker：

```
sudo apt-get install docker.io
```

Docker 安装完毕后，就可以从 Docker 仓库中拉取映像，然后开始开发和部署了（如下图）。

![Docker images][4]

*图 1： Docker 镜像准备部署*

### 版本控制工具

如果你正在开发一个大型项目，又或者参与团队开发，版本控制工具是必不可少的，它可以用于记录代码变更、提交代码以及合并代码。如果没有这样的工具，项目几乎无法妥善管理。在 Linux 系统上，[Git][6] 和 [GitHub][7] 的易用性和流行程度是其它版本控制工具无法比拟的。如果你对 Git 和 GitHub 还不太熟悉，可以简单理解为 Git 是在本地计算机上安装的版本控制系统，而 GitHub 则是用于上传和管理项目的远程存储库。 Git 可以安装在大多数的 Linux 发行版上。例如在基于 Debian 的系统上，只需要通过以下这一条简单的命令就可以安装：

```
sudo apt-get install git
```

安装完毕后，就可以使用 Git 来实施版本控制了（如下图）。

![Git installed][9]

*图 2：Git 已经安装，可以用于很多重要任务*

Github 会要求用户创建一个帐户。用户可以免费使用 GitHub 来管理非商用项目，当然也可以使用 GitHub 的付费模式（更多相关信息，可以参阅[价格矩阵][10]）。

### 文本编辑器

如果没有文本编辑器，在 Linux 上开发将会变得异常艰难。当然，文本编辑器之间孰优孰劣，具体还是要取决于开发者的需求。对于文本编辑器，有人可能会使用 vim、emacs 或 nano，也有人会使用带有 GUI 的编辑器。但由于重点在于开发，我们需要的是一种能够满足开发人员需求的工具。不过我首先要说，vim 对于开发人员来说确实是一个利器，但前提是要对 vim 非常熟悉，在这种前提下，vim 能够满足你的所有需求，甚至还能给你更好的体验。然而，对于一些开发者（尤其是刚开始接触 Linux 的新手）来说，这不仅难以帮助他们快速达成需求，甚至还会是一个需要逾越的障碍。考虑到这篇文章的目标是帮助 Linux 的新手（而不仅仅是为各种编辑器的死忠粉宣传他们拥护的编辑器），我更倾向于使用 GUI 编辑器。

就文本编辑器而论，选择 [Bluefish][11] 一般不会有错。 Bluefish 可以从大部分软件库中安装，它支持项目管理、远程文件多线程操作、搜索和替换、递归打开文件、侧边栏、集成 make/lint/weblint/xmllint、无限制撤销/重做、在线拼写检查、自动恢复、全屏编辑、语法高亮（如下图）、多种语言等等。

![Bluefish][13]

*图 3：运行在 Ubuntu 18.04 上的 Bluefish*

### IDE

<ruby>集成开发环境<rt>Integrated Development Environment</rt></ruby>（IDE）是包含一整套全面的工具、可以实现一站式功能的开发环境。 开发者除了可以使用 IDE 编写代码，还可以编写文档和构建软件。在 Linux 上也有很多适用的 IDE，其中 [Geany][14] 就包含在标准软件库中，它对用户非常友好，功能也相当强大。 Geany 具有语法高亮、代码折叠、自动完成，构建代码片段、自动关闭 XML 和 HTML 标签、调用提示、支持多种文件类型、符号列表、代码导航、构建编译，简单的项目管理和内置的插件系统等强大功能。

Geany 也能在系统上轻松安装，例如执行以下命令在基于 Debian 的 Linux 发行版上安装 Geany：

```
sudo apt-get install geany
```

安装完毕后，就可以快速上手这个易用且强大的 IDE 了（如下图）。

![Geany][16]

*图 4：Geany 可以作为你的 IDE*

### 文本比较工具

有时候会需要比较两个文件的内容来找到它们之间的不同之处，它们可能是同一文件的两个不同副本（有一个经过编译，而另一个没有）。这种情况下，你肯定不想要凭借肉眼来找出差异，而是想要使用像 [Meld][17] 这样的工具。 Meld 是针对开发者的文本比较和合并工具，可以使用 Meld 来发现两个文件之间的差异。虽然你可以使用命令行中的文本比较工具，但就效率而论，Meld 无疑更为优秀。

Meld 可以打开两个文件进行比较，并突出显示文件之间的差异之处。 Meld 还允许用户从两个文件的其中一方合并差异（下图显示了 Meld 同时打开两个文件）。

![Comparing two files][19]

*图 5： 以简单差异的模式比较两个文件*

Meld 也可以通过大多数标准的软件库安装，在基于 Debian 的系统上，执行以下命令就可以安装：

```
sudo apt-get install meld
```

### 高效地工作

以上提到的五个工具除了帮助你完成工作，而且有助于提高效率。尽管适用于 Linux 开发者的工具有很多，但对于以上几个类别，你最好分别使用一个对应的工具。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/8/5-essential-tools-linux-development

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.docker.com/
[2]:https://hub.docker.com/
[4]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_1.jpg?itok=V1Bsbkg9 "Docker images"
[6]:https://git-scm.com/
[7]:https://github.com/
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_2.jpg?itok=YJjhe4O6 "Git installed"
[10]:https://github.com/pricing
[11]:http://bluefish.openoffice.nl/index.html
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_3.jpg?itok=66A7Svme "Bluefish"
[14]:https://www.geany.org/
[16]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_4.jpg?itok=jRcA-0ue "Geany"
[17]:http://meldmerge.org/
[19]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_5.jpg?itok=eLkfM9oZ "Comparing two files"
[20]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

