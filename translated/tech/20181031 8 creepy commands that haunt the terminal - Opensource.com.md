8 个在终端中存在的诡异命令 | Opensource.com
======

欢迎来到 Linux 更诡异的一面。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/halloween_bag_bat_diy.jpg?itok=24M0lX25)

又是一年中的这个时候：天气变冷了、树叶变色了，各处的孩子都化妆成了小鬼、妖精和僵尸。但你知道吗, Unix (和 Linux) 和它的各个分支也充满了令人毛骨悚然的东西？让我们快速浏览一下我们所熟悉和喜爱的操作系统的一些诡异的方面

### 守护进程

如果没有系统中的各种守护进程，那么 Unix 就没什么不同。`守护进程`啊hi运行在后台的进程，并为用户和操作系统本身提供有用的服务。想想 SSH、FTP、HTTP 等等。

### 僵尸进程

不时出现的僵尸进程是一种被杀死但是拒绝离开的进程。当它出现时，你只有选择可用的工具来调度它。僵尸进程通常表明产生它的进程出现了问题。

### kill

你不仅可以使用 `kill` 调度一个僵尸进程，你还可以用它杀死任何对你系统产生负面影响的进程。有一个使用太多 RAM 或 CPU 周期的进程？使用 `kill` 命令杀死它。

### cat

`cat` 和猫科动物无关，但是与文件操作有关：`cat` 是 “concatenate” 的缩写。你甚至可以使用这个方便的命令来查看文件的内容。

### tail


当你想要查看文件中最后 n 行时，`tail` 命令很有用。当你想要监控一个文件时，它也很棒。

### which

不是原来的 which，而是打印传递给它的命令所在文件位置的命令。例如，`which python` 将在你系统上打印每个版本的 Python 的位置

### crypt

`crypt` 命令，现在称为 `mcrypt`，当你想要加密文件的内容时，它是很方便的，这样除了你之外没有人可以读取它。像大多数 Unix 命令一样，你可以单独使用 `crypt` 或在系统脚本中调用它。

### shred

当你不仅要删除文件还想要确保没有人能够恢复它时，`shred` 命令很方便。使用 `rm` 命令删除文件是不够的。你还需要覆盖该文件以前占用的空间。这就是 `shred` 的用武之地。

这些只是你会在 Unix 中发现的一部分诡异的东西。你还知道其他诡异的命令么？请随时告诉我。

万圣节快乐！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/spookier-side-unix-linux

作者：[Patrick H.Mullins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
[b]: https://github.com/lujun9972
