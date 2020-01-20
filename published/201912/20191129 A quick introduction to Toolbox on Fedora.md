[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11651-1.html)
[#]: subject: (A quick introduction to Toolbox on Fedora)
[#]: via: (https://fedoramagazine.org/a-quick-introduction-to-toolbox-on-fedora/)
[#]: author: (Ryan Walter https://fedoramagazine.org/author/rwaltr/)

Fedora 中的 Toolbox 简介
======

![][1]

Toolbox 使你可以[在容器中分类和管理开发环境][2]，而无需 root 权限或手动添加卷。它创建一个容器，你可以在其中安装自己的命令行工具，而无需在基础系统中安装它们。当你没有 root 权限或无法直接安装程序时，也可以使用它。本文会介绍 Toolbox 及其功能。

### 安装 Toolbox

[Silverblue][3] 默认包含 Toolbox。对于 Workstation 和 Server 版本，你可以使用 `dnf install toolbox` 从默认仓库中获取它。

### 创建 Toolbox

打开终端并运行 `toolbox enter`。程序将自动请求许可来下载最新的镜像，创建第一个容器并将你的 shell 放在该容器中。

```
$ toolbox enter
No toolbox containers found. Create now? [y/N] y
Image required to create toolbox container.
Download registry.fedoraproject.org/f30/fedora-toolbox:30 (500MB)? [y/N]: y
```

当前，Toolbox 和你的基本系统之间没有区别。你的文件系统和软件包未曾改变。下面是一个使用仓库的示例，它包含 `~/src/resume` 文件夹下的简历的文档源文件。简历是使用 `pandoc` 工具构建的。

```
$ pwd
/home/rwaltr
$ cd src/resume/
$ head -n 5 Makefile
all: pdf html rtf text docx

pdf: init
 pandoc -s -o BUILDS/resume.pdf markdown/*

$ make pdf
bash: make: command not found
$ pandoc -v
bash: pandoc: command not found
```

这个 toolbox 没有构建简历所需的程序。你可以通过使用 `dnf` 安装工具来解决此问题。由于正在容器中运行，因此不会提示你输入 root 密码。

```
$ sudo dnf groupinstall "Authoring and Publishing" -y && sudo dnf install pandoc make -y
...
$ make all #Successful builds
mkdir -p BUILDS
pandoc -s -o BUILDS/resume.pdf markdown/*
pandoc -s -o BUILDS/resume.html markdown/*
pandoc -s -o BUILDS/resume.rtf markdown/*
pandoc -s -o BUILDS/resume.txt markdown/*
pandoc -s -o BUILDS/resume.docx markdown/*
$ ls BUILDS/
resume.docx  resume.html  resume.pdf  resume.rtf  resume.txt
```

运行 `exit` 可以退出 toolbox。

```
$ cd BUILDS/
$ pandoc --version || ls
pandoc 2.2.1
Compiled with pandoc-types 1.17.5.4, texmath 0.11.1.2, skylighting 0.7.5
...
for a particular purpose.
resume.docx  resume.html  resume.pdf  resume.rtf  resume.txt
$ exit
logout
$ pandoc --version || ls
bash: pandoc: command not found...
resume.docx  resume.html  resume.pdf  resume.rtf  resume.txt
```

你会在主目录中得到由 toolbox 创建的文件。而在 toolbox 中安装的程序无法在外部访问。

### 提示和技巧

本介绍仅涉及 toolbox 的表面。还有一些其他提示，但是你也可以查看[官方文档][2]。

* `toolbox –help` 会显示 Toolbox 的手册页。
* 你可以一次有多个 toolbox。使用 `toolbox create -c Toolboxname` 和 `toolbox enter -c Toolboxname`。
* Toolbox 使用 [Podman][4] 来完成繁重的工作。使用 `toolbox list` 可以查找 Toolbox 创建的容器的 ID。Podman 可以使用这些 ID 来执行 `rm` 和 `stop` 之类的操作。 （你也可以在[此文章][5]中阅读有关 Podman 的更多信息。）


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/a-quick-introduction-to-toolbox-on-fedora/

作者：[Ryan Walter][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rwaltr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/toolbox-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/
[3]: https://fedoramagazine.org/what-is-silverblue/
[4]: https://podman.io/
[5]: https://fedoramagazine.org/running-containers-with-podman/
[6]: https://flickr.com/photos/florianric/
[7]: https://flickr.com/photos/florianric/7263382550/
