怎么用源代码安装软件 … 以及如何卸载它
============================================================

![How to install software from source code](https://itsfoss.com/wp-content/uploads/2017/10/install-software-from-source-code-linux-800x450.jpg)

 _简介：这篇文章详细介绍了在 Linux 中怎么用源代码安装程序，以及怎么去卸载源代码安装的程序。_ 

你的 Linux 分发版的其中一个最大的优点就是它的包管理器和相关的软件库。正是因为它们，你才可以去下载所需的工具和资源，以及在你的计算机上完全自动化地安装一个新软件。

但是，尽管他们付出了很多的努力，包维护者仍然没法做到处理好每个用到的依赖，也不可能将所有的可用软件都打包进去。因此，仍然存在需要你自已去编译和安装一个新软件的情形。对于我来说，到目前为止，最主要的原因是，当我需要去运行一个特定的版本时我还要编译一些软件。或者，我想去修改源代码或使用一些想要的编译选项。

如果你也属于后一种情况，那你已经知道你应该做什么了。但是，对于绝大多数的 Linux 用户来说，第一次从源代码中编译和安装一个软件看上去像是一个入门的仪式：它让很多人感到恐惧；但是，如果你能克服困难，你将可能进入一个全新的世界，并且，如果你做到了，那么你将成为社区中享有特权的一部分人。

[Suggested readHow To Install And Remove Software In Ubuntu [Complete Guide]][8]

### A. 在 Linux 中从源代码开始安装软件

这正是我们要做的。因为这篇文章的需要，我要在我的系统上安装 [NodeJS][9] 8.1.1。它是个完全真实的版本。这个版本在 Debian 仓库中不可用：

```
sh$ apt-cache madison nodejs | grep amd64
    nodejs | 6.11.1~dfsg-1 | http://deb.debian.org/debian experimental/main amd64 Packages
    nodejs | 4.8.2~dfsg-1 | http://ftp.fr.debian.org/debian stretch/main amd64 Packages
    nodejs | 4.8.2~dfsg-1~bpo8+1 | http://ftp.fr.debian.org/debian jessie-backports/main amd64 Packages
    nodejs | 0.10.29~dfsg-2 | http://ftp.fr.debian.org/debian jessie/main amd64 Packages
    nodejs | 0.10.29~dfsg-1~bpo70+1 | http://ftp.fr.debian.org/debian wheezy-backports/main amd64 Packages
```

### 第 1 步：从 GitHub 上获取源代码

像大多数开源项目一样，NodeJS 的源代码可以在 GitHub：[https://github.com/nodejs/node][10] 上找到。

所以，我们直接开始吧。

![The NodeJS official GitHub repository](https://itsfoss.com/wp-content/uploads/2017/07/nodejs-github-account.png)

如果你不熟悉 [GitHub][11]、[git][12] 或者提到的其它的包含这个软件源代码的 [版本管理系统][13]，以及多年来对该软件的所有修改的历史，最终找到该软件的最早版本。对于开发者来说，保持它的历史版本有很多好处。对现在的我来说，其中一个好处是可以得到任何一个给定时间点的项目源代码。更准确地说，当我希望的 8.1.1 版发布时，我可以像他们一样第一时间得到源代码。即便他们有很多的修改。

![Choose the v8.1.1 tag in the NodeJS GitHub repository](https://itsfoss.com/wp-content/uploads/2017/07/nodejs-github-choose-revision-tag.png)

在 GitHub 上，你可以使用 “branch” 按钮导航到这个软件的不同版本。[在 Git 中 “Branch” 和 “tags” 相关的一些概念][14]。总的来说，开发者创建 “branch” 和  “tags” 在项目历史中对重要事件保持跟踪，就像当她们启用一个新特性或者发布一个新版本。在这里先不详细介绍了，所有你想知道的都可以看 _tagged_ 的 “v8.1.1” 版本。

![The NodeJS GitHub repository as it was at the time the v8.1.1 tag was created](https://itsfoss.com/wp-content/uploads/2017/07/nodejs-github-revision-811.png)

在选择了 “v8.1.1” 标签后，页面被刷新，最显著的变化是标签现在作为 URL 的一部分出现。另外，你可能会注意到文件改变数据也不同。在源代码树上，你可以看到现在已经创建了 v8.1.1 标签。在某种意义上，你也可以认为像 git 这样的版本管理工具是一个时光穿梭机，允许你返回进入到以前的项目历史中。

![NodeJS GitHub repository download as a ZIP button](https://itsfoss.com/wp-content/uploads/2017/07/nodejs-github-revision-download-zip.png)

在这个时候，我们可以下载 NodeJS 8.1.1 的源代码。你不要错过大的蓝色按钮，建议下载一个项目的 ZIP 压缩包。对于我来说，为讲解的目的，我从命令行中下载并解压这个 ZIP 压缩包。但是，如果你更喜欢使用一个 [GUI][15] 工具，不用担心，你可以这样做：

```
wget https://github.com/nodejs/node/archive/v8.1.1.zip
unzip v8.1.1.zip
cd node-8.1.1/
```

下载一个 ZIP 包它做的很好，但是如果你希望去做 “like a pro”，我建议你直接使用 `git` 工具去下载源代码。它一点也不复杂 — 并且如果你是第一次使用一个工具，它将是一个很好的开端，你以后将经常用到它：

```
# first ensure git is installed on your system
sh$ sudo apt-get install git
# Make a shallow clone the NodeJS repository at v8.1.1
sh$ git clone --depth 1 \
              --branch v8.1.1 \
              https://github.com/nodejs/node
sh$ cd node/
```

顺便说一下，如果你想发布任何项目，正好可以考虑把这篇文章的第一部分做为一个总体介绍。后面，为了帮你排除常问题，我们将更详细地解释基于 Debian 和基于 ReadHat 的发布。

不管怎样，在你使用 `git` 或者作为一个 ZIP 压缩包下载了源代码后，你现在应该在当前的目录下提取源代码文件：

```
sh$ ls
android-configure  BUILDING.md            common.gypi      doc            Makefile   src
AUTHORS            CHANGELOG.md           configure        GOVERNANCE.md  node.gyp   test
benchmark          CODE_OF_CONDUCT.md     CONTRIBUTING.md  lib            node.gypi  tools
BSDmakefile        COLLABORATOR_GUIDE.md  deps             LICENSE        README.md  vcbuild.bat
```

### 第 2 步：理解程序的构建系统

构建系统就是我们通常所说的 "编译源代码”， 其实，编译只是从源代码中生成一个可使用的软件的其中一个阶段。一个构建系统是一套工具，在具体的实践中，为了完全构建一个软件，仅仅需要发出几个命令就可以自动并清晰地完成这些不同的任务。

虽然概念很简单，实际上编译做了很多事情。因为不同的项目或者编程语言可能要求不一样，或者是因为编程体验，或者因为支持的平台、或者因为历史的原因，或者 … 或者 … 选择或创建其它的构建系统的原因有很多。所有的这些都说明可用的不同的解决方案有很多。

NodeJS 使用一个 [GNU 风格的构建系统][16]。在开源社区中这是一个很流行的选择。一旦开始，将进入一段精彩的旅程。

写出和调优一个构建系统是一个非常复杂的任务。但是，作为 “终端用户” 来说, GNU 风格的构建系统使用两个工具来构建它们：`configure` 和 `make`。

`configure` 文件是项目专用的脚本，为了确保项目可以被构建，它将检查目标系统配置和可用功能，最后使用当前平台专用的脚本来处理构建工作。

一个典型的 `configure` 作业的重要部分是去构建 `Makefile`。这个文件包含有效构建项目所需的指令。

（[`make` 工具][17]），另一方面，一个 POSIX 工具可用于任何类 Unix 系统。它将读取项目专用的 `Makefile` 然后执行所需的操作去构建和安装你的程序。

但是，在 Linux 的世界中，你仍然有一些原因去定制你自己专用的构建。

```
./configure --help
```

`configure -help` 命令将展示所有你可用的配置选项。再强调一下，它是项目专用的。说实话，有时候，在你完全理解每个配置选项的作用之前，你需要深入到项目中去好好研究。

但是，这里至少有一个标准的 GNU 自动化工具选项，它就是众所周知的 `--prefix` 选项。它与文件系统的层次结构有关，它是你软件要安装的位置。

[Suggested read8 Vim Tips And Tricks That Will Make You A Pro User][18]

### 第 3 步：文件系统层次化标准（FHS）

大部分典型的 Linux 分发版的文件系统层次结构都遵从 [文件系统层次化标准（FHS）][19]。

这个标准说明了你的系统中各种目录的用途，比如，`/usr`、`/tmp`、`/var` 等等。

当使用 GNU 自动化工具 _和大多数其它的构建系统_ 时，它的默认安装位置都在你的系统的 `/usr/local` 目录中。依据 FHS 中 _“/usr/local 层级是为系统管理员安装软件的位置使用的，它在系统软件更新时是覆盖安全的。它可以被用于一个主机组中，在 /usr 中找不到的、可共享的程序和数据”_ ，因此，它是一个非常好的选择。

`/usr/local` 层次以某种方式复制了 root 目录，并且你可以在 `/usr/local/bin` 这里找到可执行程序，在 `/usr/local/lib` 中是库，在 `/usr/local/share` 中是架构依赖文件，等等。

使用 `/usr/local` 树作为你定制安装的软件位置的唯一问题是，你的软件将在这里混杂在一起。尤其是你安装了多个软件之后，将很难去准确地跟踪 `/usr/local/bin` 和 `/usr/local/lib` 到底属于哪个软件。它虽然不足以在你的系统上产生问题。毕竟，`/usr/bin` 是很混乱的。但是，它在你想去手工卸载已安装的软件时会将成为一个问题。

去解决这个问题，我通常喜欢安装定制的软件到 `/opt` 子目录下。再次引用 FHS：

 _“`/opt` 是为安装应用程序插件软件包而保留的。一个包安装在 `/opt` 下必须在 `/opt/<package>` 或者 `/opt/<provider>` 目录中独立定位到它的静态文件，`<package>` 处是所说的那个软件名的名字，而 `<provider>` 处是提供者的 LANANA 注册名字。”_（译者注：LANANA 是指 The Linux Assigned Names And Numbers Authority，http://www.lanana.org/ ）

因此，我们将在 `/opt` 下创建一个子目录，用于我们定制的 NodeJS 的安装。并且，如果有一天我想去卸载它，我只是很简单地去删除那个目录：

```
sh$ sudo mkdir /opt/node-v8.1.1
sh$ sudo ln -sT node-v8.1.1 /opt/node
# What is the purpose of the symbolic link above?
# Read the article till the end--then try to answer that
# question in the comment section!

sh$ ./configure --prefix=/opt/node-v8.1.1
sh$ make -j9 && echo ok
# -j9 means run up to 9 parallel tasks to build the software.
# As a rule of thumb, use -j(N+1) where N is the number of cores
# of your system. That will maximize the CPU usage (one task per
# CPU thread/core + a provision of one extra task when a process
# is blocked by an I/O operation.
```

在你运行完成 `make` 命令之后，如果有任何的除了 “ok” 以外的信息，将意味着在构建过程中有错误。比如，我们使用一个 `-j` 选项去运行一个并行构建，在构建系统的大量输出过程中，检索错误信息并不是件很容易的事。

在这种情况下，只能是重新开始 `make`，并且不要使用 `-j` 选项。这样错误将会出现在输出信息的最后面：

```
sh$ make
```

最终，编译结束后，你可以运行这个命令去安装你的软件：

```
sh$ sudo make install
```

然后测试它：

```
sh$ /opt/node/bin/node --version
v8.1.1
```

### B. 如果在源代码安装的过程中出现错误怎么办？

我上面介绍的是大多数的文档丰富的项目在“构建指令”页面上你所看到的。但是，本文的目标是让你从源代码开始去编译你的第一个软件，它可能要花一些时间去研究一些常见的问题。因此，我将再次重新开始一遍整个过程，但是，这次是在一个最新的、最小化安装的 Debian 9.0 和 CentOS 7.0 系统上。因此，你可能看到很多的错误和我怎么去解决它。

### 从 Debian 9.0 中 “Stretch” 开始

```
itsfoss@debian:~$ git clone --depth 1 \
                             --branch v8.1.1 \
                             https://github.com/nodejs/node
-bash: git: command not found
```

这个问题非常容易去诊断和解决。仅仅是去安装这个 `git` 包：

```
itsfoss@debian:~$ sudo apt-get install git
```

```
itsfoss@debian:~$ git clone --depth 1 \
                             --branch v8.1.1 \
                             https://github.com/nodejs/node && echo ok
[...]
ok
```

```
itsfoss@debian:~/node$ sudo mkdir /opt/node-v8.1.1
itsfoss@debian:~/node$ sudo ln -sT node-v8.1.1 /opt/node
```

现在没有问题了。

```
itsfoss@debian:~/node$ ./configure --prefix=/opt/node-v8.1.1/
WARNING: failed to autodetect C++ compiler version (CXX=g++)
WARNING: failed to autodetect C compiler version (CC=gcc)
Node.js configure error: No acceptable C compiler found!
        Please make sure you have a C compiler installed on your system and/or
        consider adjusting the CC environment variable if you installed
        it in a non-standard prefix.
```

很显然，编译一个项目，你需要一个编译器。NodeJS 是使用 [C++ language][20] 写的，我们需要一个 C++ [编译器][21]。在这里我将安装 `g++`，它就是为这个目的写的 GNU C++  编译器：

```
itsfoss@debian:~/node$ sudo apt-get install g++
itsfoss@debian:~/node$ ./configure --prefix=/opt/node-v8.1.1/ && echo ok
[...]
ok
```

```
itsfoss@debian:~/node$ make -j9 && echo ok
-bash: make: command not found
```

还差一个其它工具。同样的症状。同样的解决方案：

```
itsfoss@debian:~/node$ sudo apt-get install make
itsfoss@debian:~/node$ make -j9 && echo ok
[...]
ok
```

```
itsfoss@debian:~/node$ sudo make install
[...]
itsfoss@debian:~/node$ /opt/node/bin/node --version
v8.1.1
```

成功！

请注意：我将安装各种工具一步一步去展示怎么去诊断编译问题，以及展示怎么去解决这些问题。但是，如果你搜索关于这个主题的更多文档，或者读其它的教程，你将发现，很多分发版有一个 “meta-packages”，它像一个伞一样去安装一系列的或者全部的常用工具用于编译软件。在基于 Debian 的系统上，你或许遇到过 [构建要素][22] 包，它就是这种用作。在基于 Red Hat 的分发版中，它将是  _“开发工具”_ 组。

### 在 CentOS 7.0 上

```
[itsfoss@centos ~]$ git clone --depth 1 \
                               --branch v8.1.1 \
                               https://github.com/nodejs/node
-bash: git: command not found
```

命令没有找到？可以用 `yum` 包管理器去安装它：

```
[itsfoss@centos ~]$ sudo yum install git
```

```
[itsfoss@centos ~]$ git clone --depth 1 \
                               --branch v8.1.1 \
                               https://github.com/nodejs/node && echo ok
[...]
ok
```

```
[itsfoss@centos ~]$ sudo mkdir /opt/node-v8.1.1
[itsfoss@centos ~]$ sudo ln -sT node-v8.1.1 /opt/node
```

```
[itsfoss@centos ~]$ cd node
[itsfoss@centos node]$ ./configure --prefix=/opt/node-v8.1.1/
WARNING: failed to autodetect C++ compiler version (CXX=g++)
WARNING: failed to autodetect C compiler version (CC=gcc)
Node.js configure error: No acceptable C compiler found!

        Please make sure you have a C compiler installed on your system and/or
        consider adjusting the CC environment variable if you installed
        it in a non-standard prefix.
```

你知道的：NodeJS 是使用 C++ 语言写的，但是，我的系统缺少合适的编译器。Yum 可以帮到你。因为，我不是一个合格的 CentOS 用户，在因特网上准确地找到包含 g++ 编译器的包的名字是很困难的。这个页面会指导我：[https://superuser.com/questions/590808/yum-install-gcc-g-doesnt-work-anymore-in-centos-6-4][23]

```
[itsfoss@centos node]$ sudo yum install gcc-c++
[itsfoss@centos node]$ ./configure --prefix=/opt/node-v8.1.1/ && echo ok
[...]
ok
```

```
[itsfoss@centos node]$ make -j9 && echo ok
[...]
ok
```

```
[itsfoss@centos node]$ sudo make install && echo ok
[...]
ok
```

```
[itsfoss@centos node]$ /opt/node/bin/node --version
v8.1.1
```

再次成功！

### C. 从源代码中对要安装的软件做一些改变

你从源代码中安装一个软件，可能是因为你的分发仓库中没有一个可用的特定版本。或者因为你想去 _修改_ 那个程序。也可能是修复一个 bug 或者增加一个特性。毕竟，开源软件这些都可以做到。因此，我将抓住这个机会，让你亲自体验怎么去编译你自己的软件。

在这里，我将在 NodeJS 源代码上生成一个主要的改变。然后，我们将看到我们的改变将被纳入到软件的编译版本中：

用你喜欢的 [文本编辑器][24]（如，vim、nano、gedit、 … ）打开文件 `node/src/node.cc`。然后，尝试找到如下的代码片段：

```
   if (debug_options.ParseOption(argv[0], arg)) {
      // Done, consumed by DebugOptions::ParseOption().
    } else if (strcmp(arg, "--version") == 0 || strcmp(arg, "-v") == 0) {
      printf("%s\n", NODE_VERSION);
      exit(0);
    } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
      PrintHelp();
      exit(0);
    }
```

它在 [文件的 3830 行][25] 附近。然后，修改包含 `printf` 的行，将它替换成如下内容：

```
      printf("%s (compiled by myself)\n", NODE_VERSION);
```

然后，返回到你的终端。在继续之前，_为了对强大的 Git 支持有更多的了解_，你可以去检查一下，你修改是文件是否正确：

```
diff --git a/src/node.cc b/src/node.cc
index bbce1022..a5618b57 100644
--- a/src/node.cc
+++ b/src/node.cc
@@ -3828,7 +3828,7 @@ static void ParseArgs(int* argc,
     if (debug_options.ParseOption(argv[0], arg)) {
       // Done, consumed by DebugOptions::ParseOption().
     } else if (strcmp(arg, "--version") == 0 || strcmp(arg, "-v") == 0) {
-      printf("%s\n", NODE_VERSION);
+      printf("%s (compiled by myself)\n", NODE_VERSION);
       exit(0);
     } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
       PrintHelp();
```

在你改变的行之前，你将看到一个 “-” （减号标志）。而在改变之后的行前面有一个 “+” （加号标志）。

现在可以去重新编译并重新安装你的软件了：

```
make -j9 && sudo make install && echo ok
[...]
ok
```

这个时候，可能失败的唯一原因就是你改变代码时的输入错误。如果就是这种情况，在文本编辑器中重新打开 `node/src/node.cc` 文件并修复错误。

一旦你管理的一个编译和安装的新修改版本的 NodeJS，将可以去检查你的修改是否包含到软件中：

```
itsfoss@debian:~/node$ /opt/node/bin/node --version
v8.1.1 (compiled by myself)
```

恭喜你！你生成了开源程序中你的第一个改变！

### D. 让 shell 定位到定制构建的软件

到目前为止，你可能注意到，我通常启动我新编译的 NodeJS 软件是通过指定一个到二进制文件的绝对路径。

```
/opt/node/bin/node
```

这是可以正常工作的。但是，这样太麻烦。实际上有两种办法可以去解决这个问题。但是，去理解它们，你必须首先明白，你的 shell 定位可执行文件是进入到通过在[环境变量][26]`PATH` 中指定的目录去查找的。

```
itsfoss@debian:~/node$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```

在 Debian 系统上，如果你不指定一个精确的目录做为命令名字的一部分，shell 将首先在 `/usr/local/bin` 中查找可执行程序，如果没有找到，然后进入 `/usr/bin` 中查找，如果没有找到，然后进入 `/bin`查找，如果没有找到，然后进入 `/usr/local/games` 查找，如果没有找到，然后进入 `/usr/games` 查找，如果没有找到，那么，shell 将报告一个错误，_“command not found”_。

由此，我们可以知道有两种方法去确保命令可以被 shell 访问到：通过将它增加到已经配置好的 `PATH` 目录中，或者将包含可执行程序的目录添加到 `PATH` 中。

### 从 /usr/local/bin 中添加一个链接

仅从 `/opt/node/bin` 中 _拷贝_ 节点二进制可执行文件到 `/usr/local/bin` 是将是一个错误的做法。因为，如果这么做，可执行程序将无法定位到在 `/opt/node/` 中的其它需要的组件。（常见的做法是软件在它自己的位置去定位它所需要的资源文件）

因此，传统的做法是去使用一个符号链接：

```
itsfoss@debian:~/node$ sudo ln -sT /opt/node/bin/node /usr/local/bin/node
itsfoss@debian:~/node$ which -a node || echo not found
/usr/local/bin/node
itsfoss@debian:~/node$ node --version
v8.1.1 (compiled by myself)
```

这一个简单而有效的解决办法，尤其是，如果一个软件包是由好几个众所周知的可执行程序组成的，因为，你将为每个用户调用命令创建一个符号链接。例如，如果你熟悉 NodeJS，你知道应用的 `npm` 组件，也是 `/usr/local/bin` 中的符号链接。这只是，我让你做了一个练习。

### 修改 PATH

首先，如果你尝试前面的解决方案，先移除前面创建的节点符号链接，去从一个干净的状态开始：

```
itsfoss@debian:~/node$ sudo rm /usr/local/bin/node
itsfoss@debian:~/node$ which -a node || echo not found
not found
```

现在，这里有一个不可思议的命令去改变你的 `PATH`：

```
itsfoss@debian:~/node$ export PATH="/opt/node/bin:${PATH}"
itsfoss@debian:~/node$ echo $PATH
/opt/node/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```

简单说就是，我用前面的内容替换了环境变量 `PATH` 中原先的内容，但是通过一个 `/opt/node/bin` 的前缀。因此，你可以想像一下，shell 将先进入到 `/opt/node/bin` 目录中查找可执行程序。我们也可以使用 `which` 命令去确认一下：

```
itsfoss@debian:~/node$ which -a node || echo not found
/opt/node/bin/node
itsfoss@debian:~/node$ node --version
v8.1.1 (compiled by myself)
```

鉴于 “link” 解决方案是永久的，只要创建到 `/usr/local/bin`的符号链接就行了，而对 `PATH` 的改变仅对进入到当前的 shell 生效。你可以自己做一些研究，如何做到对 `PATH` 的永久改变。给你一个提示，可以将它写到你的 “profile” 中。如果你找到这个解决方案，不要犹豫，通过下面的评论区共享给其它的读者！

### E. 怎么去卸载刚才从源代码中安装的软件

因为我们定制编译的 NodeJS 软件全部在 `/opt/node-v8.1.1` 目录中，卸载它不需要做太多的工作，仅使用 `rm` 命令去删除那个目录即可：

```
sudo rm -rf /opt/node-v8.1.1
```

注意：`sudo` 和 `rm -rf` 是 “非常危险的鸡尾酒!”，一定要在按下 “enter” 键之前多检查几次你的命令。你不会得到任何的确认信息，并且如果你删除了错误的目录它是不可恢复的 …

然后，如果你修改了你的 `PATH`，你可以去恢复这些改变。它一点也不复杂。

如果你从 `/usr/local/bin` 创建了一个符号链接，你应该去删除它们：

```
itsfoss@debian:~/node$ sudo find /usr/local/bin \
                                 -type l \
                                 -ilname "/opt/node/*" \
                                 -print -delete
/usr/local/bin/node
```

### 等等？ 依赖地狱在哪里？

一个最终结论是，如果你读过有关的编译定制软件的文档，你可能听到关于 [依赖地狱][27] 的说法。那是在你能够成功编译一个软件之前，对那种烦人情况的一个呢称，你必须首先编译一个前提条件所需要的库，它又可能要求其它的库，而这些库有可能与你的系统上已经安装的其它软件不兼容。

作为你的分发版的包维护者的工作的一部分，去真正地解决那些依赖关系，确保你的系统上的各种软件都使用了可兼容的库，并且按正确的顺序去安装。

在这篇文章中，我特意选择了 NodeJS 去安装，是因为它几乎没有依赖。我说 “几乎” 是因为，实际上，它  _有_  依赖。但是，这些源代码的依赖已经预置到项目的源仓库中（在 `node/deps` 子目录下），因此，在你动手编译之前，你不用手动去下载和安装它们。

如果你有兴趣了解更多关于那个问题的知识和学习怎么去处理它。请在下面的评论区告诉我，它将是更高级别的文章的好主题！

--------------------------------------------------------------------------------

作者简介：

充满激情的工程师，职业是教师，我的目标是：热心分享我所教的内容，并让我的学生自己培养它们的技能。你也可以在我的网站上联系到我。

--------------------

via: https://itsfoss.com/install-software-from-source-code/

作者：[Sylvain Leroux ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/sylvain/
[1]:https://itsfoss.com/author/sylvain/
[2]:https://itsfoss.com/install-software-from-source-code/#comments
[3]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Finstall-software-from-source-code%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=How+to+Install+Software+from+Source+Code%E2%80%A6+and+Remove+it+Afterwards&url=https://itsfoss.com/install-software-from-source-code/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=Yes_I_Know_IT
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Finstall-software-from-source-code%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Finstall-software-from-source-code%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:https://www.reddit.com/submit?url=https://itsfoss.com/install-software-from-source-code/&title=How+to+Install+Software+from+Source+Code%E2%80%A6+and+Remove+it+Afterwards
[8]:https://itsfoss.com/remove-install-software-ubuntu/
[9]:https://nodejs.org/en/
[10]:https://github.com/nodejs/node
[11]:https://en.wikipedia.org/wiki/GitHub
[12]:https://en.wikipedia.org/wiki/Git
[13]:https://en.wikipedia.org/wiki/Version_control
[14]:https://stackoverflow.com/questions/1457103/how-is-a-tag-different-from-a-branch-which-should-i-use-here
[15]:https://en.wikipedia.org/wiki/Graphical_user_interface
[16]:https://en.wikipedia.org/wiki/GNU_Build_System
[17]:https://en.wikipedia.org/wiki/Make_%28software
[18]:https://itsfoss.com/pro-vim-tips/
[19]:http://www.pathname.com/fhs/
[20]:https://en.wikipedia.org/wiki/C%2B%2B
[21]:https://en.wikipedia.org/wiki/Compiler
[22]:https://packages.debian.org/sid/build-essential
[23]:https://superuser.com/questions/590808/yum-install-gcc-g-doesnt-work-anymore-in-centos-6-4
[24]:https://en.wikipedia.org/wiki/List_of_text_editors
[25]:https://github.com/nodejs/node/blob/v8.1.1/src/node.cc#L3830
[26]:https://en.wikipedia.org/wiki/Environment_variable
[27]:https://en.wikipedia.org/wiki/Dependency_hell
