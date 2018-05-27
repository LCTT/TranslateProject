如何在无响应的 Linux 系统中杀掉最大的进程
======
![](https://www.ostechnix.com/wp-content/uploads/2017/11/Kill-The-Largest-Process-720x340.png)

作为一名博客作者，我收藏了很多博客、网站和论坛用来标记 Linux 和 Unix 相关的内容。有时候，我在浏览器中开启了非常多的标签页，导致操作系统会无响应好几分钟。我不能移动我的鼠标去杀掉一个进程或关闭任何开启的标签页。在这种情况下，我别无选择，只能强制重启系统。当然我也用了 **OneTab** （译者注：OneTab 是一个 Chrome 的 Extension, 可以将标签页转化成一个列表保存。）和 **Greate Suspender** （译者注：Great Suspender 是一个 Chrome 的 Extension， 可以自动冻结标签页）这样浏览器拓展，但它们在这里也起不到太大的作用。 我经常耗尽我的内存。而这就是 **Early OOM** 起作用的时候了。在情况严重，它会杀掉一个未响应系统中的最大的进程。Early OOM 每秒会检测可用内存和空余交换区 10 次，一旦两者都低于 10%，它就会把最大的进程杀死。 

### 为什么用 Early OOM？为什么不用系统内置的 OOM killer？

在继续讨论下去之前，我想先简短的介绍下 OOM killer，也就是 **O** ut **O** f **M** emory killer。OOM killer 是一个由内核在可用内存非常低的时候使用的进程。它的主要任务是不断的杀死进程，直到释放出足够的内存，是内核正在运行的进程的其余部分能顺利运行。OOM killer 会找到系统中最不重要并且能释放出最多内存的进程，然后杀掉他们。在 **/proc** 目录下的 **pid** 目录中，我们可以看到每个进程的 oom_score。

示例：
```
$ cat /proc/10299/oom_score
1
```

一个进程的 oom_score 的值越高，这个进程越有可能在系统内存耗尽的时候被 OOM killer 杀死。

Early OOM 的开发者表示，相对于内置的 OOM killer，Early OOM 有一个很大的优点。就像我之前说的那样，OOM killer 会杀掉 oom_score 最高的进程，而这也导致 Chrome 浏览器总是会成为第一个被杀死的进程。为了避免这种情况发生，Early OOM 使用 **/proc/*/status** 而不是 **echo f > /proc/sysrq-trigger**（译者注：这条命令会调用 OOM killer 杀死进程）。开发者还表示，手动触发 OOM killer 在最新版本的 Linux 内核中很可能不会起作用。

### 安装 Early OOM

Early OOM 在AUR（Arch User Repository）中可以被找到，所以你可以在 Arch 和它的衍生版本中使用任何 AUR 工具安装它。

使用 [**Pacaur**][1]：
```
pacaur -S earlyoom
```

使用 [**Packer**][2]：
```
packer -S earlyoom
```

使用 [**Yaourt**][3]：
```
yaourt -S earlyoom
```

启用并启动 Early OOM daemon：
```
sudo systemctl enable earlyoom
```
```
sudo systemctl start earlyoom
```

在其它的 Linux 发行版中，可以按如下方法编译安装它
```
git clone https://github.com/rfjakob/earlyoom.git
cd earlyoom
make
sudo make install
```

### Early OOM - Kill The Largest Process In An Unresponsive Linux System杀掉无响应 Linux 系统中的最大的进程

运行如下命令启动 Early OOM：
```
earlyoom
```

如果是通过编译源代码安装的， 运行如下命令启动 Early OOM：
```
./earlyoom
```

示例输出：
```
earlyoom 0.12
mem total: 3863 MiB, min: 386 MiB (10 %)
swap total: 2047 MiB, min: 204 MiB (10 %)
mem avail: 1770 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1773 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1772 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1773 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1772 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1773 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1771 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1773 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1784 MiB (46 %), swap free: 2047 MiB (99 %)
[...]
```

就像你在上面的输出中可以看到的，Early OOM 将会显示你有多少内存和交换区，以及有多少可用的内存和交换区。记住它会一直保持运行，直到你按下 CTRL+C。

如果可用的内存和交换区大小都低于 10%，Early OOM 将会自动杀死最大的进程，直到系统有足够的内存可以流畅的运行。你也可以根据你的需求配置最小百分比值。

设置最小的可用内存百分比，运行：
```
earlyoom -m <PERCENT_HERE>
```

设置最小可用交换区百分比, 运行:
```
earlyoom -s <PERCENT_HERE>
```

在帮助部分，可以看到更多详细信息：
```
$ earlyoom -h
earlyoom 0.12
Usage: earlyoom [OPTION]...

 -m PERCENT set available memory minimum to PERCENT of total (default 10 %)
 -s PERCENT set free swap minimum to PERCENT of total (default 10 %)
 -M SIZE set available memory minimum to SIZE KiB
 -S SIZE set free swap minimum to SIZE KiB
 -k use kernel oom killer instead of own user-space implementation
 -i user-space oom killer should ignore positive oom_score_adj values
 -d enable debugging messages
 -v print version information and exit
 -r INTERVAL memory report interval in seconds (default 1), set to 0 to
 disable completely
 -p set niceness of earlyoom to -20 and oom_score_adj to -1000
 -h this help text
```

现在，你再也不用担心内存消耗最高的进程了。希望这能给你帮助。更多的好内容将会到来，敬请期待。

谢谢！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/kill-largest-process-unresponsive-linux-system/

作者：[Aditya Goturu][a]
译者：[cizezsy](https://github.com/cizezsy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:https://www.ostechnix.com/install-pacaur-arch-linux/
[2]:https://www.ostechnix.com/install-packer-arch-linux-2/
[3]:https://www.ostechnix.com/install-yaourt-arch-linux/
