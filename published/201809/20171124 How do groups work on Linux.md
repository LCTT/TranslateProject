“用户组”在 Linux 上到底是怎么工作的？
========

嗨！就在上周，我还自认为对 Linux 上的用户和组的工作机制了如指掌。我认为它们的关系是这样的：

1.  每个进程都属于一个用户（比如用户 `julia`）
2.  当这个进程试图读取一个被某个组所拥有的文件时， Linux 会 
    a. 先检查用户`julia` 是否有权限访问文件。（LCTT 译注：此处应该是指检查文件的所有者是否就是 `julia`）
    b. 检查 `julia` 属于哪些组，并进一步检查在这些组里是否有某个组拥有这个文件或者有权限访问这个文件。
3.  如果上述 a、b 任一为真（或者“其它”位设为有权限访问），那么这个进程就有权限访问这个文件。

比如说，如果一个进程被用户 `julia` 拥有并且 `julia` 在`awesome` 组，那么这个进程就能访问下面这个文件。

```
r--r--r-- 1 root awesome     6872 Sep 24 11:09 file.txt
```

然而上述的机制我并没有考虑得非常清楚，如果你硬要我阐述清楚，我会说进程可能会在**运行时**去检查 `/etc/group` 文件里是否有某些组拥有当前的用户。

### 然而这并不是 Linux 里“组”的工作机制

我在上个星期的工作中发现了一件有趣的事，事实证明我前面的理解错了，我对组的工作机制的描述并不准确。特别是 Linux **并不会**在进程每次试图访问一个文件时就去检查这个进程的用户属于哪些组。

我在读了《[Linux 编程接口][1]》这本书的第九章（“进程资格”）后才恍然大悟（这本书真是太棒了），这才是组真正的工作方式！我意识到之前我并没有真正理解用户和组是怎么工作的，我信心满满的尝试了下面的内容并且验证到底发生了什么，事实证明现在我的理解才是对的。

### 用户和组权限检查是怎么完成的

现在这些关键的知识在我看来非常简单! 这本书的第九章上来就告诉我如下事实：用户和组 ID 是**进程的属性**，它们是：

*   真实用户 ID 和组 ID； 
*   有效用户 ID 和组 ID；
*   保存的 set-user-ID 和保存的 set-group-ID；
*   文件系统用户 ID 和组 ID（特定于 Linux);
*   补充的组 ID；

这说明 Linux **实际上**检查一个进程能否访问一个文件所做的组检查是这样的：

*   检查一个进程的组 ID 和补充组 ID（这些 ID 就在进程的属性里，**并不是**实时在 `/etc/group` 里查找这些 ID）
*   检查要访问的文件的访问属性里的组设置
*   确定进程对文件是否有权限访问（LCTT 译注：即文件的组是否是以上的组之一）

通常当访问控制的时候使用的是**有效**用户/组 ID，而不是**真实**用户/组 ID。技术上来说当访问一个文件时使用的是**文件系统**的 ID，它们通常和有效用户/组 ID 一样。（LCTT 译注：这句话针对 Linux 而言。）

### 将一个用户加入一个组并不会将一个已存在的进程（的用户）加入那个组

下面是一个有趣的例子：如果我创建了一个新的组：`panda` 组并且将我自己（`bork`）加入到这个组，然后运行 `groups` 来检查我是否在这个组里：结果是我（`bork`）竟然不在这个组？！

```
bork@kiwi~> sudo addgroup panda
Adding group `panda' (GID 1001) ...
Done.
bork@kiwi~> sudo adduser bork panda
Adding user `bork' to group `panda' ...
Adding user bork to group panda
Done.
bork@kiwi~> groups
bork adm cdrom sudo dip plugdev lpadmin sambashare docker lxd

