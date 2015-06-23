命令行艺术
================================================================================
- [基础](#basics)
- [日常使用](#everyday-use)
- [处理文件和数据](#processing-files-and-data)
- [系统调试](#system-debugging)
- [单行程序](#one-liners)
- [晦涩难懂，但却有用](#obscure-but-useful)
- [更多资源](#more-resources)
- [免责声明](#disclaimer)


![curl -s 'https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md' | egrep -o '`\w+`' | tr -d '`' | cowsay -W50](https://github.com/jlevy/the-art-of-command-line/blob/master/cowsay.png)

流畅地使用命令行是一个常被忽略的技能，或被认为是神秘的奥义。但是，它会以明显而微妙的方式改善你作为工程师的灵活度和生产力。这是我在Linux上工作时发现的有用的命令行使用小窍门和笔记的精粹。有些小窍门是很基础的，而有些是相当地特别、相当地复杂、或者相当地晦涩难懂。这一页不长，但是如果你可以使用并记得这里的所有项目，那么你知道不少了。

其中大部分[最初](http://www.quora.com/What-are-some-lesser-known-but-useful-Unix-commands)[出现](http://www.quora.com/What-are-the-most-useful-Swiss-army-knife-one-liners-on-Unix)在[Quora](http://www.quora.com/What-are-some-time-saving-tips-that-every-Linux-user-should-know)上，但是考虑到利益，似乎更值得使用Github，这上面的人比我更能提出改进建议。如果你看到一个错误，或者更好的某种东西，请提交问题或PR！

范围：

- 目标宽广而简洁。每个小窍门在某种情形下都很基础，或者比替代品大大节省时间。
- 这是为Linux写的。大多数，但并非全部项目可以同样应用到MacOS（或者甚至Cygwin）。
- 焦点集中在交互的Bash上，尽管大多数小窍门也可以应用到其它shell，以及常规Bash脚本。
- 意在作最少说明，要想期待更多，你可以使用`man`、使用`apt-get`/`yum`/`dnf`来安装，还可以使用Google来获得更多背景知识。


## 基础

- 学习基本Bash技能。实际上，键入`man bash`，然后至少浏览一遍所有东西；它很容易理解，没那么长。其它shell会很好，但是Bash很强大，而且总是可用（*只*学习zsh、fish之类，而在你自己的笔记本上测试时，会在很多情形下受到限制，比如使用现存的服务器）。

- 至少学好一种基于文本的编辑器。理想的一个是Vim（`vi`），因为在终端中用于随机编辑时它没有竞争者（即使大多数时候你使用Emacs，一个大型的IDE，或一个现代的时髦编辑器）。

- 学习使用`>`和`<`来进行输出和输入重定向，以及使用`|`来管道重定向，学习关于stdout和stderr的东西。

- 学习`*`（也许还有`?`和`{`...`}`）文件通配扩展和应用，以及双引号`"`和单引号`'`之间的区别。（更多内容请参看下面关于变量扩展部分）。

- 熟悉Bash作业管理：`&`， **ctrl-z**， **ctrl-c**， `jobs`， `fg`， `bg`， `kill`等等。

- 掌握`ssh`，以及通过`ssh-agent`，`ssh-add`等进行无密码验证的基础技能。

- 基本的文件管理：`ls`和`ls -l`（特别是，知道`ls -l`各个栏目的意义），`less`， `head`， `tail` 和`tail -f`（或者更好的`less +F`），`ln`和`ln -s`（知道硬链接和软链接的区别，以及硬链接相对于软链接的优势），`chown`，`chmod`，`du`（用于查看磁盘使用率的快速摘要：`du -sk *`），`df`, `mount`。

- 基本的网络管理： `ip`或`ifconfig`，`dig`。

- 熟知正则表达式，以及各种标识来使用`grep`/`egrep`。`-i`，`-o`，`-A`和`-B`选项值得掌握。

- 学会使用`apt-get`，`yum`或`dnf`（这取决于你的发行版）来查找并安装软件包。确保你可以用`pip`来安装基于Python的命令行工具（下面的一些东西可以很容易地通过`pip`安装）。


## 日常使用

- 在Bash中，使用**ctrl-r**来搜索命令历史。

- 在Bash中，使用 **ctrl-w** 来删除最后的单词，使用 **ctrl-u** 来删除整行。使用 **alt-b** 和 **alt-f** 来逐词移动，以及使用**ctrl-k**来杀死到行尾。请使用 `man readline` 来查看Bash中所有默认的键绑定，有很多。例如，**alt-.** 可以循环显示先前的参数，而**alt-** 扩展通配。

- 返回先前的工作目录： `cd -`

- 如果你命令输入到一半，但是改变主意了，可以敲 **alt-#** 来添加一个 `#` 到开头，然后将该命令作为注释输入（或者使用 **ctrl-a**， **#**，**enter**）。然后，你可以在后面通过命令历史来返回到该命令。 

- 使用`xargs`（或`parallel`），它很强大。注意，你可以控制每行（`-L`）执行多少个项目，而言可以使用平行结构（`-P`）。如果你不确定它是否会做正确的事情，可以首先使用`xargs echo`。同时，使用`-I{}`也很方便。样例：
```bash
      find . -name '*.py' | xargs grep some_function
      cat hosts | xargs -I{} ssh root@{} hostname
```

- `pstree -p`对于现实进程树很有帮助。

- 使用`pgrep`和`pkill`来按名称查找或用信号通知进程（`-f`很有帮助）。

- 掌握各种可以发送给进程的信号。例如，要挂起进程，可以使用`kill -STOP [pid]`。完整的列表可以查阅see `man 7 signal`。

- 如果你想要一个后台进程一直保持运行，使用`nohup`或`disown`。

- 通过`netstat -lntp`检查什么进程在监听。

- `lsof`来查看打开的套接口和文件。

- 在Bash脚本中，使用`set -x`调试脚本输出。每当可能时，使用严格模式。使用`set -e`在遇到错误时退出。也可以使用`set -o pipefail`，对错误严格（虽然该话题有点敏感）。对于更复杂的脚本，也可以使用`trap`。

- 在Bash脚本中，子shell（写在括号中的）是集合命令的便利的方式。一个常见的例子是临时移动到一个不同的工作目录，如：
```bash
      # do something in current dir
      (cd /some/other/dir; other-command)
      # continue in original dir
```

- 注意，在Bash中有大量各种各样的变量扩展。检查一个变量是否存在：`${name:?error message}`。例如，如果一个Bash脚本要求一个单一参数，只需写`input_file=${1:?usage: $0 input_file}`。算术扩展：`i=$(( (i + 1) % 5 ))`。序列：`{1..10}`。修剪字符串：`${var%suffix}`和`${var#prefix}`。例如，if `var=foo.pdf`, then `echo ${var%.pdf}.txt` prints `foo.txt`。

- 命令的输出可以通过`<(some command)`作为一个文件来处理。例如，将本地的`/etc/hosts`和远程的比较：
```sh
      diff /etc/hosts <(ssh somehost cat /etc/hosts)
```

- 知道Bash中的“嵌入文档”，就像在`cat <<EOF ...`中。

- 在Bash中，通过：`some-command >logfile 2>&1`同时重定向标准输出和标准错误。通常，要确保某个命令不会再标准输入中遗留有打开的文件句柄，将它捆绑到你所在的终端，添加`</dev/null`是个不错的做法。

- 使用带有十六进制和十进制值的`man ascii`作为一个好的ASCII表。对于常规编码信息，`man unicode`，`man utf-8`和`man latin1`将很有帮助。

- 使用`screen`或`tmux`来多路输出屏幕，这对于远程ssh会话尤为有用，使用它们来分离并重连到会话。另一个只用于保持会话的最小可选方案是`dtach`。

- 在ssh中，知道如何使用`-L`或`-D`（偶尔也用`-R`）来进行端口移植是很有用的，如从一台远程服务器访问网站。

- 为你的ssh配置进行优化很有用；例如，这个`~/.ssh/config`包含了可以避免在特定网络环境中连接被丢弃的情况的设置，使用压缩（这对于通过低带宽连接使用scp很有用），以及使用一个本地控制文件来开启多隧道到同一台服务器：
```
      TCPKeepAlive=yes
      ServerAliveInterval=15
      ServerAliveCountMax=6
      Compression=yes
      ControlMaster auto
      ControlPath /tmp/%r@%h:%p
      ControlPersist yes
```

-  其它一些与ssh相关的选项对安全很敏感，请小心开启，如各个子网或主机，或者在信任的网络中：`StrictHostKeyChecking=no`， `ForwardAgent=yes`

- 要获得八进制格式的文件的权限，这对于系统配置很有用而`ls`又没法查看，而且也很容易搞得一团糟，可以使用像这样的东西
```sh
      stat -c '%A %a %n' /etc/timezone
```

- 对于从另一个命令的输出结果中交互选择值，可以使用[`percol`](https://github.com/mooz/percol)。

- For interaction with files based on the output of another command (like `git`), use `fpp` ([PathPicker](https://github.com/facebook/PathPicker)).对于基于另一个命令（如`git`）输出的文件交互，可以使用`fpp` ([补丁选择器](https://github.com/facebook/PathPicker))。

- 对于为当前目录（及子目录）中的所有文件构建一个简单的网络服务器，让网络中的任何人都可以获取，可以使用：
`python -m SimpleHTTPServer 7777` (对于端口7777和Python 2)。


## 处理文件和数据

- 要在当前目录中按名称定位文件，`find . -iname '*something*'`（或者相类似的）。要按名称查找任何地方的文件，使用`locate something`（但请记住，`updatedb`可能还没有索引最近创建的文件）。

- 对于通过源或数据文件进行的常规搜索（比`grep -r`更高级），使用[`ag`](https://github.com/ggreer/the_silver_searcher)。

- 要将HTML转成文本：`lynx -dump -stdin`

- 对于Markdown、HTML，以及所有类型的文档转换，可以试试[`pandoc`](http://pandoc.org/)。

- 如果你必须处理XML，`xmlstarlet`虽然有点老旧，但是很好用。

- 对于JSON，使用`jq`。

- 对于Excel或CSV文件，[csvkit](https://github.com/onyxfish/csvkit)提供了`in2csv`，`csvcut`，`csvjoin`，`csvgrep`等工具。

- 对于亚马逊 S3 [`s3cmd`](https://github.com/s3tools/s3cmd)会很方便，而[`s4cmd`](https://github.com/bloomreach/s4cmd)则更快速。亚马逊的[`aws`](https://github.com/aws/aws-cli)则是其它AWS相关任务的必备。

- 知道`sort`和`uniq`，包括uniq的`-u`和`-d`选项——参见下面的单行程序。

- 掌握`cut`，`paste`和`join`，用于处理文本文件。很多人会使用`cut`，但常常忘了`join`。

- 知道本地环境以微妙的方式对命令行工具产生大量的影响，包括排序的顺序（整理）以及性能。大多数Linux安装会设置`LANG`或其它本地环境变量为本地设置，比如像美国英语。但是，你要明白，如果改变了本地环境，那么排序也将改变。而且i18n例行程序可以让排序或其它命令的运行慢*好多倍*。在某些情形中（如像下面那样的设置操作或唯一性操作），你完全可以安全地忽略慢的i18n例行程序，然后使用传统的基于字节的排序顺序`export LC_ALL=C`。

- 知道基本的用以数据改动的`awk`和`sed`技能。例如，计算某个文本文件第三列所有数字的和：`awk '{ x += $3 } END { print x }'`。这可能比Python的同等操作要快3倍，而且要短3倍。

- 在恰当的地方对所有出现的某个字符串进行替换，在一个或多个文件中：
```sh
      perl -pi.bak -e 's/old-string/new-string/g' my-files-*.txt
```

- 要立即根据某个样式对大量文件重命名，使用`rename`。对于复杂的重命名，[`repren`](https://github.com/jlevy/repren)可以帮助你达成。
```sh
      # Recover backup files foo.bak -> foo:
      rename 's/\.bak$//' *.bak
      # Full rename of filenames, directories, and contents foo -> bar:
      repren --full --preserve-case --from foo --to bar .
```

- 使用`shuf`来从某个文件中随机选择随机的行。

- 知道`sort`的选项。知道这些键是怎么工作的（`-t`和`-k`）。特别是，注意你需要写`-k1,1`来只通过第一个字段排序；`-k1`意味着根据整行排序。

- 稳定排序（`sort -s`）会很有用。例如，要首先按字段2排序，然后再按字段1排序，你可以使用`sort -k1,1 | sort -s -k2,2`

- 如果你曾经需要在Bash命令行中写一个标签文字（如，用于-t参数的排序），按**ctrl-v** **[Tab]**，或者写`$'\t'`（后面的更好，因为你可以复制/粘贴）。

- 对于二进制文件，使用`hd`进行简单十六进制转储，以及`bvi`用于二进制编辑。

- 还是用于二进制文件，`strings`（加上`grep`等）可以让你找出文本的二进制数。

- 要转换文本编码，试试`iconv`吧，或者对于更高级的使用`uconv`；它支持一些高级的统一字符标准的东西。例如，这个命令可以将所有重音符号转成小写并（通过扩展和丢弃）移除：
```sh
      uconv -f utf-8 -t utf-8 -x '::Any-Lower; ::Any-NFD; [:Nonspacing Mark:] >; ::Any-NFC; ' < input.txt > output.txt
```

- 要将文件分割成各个部分，来看看`split`（按大小分割）和`csplit`（按格式分割）吧。

- 使用`zless`，`zmore`，`zcat`和`zgrep`来操作压缩文件。


## 系统调试

- 对于网络调试，`curl`和`curl -I`很方便灵活，或者业可以使用它们的同行`wget`，或者更现代的[`httpie`](https://github.com/jakubroztocil/httpie)。

- 要知道disk/cpu/network的状态，使用`iostat`，`netstat`，`top`（或更好的`htop`）和（特别是）`dstat`。它们对于快速获知系统中发生的状况很好用。

- 对于更深层次的系统总览，可以使用[`glances`](https://github.com/nicolargo/glances)。它会在一个终端窗口中为你呈现几个系统层次的统计数据，对于快速检查各个子系统很有帮助。

- 要知道内存状态，可以运行`free`和`vmstat`，看懂它们的输出结果吧。特别是，要知道“cached”值是Linux内核作为文件缓存所占有的内存，因此，要有效地统计“free”值。

- 系统调试是一件截然不同的事，但是对于Oracle系统以及其它一些JVM而言，不过是一个简单的小把戏，你可以运行`kill -3 <pid>`，然后一个完整的堆栈追踪和累积的摘要（包括分代垃圾收集细节，这里头信息量很大）将被转储到stderr/logs.Java。

- 使用`mtr`作为更好的路由追踪，来识别网络问题。

- 对于查看磁盘满载的原因，`ncdu`会比常规命令如`du -sh *`更节省时间。

- 要查找占用带宽的套接口和进程，试试`iftop`或`nethogs`吧。

- （Apache附带的）`ab`工具对于临时应急检查网络服务器性能很有帮助。对于更复杂的负载测试，可以试试`siege`。

- 对于更重型的网络调试，可以用`wireshark`，`tshark`或`ngrep`。

- 掌握`strace`和`ltrace`。如果某个程序失败、挂起或崩溃，而你又不知道原因，或者如果你想要获得性能的大概信息，这些工具会很有帮助。注意，分析选项（`-c`）和关联运行进程的能力（`-p`）。

- 掌握`ldd`来检查共享库等。

- 知道如何使用`gdb`来连接到一个运行着的进程并获取其堆栈追踪信息。

- 使用`/proc`。当调试当前注目问题时，它有时候出奇地有帮助。样例：`/proc/cpuinfo`，`/proc/xxx/cwd`，`/proc/xxx/exe`，`/proc/xxx/fd/`，`/proc/xxx/smaps`。

- 当调试过去某个东西出错时，`sar`会非常有帮助。它显示了CPU、内存、网络等的历史统计数据。

- 对于更深层的系统和性能分析，看看`stap` ([SystemTap](https://sourceware.org/systemtap/wiki))，[`perf`](http://en.wikipedia.org/wiki/Perf_(Linux))和[`sysdig`](https://github.com/draios/sysdig)吧。

- 确认是正在使用的Linux发行版版本（大多数发行版可用）：`lsb_release -a`。

- 每当某个东西的行为异常时（可能是硬件或者驱动器问题），使用`dmesg`。


## 单行程序

将命令拼凑在一起的一些样例：

- 有时候通过`sort`/`uniq`来进行交互设置、合并，以及比较文本文件的差异时，这个例子会相当有帮助。假定`a`和`b`是已经进行唯一性处理的文本文件。这会很快，而且可以处理任意大小的文件，总计可达数千兆字节。（Sort不受内存限制，然后你可能需要使用`-T`选项来检查`/tmp`是否挂载一个容量小的root分区上。）也可参见上面关于`LC_ALL`的注解。
```sh
      cat a b | sort | uniq > c   # c is a union b
      cat a b | sort | uniq -d > c   # c is a intersect b
      cat a b b | sort | uniq -u > c   # c is set difference a - b
```

- 对某个文本文件的第三列中所有数据进行求和（该例子可能比同等功能的Python要快3倍，而且代码也少于其3倍）：
```sh
      awk '{ x += $3 } END { print x }' myfile
```

- 如果想要查看某个文件树的大小/日期，该例子就像一个递归`ls -l`，但是比`ls -lR`要更容易读懂：
```sh
      find . -type f -ls
```

- 只要可以，请使用Use `xargs`或`parallel`。注意，你可以控制每行（`-L`）执行多少个项目，也可同时控制并行计算（`-P`）。如果你不确定它是否会做正确的事，可以在前面加上xargs echo。同时，`-I{}`很灵便。样例：
```sh
      find . -name '*.py' | xargs grep some_function
      cat hosts | xargs -I{} ssh root@{} hostname
```

- 比如说，你有一个文本文件，像网络服务器的日志，在某些行中出现了某个特定的值，如URL中出现的`acct_id`参数。如果你想要一个针对每个`acct_id`的请求的计数器：
```sh
      cat access.log | egrep -o 'acct_id=[0-9]+' | cut -d= -f2 | sort | uniq -c | sort -rn
```

- 运行该函数来获得来自文档的随机提示（解析Markdown并从中提取某个项目）：
```sh
      function taocl() {
        curl -s https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md |
          pandoc -f markdown -t html |
          xmlstarlet fo --html --dropdtd |
          xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
          xmlstarlet unesc | fmt -80
      }
```


## 晦涩难懂，但却有用

- `expr`：实施算术或布林操作，或者求正则表达式的值

- `m4`：简单宏处理器

- `screen`：强大的终端多路复用和会话保持

- `yes`：大量打印一个字符串

- `cal`：漂亮的日历

- `env`：运行一个命令（脚本中很有用）

- `look`：查找以某个字符串开头的英文单词（或文件中的行）

- `cut `和`paste`以及`join`：数据处理

- `fmt`：格式化文本段落

- `pr`：格式化文本为页/栏

- `fold`：包裹文本行

- `column`：格式化文本为栏或表

- `expand`和`unexpand`：在制表和空格间转换

- `nl`：添加行号

- `seq`：打印数字

- `bc`：计算器

- `factor`：把整数因子分解

- `gpg`：加密并为文件签名

- `toe`：terminfo条目表

- `nc`：网络调试和数据传输

- `ngrep`：查找网络层

- `dd`：在文件或设备间移动数据

- `file`：识别文件类型

- `stat`：文件信息

- `tac`：逆序打印文件

- `shuf`：从文件中随机选择行

- `comm`：逐行对比分类排序的文件

- `hd`和`bvi`：转储或编辑二进制文件

- `strings`：从二进制文件提取文本

- `tr`：字符转译或处理

- `iconv `或`uconv`：文本编码转换

- `split `和`csplit`：分割文件

- `7z`：高比率文件压缩

- `ldd`：动态库信息

- `nm`：目标文件的符号

- `ab`：网络服务器基准测试

- `strace`：系统调用调试

- `mtr`：用于网络调试的更好的路由追踪

- `cssh`：可视化并发shell

- `wireshark`和`tshark`：抓包和网络调试

- `host`和`dig`：DNS查询

- `lsof`：处理文件描述符和套接字信息

- `dstat`：有用的系统统计数据

- [`glances`](https://github.com/nicolargo/glances)：高级，多子系统概览

- `iostat`：CPU和磁盘使用率统计

- `htop`：top的改进版

- `last`：登录历史

- `w`：谁登录进来了

- `id`：用户/组身份信息

- `sar`：历史系统统计数据

- `iftop`或`nethogs`：按套接口或进程的网络使用率

- `ss`：套接口统计数据

- `dmesg`：启动和系统错误信息

- `hdparm`：SATA/ATA磁盘操作/性能

- `lsb_release`：Linux发行版信息

- `lshw`：硬件信息

- `fortune`，`ddate`和`sl`：嗯，好吧，它取决于你是否认为蒸汽机车和齐皮士引用“有用”


## 更多资源

- [超棒的shell](https://github.com/alebcay/awesome-shell): 一个shell工具和资源一览表。
- [严格模式](http://redsymbol.net/articles/unofficial-bash-strict-mode/) 用于写出更佳的shell脚本。


## 免责声明

除了非常小的任务外，其它都写出了代码供大家阅读。伴随力量而来的是责任。事实是，你*能*在Bash中做的，并不意味着是你所应该做的！；）

--------------------------------------------------------------------------------

via: https://github.com/jlevy/the-art-of-command-line

作者：[jlevy][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/jlevy
[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
