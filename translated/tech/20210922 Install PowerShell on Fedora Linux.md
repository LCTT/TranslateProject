[#]: subject: "Install PowerShell on Fedora Linux"
[#]: via: "https://fedoramagazine.org/install-powershell-on-fedora-linux/"
[#]: author: "TheEvilSkeletonOzymandias42 https://fedoramagazine.org/author/theevilskeleton/https://fedoramagazine.org/author/ozymandias42/"
[#]: collector: "lujun9972"
[#]: translator: "cool-summer-021"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在Fedora Linux 系统上安装 PowerShell
======

![][1]

Photos by [NOAA][2] and [Cedric Fox][3] on [Unsplash][4]

PowerShell(也可写作 pwsh) 是一个功能强大的开源命令行工具，它是面向对象的，由微软开发和维护。它的语法特征冗长，但对用户来说比较直观。本文介绍如何在主机上和在 Podman 或其他容器内安装 PowerShell。

### 目录

  * [为何使用 PowerShell][5]
    * [演示实例][6]
    * [Bash 和 PowerShell 的比较][7]
  * [安装 PowerShell][8]
    * [使用包管理器在主机上安装 PowerShell][9]
      * [方法1：通过微软仓库][10]
      * [方法2：通过 RPM 文件][11]
    * [借助容器安装 PowerShell][12]
      * [方法1：使用 Podman 容器][13]
      * [方法2：使用 Fedora Linux 系统的 Toolbox 容器][14]



### 为何使用 PowerShell

PowerShell，正如它的名字那样，是一个强大的工具。它的句法冗长，但语义清晰。对那些不愿意写长命令的开发者来说，PowerShell 的大多数命令都有别名。可以使用 _Get-Alias_ 或点击[此处][15]查询别名的使用方法。 

PowerShell 和传统的 Shell 最大的区别在于它的输出管道。普通的 Shell 输出的是字符串或字符流，PowerShell 输出的是对象。这对命令管道的工作方式具有深远的影响，而且它具有很多的优点。

#### 演示例子

下面的例子体现的是冗长而清晰的特点。以#号开头的行为注释行。以PS > 开头的行为命令行，**PS &gt;**是提示：

```
# Return all files greater than 50MB in the current directory.
## Longest form
PS > Get-Childitem | Where-Object Length -gt 50MB
## Shortest form (with use of aliases)
PS > gci | ? Length -gt 40MB
## Output looks like this
    Directory: /home/Ozymandias42/Downloads
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-----          20/08/2020    13:55     2000683008 40MB-file.img


# In order: get VMs, get snapshots, only select the last 3 and remove selected list:
PS > Get-VM VM-1 | Get-Snapshot | Select-Object -Last 3 | Remove-Snapshot
```

上述例子说明了：带有 _cut_, _sed_, _awk_ 等类似工具的输入-输出格式，在使用 Bash 脚本时是必须具备的技能，而使用 PowerShell 时就不是必备技能了。这是因为 PowerShell 的工作机制跟传统的 POSIX shell（例如 Bash、Zsh、Fish等）有本质的不同。传统的 Shell 的命令输出形式是字符串，而在 PowerShell 中，命令输出形式为对象。

#### Bash 与 PowerShell 的比较

下面的例子说明了与 Bash 中的字符串输出模式相比，PowerShell 的对象输出模式的优点。假设你需要写一段脚本，该脚本的作用显示所有进程，这些进程一共占用了 200MB 内存空间。如果使用 Bash，大致如下：

```
$ ps -eO rss | awk -F' ' \
    '{ if($2 >= (1024*200)) { \
        printf("%s\t%s\t%s\n",$1,$2,$6);} \
     }'

PID    RSS     COMMAND
A      B       C
[...]
```

第一个显而易见的差别就是可读性，或更确切地说是语义清晰性。 _ps_ 和 _awk_ 都不是自描述的。_ps_ 命令的功能是显示进程状态，_awk_ 是一种文本处理工具和语言，这个词汇每个字母都是前期开发人员的名字（**A**ho, **W**einberger, **K**ernighan (详见 [Wikipedia][16])）的首字母。然而，在把它与 PowerShell 作比较前，考察以下脚本：

  * _ps -e_ 输出所有运行中的进程;

  * _-O rss_ 输出 _ps_ 的默认输出内容，每个进程分别显示其占用的字节数（以 KB 为单位）；输出结果类似于：

```
PID  RSS   S TTY TIME     COMMAND  1    13776 S ?   00:00:01 /usr/lib/systemd/systemd
```

  * | 管道操作符使用左边命令的输出作为右边命令的输入。

  * _awk -F’ ‘_ 定义"空格"，作为输入域操作符。再回到上面的例子，PID 是第一个，RSS 是第二个，依此类推。

  * _‘{ if($2 &gt;= (1024*200)_ 是实际的 AWK-script 代码起始处。它的作用是检查第2个字段([RSS][17])是否包含大于或等于 1024*200 的数字；

  * _{ printf(“%s\t%s\t%s\n”,$1,$2,$6);} }’_ 继续分析脚本代码。如果前面的条件成立，则输出第一、第二和第六个字段(分别是 [PID][18], [RSS][17] 和 COMMAND)。




记住这点，往回看编写这段脚本需要什么以及如何令它正常工作：

  * 输入命令_ps_的输出中必须包含我们想要过滤的字段。这不是默认的实例，需要我们使用 _-O_ 标志和 _rss_ 字段作为参数。 
  * 我们需要将 _ps_ 的输出当作一组输入字段，所以我们还应当知道它们的顺序和结构。换句话说，我们至少需要确定 _RSS_ 是第二个字段。这也意味着我们需要提前知道 _ps_ 的输出信息的大致情况。
  * 然后我们需要知道过滤的数据位于什么单元以及相关工具运行于什么单元。也就是我们需要得到 _RSS_ 和 _awk_ 字段占用了多少字节。不然我们也不会写出 _($2 >= 1024*200)_ 这样的表达式。



现在，我们把前面的命令跟 PoserShell 中等价的命令比较：

```
# Longest form
PS > Get-Process | Where-Object WorkingSet -ge 200MB
# Shortest form (with use of aliases)
PS > gps | ? ws -ge 200MB

NPM(K)    PM(M)      WS(M)     CPU(s)      Id  SI ProcessName
------    -----      -----     ------      --  -- -----------
     A        B          C          D       E   F           G
[...]
```

首先应该注意到，语义非常清晰。这些命令都是自描述的，能清晰描述它们做什么。

此外，不需要对输入-输出重新格式化，也不需要关心输入命令使用的单元。这是因为 PowerShell 输出的是对象，而非字符串。

考虑下述情况，就可以理解这些内容。在 Bash 中，命令的输出信息就是终端显示的信息。在 PowerShell 中，终端显示的信息并不等于实际可用的信息。这是由于 PowerShell 中的输出-打印系统使用的也是对象。因此 PowerShell 中每一条命令都对输出的对象的一些属性作了可打印的标记，也对一些属性作了不可打印的标记。Bash 中的输出位置被分为一些“字段”，以空格或制表符为标志，在 PowerShell 中它是一个容易寻址的对象属性，只需要知道它的名称即可使用。就像上述例子中的 _WorkingSet_ 那样。

为了看到一条命令的输出对象的所有属性和它们的类型，可以进行以下操作:

```
PS > Get-Process | Get-Member
```

### 安装 PowerShell

PowerShell 安装包的形式有若干种，包括 Fedora Linux 中使用的 RPM 安装包。本文介绍在 Fedora Linux 中如何使用多种方法安装 PowerShell。

我推荐使用原生的方法安装。但我也会介绍如何在容器中安装。官方 Microsoft PowerShell 容器和 Fedora Linux 30 工具箱容器的使用，我都会介绍。使用容器的优点在于，所有的依赖捆绑在其中，并且会从主机分离出去，所以它一定是有效的。无论如何，虽然官方文档只是明确支持 Fedora Linux 发行版 28-30，我还是建议使用原生的方法安装。

**注意:** 官方支持意味着一定有效。其他的版本也不是一定不兼容。也就是说，高于 30 的发行版也应该有效。经过测试，的确如此。

在容器中设置并运行 PowerShell 比直接在主机上运行它难度更大，安装需要花费更多时间，而且你还不能直接运行命令。

#### 在主机上使用包管理器安装 PowerShell

##### 方法一：使用微软仓库

安装过程很直接，而且跟通过第三方仓库安装其他软件没什么区别。

通俗地说，安装过程可以分为四步：

  1. 添加新仓库的 GPG 密码
  2. 在 DNF 仓库列表中新增相应的仓库
  3. 刷新 DNF 缓存，将新仓库中的有关包包含进来
  4. 安装新包



使用命令 _pwsh_ 启动 PowerShell。

```
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
$ sudo dnf makecache
$ sudo dnf install powershell
$ pwsh
```

欲删除仓库和包，运行以下命令。

```
$ sudo rm /etc/yum.repos.d/microsoft.repo
$ sudo dnf remove powershell
```

##### 方法2：使用 PRM 文件

这种方法与第一种方法没有明显的差别。实际上，在安装 RPM 文件时，隐式添加了 GPG 密码和仓库。这是由于 RPM 文件包含它们两者的关联关系，保存在它的元数据中。

首先，从 [PowerShell GitHub 仓库][19] 获取相应版本的 _.rpm_ 文件。然后查看 readme.md 文件中的 “获取 PowerShell” 部分的内容。


第二步，输入以下命令：

```
$ sudo dnf install powershell-<version>.rhel.7.<architecture>.rpm
```

在 version 和 architecture 节点中填写各自的内容，例如 [powershell-7.1.3-1.rhel.7.x86_64.rpm][20]。

你也可以使用链接运行它，不指定版本和架构，先把它下载到本地。

```
$ sudo dnf install https://github.com/PowerShell/PowerShell/releases/download/v<version>/powershell-<version>.rhel.7.<architecture>.rpm
```

欲删除 PowerShell，运行以下命令。

```
$ sudo dnf remove powershell
```

#### 通过容器安装

##### 方法一：使用 Podman 容器

Podman 是一个兼容[开放容器倡议][21](OCI)的、嵌入式的容器引擎，它可以代替 Docker。 

微软提供了[PowerShell Docker 容器集成工具][22]。下面的例子将在 Podman 中使用容器。 

欲了解更多关于 Podman 的信息，可以访问 [Podman.io][23]。Fedora 杂志还有一个专为 Podman 设计的[标签][24]。

欲在 Podman 中使用 PowerShell，运行以下脚本：

```
$ podman run \
 -it \
 --privileged \
 --rm \
 --name powershell \
 --env-host \
 --net=host --pid=host --ipc=host \
 --volume $HOME:$HOME \
 --volume /:/var/host \
 mcr.microsoft.com/powershell \
 /usr/bin/pwsh -WorkingDirectory $(pwd)
```

这段脚本为使用 PowerShell 创建了一个 Podman 容器，并立即将它连接起来。它还将 _/home_ 和主机的根目录挂载到容器中，确保它们在容器中是可用的。无论如何，在 _/var/host_ 目录下，主机的根目录是可获取的。 

但是，在容器内部，你只能间接运行主机命令。有一种变通办法，就是先运行 _chroot /var/host_ 改变根目录，然后运行主机命令。

为了把命令拆分开来讲解，除非特别指定，以下所有内容都是强制性的：

  * -it 创建一个持久环境，当您进入该环境后，不会轻易退出；
  * \--privileged 给予容器扩展的权限（可选）；
  * \--rm 当你退出时移除容器；
  * \--name 设置容器名称；
  * \--env-host 将所有主机的环境变量设置为容器的变量值（可选）；
  * \--volume $HOME:$HOME 加载用户目录；
  * \--volume /:/var/host 将根目录挂载到 _/var/host_（可选）；
  * \--net=host --pid=host --ipc=host 在主机的命名空间中运行进程（而非一组单独的名称空间）；
  * docker.io/microsoft/powershell 进入容器
  * /usr/bin/pwsh -WorkingDirectory $(pwd) 在当前目录下进入容器（可选）。



可选但很方便的参数：别名 _pwsh_，脚本中有了它，可以输入 _pwsh_ 轻松访问 Podman 容器。 

欲移除 PowerShell 镜像，运行以下命令：

```
$ podman rmi mcr.microsoft.com/powershell
```

##### 方法二：Fedora 系统的 Toolbox 容器

在不影响主机系统的情况下安装持久化环境，使用 Toolbox 是一种巧妙的解决方案。它类似于 Podman 的封装器，负责提供大量的标志，就像方法一中提到的那样。因此，Toolbox 比 Podman 容易使用。它可以用来开发和调试。有了 Toolbox，你可以运行任何命令，跟你直接在 Fedora 工作站主机上运行是一样的。

安装步骤跟在主机上安装一样，唯一的区别就是在容器内部进行。你需要确保已经安装了 _toolbox_ 包。

使用 Fedora 34 Toolbox 容器需要两个步骤：

  1. 创建 Fedora 34 Toolbox 容器
  2. 运行 Fedora 34 Toolbox 容器



```
$ toolbox create --image registry.fedoraproject.org/f34/fedora-toolbox
$ toolbox enter --container fedora-toolbox
```

接着，按照[方法一：使用微软仓库][10]中的相关内容操作。

可选但非常方便的做法：使用别名，可以轻松地访问 Toolbox 容器。

欲移除 Toolbox 容器，需要确保你已经使用 _exit_ 关闭了 Toolbox 会话，然后运行以下命令：

```
$ podman kill fedora-toolbox
$ toolbox rm fedora-toolbox
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-powershell-on-fedora-linux/

作者：[TheEvilSkeletonOzymandias42][a]
选题：[lujun9972][b]
译者：[cool-summer-021](https://github.com/cool-summer-021)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/theevilskeleton/https://fedoramagazine.org/author/ozymandias42/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/05/powershell-816x345.jpg
[2]: https://unsplash.com/@noaa?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/@thecedfox?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/s/photos/shell?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: tmp.c7U2gcu9Hl#why-use-powershell
[6]: tmp.c7U2gcu9Hl#demonstration
[7]: tmp.c7U2gcu9Hl#comparison-between-bash-and-powershell
[8]: tmp.c7U2gcu9Hl#install-powershell
[9]: tmp.c7U2gcu9Hl#install-on-host-via-package-manager
[10]: tmp.c7U2gcu9Hl#method-1-microsoft-repositories
[11]: tmp.c7U2gcu9Hl#method-2-rpm-file
[12]: tmp.c7U2gcu9Hl#install-via-container
[13]: tmp.c7U2gcu9Hl#method-1-podman-container
[14]: tmp.c7U2gcu9Hl#method-2-fedora-toolbox-container
[15]: https://ilovepowershell.com/2011/11/03/list-of-top-powershell-alias/
[16]: https://en.wikipedia.org/wiki/AWK
[17]: https://en.wikipedia.org/wiki/Resident_set_size
[18]: https://en.wikipedia.org/wiki/Process_identifier
[19]: https://github.com/PowerShell/PowerShell
[20]: https://github.com/PowerShell/PowerShell/releases/download/v7.1.3/powershell-7.1.3-1.rhel.7.x86_64.rpm
[21]: https://opencontainers.org/
[22]: https://hub.docker.com/_/microsoft-powershell
[23]: https://podman.io/
[24]: https://fedoramagazine.org/tag/podman/