```

`panda` 并不在上面的组里！为了再次确定我们的发现，让我们建一个文件，这个文件被 `panda` 组拥有，看看我能否访问它。

```
$  touch panda-file.txt
$  sudo chown root:panda panda-file.txt
$  sudo chmod 660 panda-file.txt
$  cat panda-file.txt
cat: panda-file.txt: Permission denied
```

好吧，确定了，我（`bork`）无法访问 `panda-file.txt`。这一点都不让人吃惊，我的命令解释器并没有将 `panda` 组作为补充组 ID，运行 `adduser bork panda` 并不会改变这一点。

### 那进程一开始是怎么得到用户的组的呢？

这真是个非常令人困惑的问题，对吗？如果进程会将组的信息预置到进程的属性里面，进程在初始化的时候怎么取到组的呢？很明显你无法给你自己指定更多的组（否则就会和 Linux 访问控制的初衷相违背了……）

有一点还是很清楚的：一个新的进程是怎么从我的命令行解释器（`/bash/fish`）里被**执行**而得到它的组的。（新的）进程将拥有我的用户 ID（`bork`），并且进程属性里还有很多组 ID。从我的命令解释器里执行的所有进程是从这个命令解释器里 `fork()` 而来的，所以这个新进程得到了和命令解释器同样的组。

因此一定存在一个“第一个”进程来把你的组设置到进程属性里，而所有由此进程而衍生的进程将都设置这些组。而那个“第一个”进程就是你的<ruby>登录程序<rt>login shell</rt></ruby>，在我的笔记本电脑上，它是由 `login` 程序（`/bin/login`）实例化而来。登录程序以 root 身份运行，然后调用了一个 C 的库函数 —— `initgroups` 来设置你的进程的组（具体来说是通过读取 `/etc/group` 文件），因为登录程序是以 root 运行的，所以它能设置你的进程的组。

###  让我们再登录一次

好了！假如说我们正处于一个登录程序中，而我又想刷新我的进程的组设置，从我们前面所学到的进程是怎么初始化组 ID 的，我应该可以通过再次运行登录程序来刷新我的进程组并启动一个新的登录命令！

让我们试试下边的方法：

```
$ sudo login bork
$ groups
bork adm cdrom sudo dip plugdev lpadmin sambashare docker lxd panda
$ cat panda-file.txt # it works! I can access the file owned by `panda` now!
```

当然，成功了！现在由登录程序衍生的程序的用户是组 `panda` 的一部分了！太棒了！这并不会影响我其他的已经在运行的登录程序（及其子进程），如果我真的希望“所有的”进程都能对 `panda` 组有访问权限。我必须完全的重启我的登录会话，这意味着我必须退出我的窗口管理器然后再重新登录。（LCTT 译注：即更新进程树的树根进程，这里是窗口管理器进程。）

### newgrp 命令

在 Twitter 上有人告诉我如果只是想启动一个刷新了组信息的命令解释器的话，你可以使用 `newgrp`（LCTT 译注：不启动新的命令解释器），如下：

```
sudo addgroup panda
sudo adduser bork panda
newgrp panda # starts a new shell, and you don't have to be root to run it!
```

你也可以用 `sg panda bash` 来完成同样的效果，这个命令能启动一个`bash` 登录程序，而这个程序就有 `panda` 组。

### seduid 将设置有效用户 ID

其实我一直对一个进程如何以 `setuid root` 的权限来运行意味着什么有点似是而非。现在我知道了，事实上所发生的是：`setuid` 设置了 
“有效用户 ID”!  如果我（`julia`）运行了一个 `setuid root` 的进程（ 比如 `passwd`），那么进程的**真实**用户 ID 将为 `julia`，而**有效**用户 ID 将被设置为 `root`。

`passwd` 需要以 root 权限来运行，但是它能看到进程的真实用户 ID 是 `julia` ，是 `julia` 启动了这个进程，`passwd` 会阻止这个进程修改除了 `julia` 之外的用户密码。

### 就是这些了！

在《[Linux 编程接口][1]》这本书里有很多 Linux 上一些功能的罕见使用方法以及 Linux 上所有的事物到底是怎么运行的详细解释，这里我就不一一展开了。那本书棒极了，我上面所说的都在该书的第九章，这章在 1300 页的书里只占了 17 页。

我最爱这本书的一点是我只用读 17 页关于用户和组是怎么工作的内容，而这区区 17 页就能做到内容完备、详实有用。我不用读完所有的 1300 页书就能得到有用的东西，太棒了！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/11/20/groups/

作者：[Julia Evans][a]
译者：[DavidChen](https://github.com/DavidChenLiang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/
[1]:http://man7.org/tlpi/
