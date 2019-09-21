一套有用的 Unix 实用程序
======

![](https://www.ostechnix.com/wp-content/uploads/2017/08/Moreutils-720x340.png)

我们都了解 <ruby>GNU 核心实用程序<rt>GNU Core Utilities</rt></ruby>，所有类 Unix 操作系统都预装了它们。它们是 GNU 操作系统中与文件、Shell 和 文本处理相关的基础实用工具。GNU 核心实用程序包括很多日常操作命令，例如 `cat`、`ls`、`rm`、`mkdir`、`rmdir`、`touch`、`tail` 和 `wc` 等。除了这些实用程序，还有更多有用的实用程序没有预装在类 Unix 操作系统中，它们汇集起来构成了 `moreutilis` 这个日益增长的集合。`moreutils` 可以在 GNU/Linux 和包括 FreeBSD，openBSD 及 Mac OS 在内的多种 Unix 类型操作系统上安装。

截至到编写这份指南时，  `moreutils` 提供如下实用程序：

* `chronic` – 运行程序并忽略正常运行的输出
* `combine` – 使用布尔操作合并文件的行
* `errno` – 查询 errno 名称及描述
* `ifdata` – 获取网络接口信息，无需解析 `ifconfig` 的结果
* `ifne` – 在标准输入非空的情况下运行程序
* `isutf8` – 检查文件或标准输入是否采用 UTF-8 编码
* `lckdo` – 带锁运行程序
* `mispipe` – 使用管道连接两个命令，返回第一个命令的退出状态
* `parallel` – 同时运行多个任务
* `pee` – 将标准输入传递给多个管道
* `sponge` – 整合标准输入并写入文件
* `ts` – 为标准输入增加时间戳信息
* `vidir` – 使用你默认的文本编辑器操作目录文件
* `vipe` – 在管道中插入信息编辑
* `zrun` – 自动解压并将其作为参数传递给命令

### 在 Linux 上安装 moreutils

由于 `moreutils` 已经被打包到多种 Linux 发行版中，你可以使用发行版对应的软件包管理器安装 `moreutils`。

在 **Arch Linux** 或衍生的 **Antergos** 和 **Manjaro Linux** 上，运行如下命令安装 `moreutils`:

```
$ sudo pacman -S moreutils
```

在 **Fedora** 上，运行：

```
$ sudo dnf install moreutils
```

在 **RHEL**，**CentOS** 和 **Scientific Linux** 上，运行：

```
$ sudo yum install epel-release
$ sudo yum install moreutils
```

在 **Debian**，**Ubuntu** 和 **Linux Mint** 上，运行：

```
$ sudo apt-get install moreutils
```

### Moreutils – 打包更多有用的 Unix 实用程序

让我们看一下几个 `moreutils` 工具的用法细节。

#### combine 实用程序

正如 `combine` 名称所示，moreutils 中的这个实用程序可以使用包括 `and`，`not`，`or` 和 `xor` 在内的布尔操作，合并两个文件中的行。

* `and` – 输出 `file1` 和 `file2` 都包含的行。
* `not` – 输出 `file1` 包含但 `file2` 不包含的行。
* `or` – 输出 `file1` 或 `file2` 包含的行。
* `xor` – 输出仅被 `file1` 或 `file2` 包含的行

下面举例说明，方便你理解该实用程序的功能。这里有两个文件，文件名分别为 `file1` 和 `file2`，其内容如下：

```
$ cat file1
is
was
were
where
there

$ cat file2
is
were
there
```

下面，我使用 `and` 布尔操作合并这两个文件。

```
$ combine file1 and file2
is
were
there
```

从上例的输出中可以看出，`and` 布尔操作只输出那些 `file1` 和 `file2` 都包含的行；更具体的来说，命令输出为两个文件共有的行，即 is，were 和 there。

下面我们换成 `not` 操作，观察一下输出。

```
$ combine file1 not file2
was
where
```

从上面的输出中可以看出，`not` 操作输出 `file1` 包含但 `file2` 不包含的行。

#### ifdata 实用程序

`ifdata` 实用程序可用于检查网络接口是否存在，也可用于获取网络接口的信息，例如 IP 地址等。与预装的 `ifconfig` 和 `ip` 命令不同，`ifdata` 的输出更容易解析，这种设计的初衷是便于在 Shell 脚本中使用。

如果希望查看某个接口的 IP 地址，不妨以 `wlp9s0` 为例，运行如下命令：

```
$ ifdata -p wlp9s0
192.168.43.192 255.255.255.0 192.168.43.255 1500
```

如果只查看掩码信息，运行如下命令：

```
$ ifdata -pn wlp9s0
255.255.255.0
```

如果查看网络接口的物理地址，运行如下命令：

```
$ ifdata -ph wlp9s0
A0:15:46:90:12:3E
```

如果判断接口是否存在，可以使用 `-pe` 参数：

```
$ ifdata -pe wlp9s0
yes
```

#### pee 命令

该命令某种程度上类似于 `tee` 命令。

我们先用一个例子看一下 `tee` 的用法。

```
$ echo "Welcome to OSTechNIx" | tee file1 file2
Welcome to OSTechNIx
```

上述命令首先创建两个文件，名为 `file1` 和 `file2`；接着，将 “Welcome to OSTechNix” 行分别附加到两个文件中；最后，在终端中打印输出 “Welcome to OSTechNix”。

`pee` 命令提供类似的功能，但与 `tee` 又稍微有些差异。查看下面的例子：

```
$ echo "Welcome to OSTechNIx" | pee cat cat
Welcome to OSTechNIx
Welcome to OSTechNIx
```

从上面的命令输出中可以看出，有两个 `cat` 命令实例获取 `echo` 命令的输出并执行，因而终端中出现两个同样的输出。

#### sponge 实用程序

这是 `moreutils` 软件包中的另一个有用的实用程序。`sponge` 读取标准输入并写入到指定的文件中。与 Shell 中的重定向不同，`sponge` 接收到完整输入后再写入输出文件。

查看下面这个文本文件的内容：

```
$ cat file1
I
You
Me
We
Us
```

可见，文件包含了一些无序的行；更具体的说，这些行“没有”按照字母顺序排序。如果希望将其内容安装字母顺序排序，你会怎么做呢？

```
$ sort file1 > file1_sorted
```

这样做没错，对吧？当然没错！在上面的命令中，我将 `file1` 文件内容按照字母顺序排序，将排序后的内容保存在 `file1_sorted` 文件中。但如果使用 `sponge` 命令，你可以在不创建新文件（即 `file1_sorted`）的情况下完成同样的任务，命令如下：

```
$ sort file1 | sponge file1
```

那么，让我们检查一下文件内容是否已经按照字母顺序排序：

```
$ cat file1
I
Me
Us
We
You
```

看到了吧？并不需要创建新文件。在脚本编程中，这非常有用。另一个好消息是，如果待写入的文件已经存在，`sponge` 会保持其<ruby>权限信息<rt>permissions</rt></ruby>不变。

#### ts 实用程序

正如名称所示，`ts` 命令在每一行输出的行首增加<ruby>时间戳<rt>timestamp</rt></ruby>。

查看如下命令的输出：

```
$ ping -c 2 localhost
PING localhost(localhost.localdomain (::1)) 56 data bytes
64 bytes from localhost.localdomain (::1): icmp_seq=1 ttl=64 time=0.055 ms
64 bytes from localhost.localdomain (::1): icmp_seq=2 ttl=64 time=0.079 ms

--- localhost ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1018ms
rtt min/avg/max/mdev = 0.055/0.067/0.079/0.012 ms
```

下面，结合 `ts` 实用程序运行同样地命令：

```
$ ping -c 2 localhost | ts
Aug 21 13:32:28 PING localhost(localhost (::1)) 56 data bytes
Aug 21 13:32:28 64 bytes from localhost (::1): icmp_seq=1 ttl=64 time=0.063 ms
Aug 21 13:32:28 64 bytes from localhost (::1): icmp_seq=2 ttl=64 time=0.113 ms
Aug 21 13:32:28
Aug 21 13:32:28 --- localhost ping statistics ---
Aug 21 13:32:28 2 packets transmitted, 2 received, 0% packet loss, time 4ms
Aug 21 13:32:28 rtt min/avg/max/mdev = 0.063/0.088/0.113/0.025 ms
```

对比输出可以看出，`ts` 在每一行行首增加了时间戳。下面给出另一个例子：

```
$ ls -l | ts
Aug 21 13:34:25 total 120
Aug 21 13:34:25 drwxr-xr-x 2 sk users 12288 Aug 20 20:05 Desktop
Aug 21 13:34:25 drwxr-xr-x 2 sk users 4096 Aug 10 18:44 Documents
Aug 21 13:34:25 drwxr-xr-x 24 sk users 12288 Aug 21 13:06 Downloads
[...]
```

#### vidir 实用程序

`vidir` 实用程序可以让你使用 `vi` 编辑器（或其它 `$EDITOR` 环境变量指定的编辑器）编辑指定目录的内容。如果没有指定目录，`vidir` 会默认编辑你当前的目录。

下面的命令编辑 `Desktop` 目录的内容：

```
$ vidir Desktop/
```

![vidir][2]

上述命令使用 `vi` 编辑器打开了指定的目录，其中目录内的文件都会对应一个数字。下面你可以按照 `vi` 的操作方式来编辑目录中的这些文件：例如，删除行意味着删除目录中对应的文件，修改行中字符串意味着对文件进行重命名。

你也可以编辑子目录。下面的命令会编辑当前目录及所有子目录：

```
$ find | vidir -
```

请注意命令结尾的 `-`。如果 `-` 被指定为待编辑的目录，`vidir` 会从标准输入读取一系列文件名，列出它们让你进行编辑。

如果你只想编辑当前目录下的文件，可以使用如下命令：

```
$ find -type f | vidir -
```

只想编辑特定类型的文件，例如 `.PNG` 文件？你可以使用如下命令：

```
$ vidir *.png
```

这时命令只会编辑当前目录下以 `.PNG` 为后缀的文件。

#### vipe 实用程序

`vipe` 命令可以让你使用默认编辑器接收 Unix 管道输入，编辑之后使用管道输出供下一个程序使用。

执行下面的命令会打开 `vi` 编辑器（当然是我默认使用的编辑器），你可以编辑 `echo` 命令的管道输入（即 “Welcome to OSTechNix”），最后将编辑过的内容输出到终端中。

```
$ echo "Welcome to OSTechNIx" | vipe
Hello World
```

从上面的输出可以看出，我通过管道将 “Welcome to OSTechNix” 输入到 `vi` 编辑器中，将内容编辑为 “Hello World”，最后显示该内容。

好了，就介绍这么多吧。我只介绍了一小部分实用程序，而 `moreutils` 包含更多有用的实用程序。我在文章开始的时候已经列出目前 `moreutils` 软件包内包含的实用程序，你可以通过 `man` 帮助页面获取更多相关命令的细节信息。举个例子，如果你想了解 `vidir` 命令，请运行：

```
$ man vidir
```

希望这些内容对你有所帮助。我还将继续分享其它有趣且实用的指南，如果你认为这些内容对你有所帮助，请分享到社交网络或专业圈子，也欢迎你支持 OSTechNix 项目。

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/moreutils-collection-useful-unix-utilities/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/08/sk@sk_001-1.png
