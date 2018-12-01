8 个出没于终端中的吓人命令
======

> 欢迎来到 Linux 令人毛骨悚然的一面。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/halloween_bag_bat_diy.jpg?itok=24M0lX25)

又是一年中的这个时候：天气变冷了、树叶变色了，各处的孩子都化妆成了小鬼、妖精和僵尸。（LCTT 译注：本文原发表于万圣节）但你知道吗, Unix (和 Linux) 和它们的各个分支也充满了令人毛骨悚然的东西？让我们来看一下我们所熟悉和喜爱的操作系统的一些令人毛骨悚然的一面。

### 半神（守护进程）

如果没有潜伏于系统中的各种<ruby>守护进程<rt>daemon</rt></ruby>，那么 Unix 就没什么不同。守护进程是运行在后台的进程，并为用户和操作系统本身提供有用的服务，比如 SSH、FTP、HTTP 等等。

### 僵尸（僵尸进程）

不时出现的僵尸进程是一种被杀死但是拒绝离开的进程。当它出现时，无疑你只能选择你有的工具来赶走它。僵尸进程通常表明产生它的进程出现了问题。

### 杀死（kill）

你不仅可以使用 `kill` 来干掉一个僵尸进程，你还可以用它杀死任何对你系统产生负面影响的进程。有一个使用太多 RAM 或 CPU 周期的进程？使用 `kill` 命令杀死它。

### 猫（cat）

`cat` 和猫科动物无关，但是与文件操作有关：`cat` 是 “concatenate” 的缩写。你甚至可以使用这个方便的命令来查看文件的内容。

### 尾巴（tail）

当你想要查看文件中最后 n 行时，`tail` 命令很有用。当你想要监控一个文件时，它也很棒。

### 巫师（which）

哦，不，它不是巫师（witch）的一种。而是打印传递给它的命令所在的文件位置的命令。例如，`which python` 将在你系统上打印每个版本的 Python 的位置。

### 地下室（crypt）

`crypt` 命令，以前称为 `mcrypt`，当你想要加密（encrypt）文件的内容时，它是很方便的，这样除了你之外没有人可以读取它。像大多数 Unix 命令一样，你可以单独使用 `crypt` 或在系统脚本中调用它。

### 切碎（shred）

当你不仅要删除文件还想要确保没有人能够恢复它时，`shred` 命令很方便。使用 `rm` 命令删除文件是不够的。你还需要覆盖该文件以前占用的空间。这就是 `shred` 的用武之地。

这些只是你会在 Unix 中发现的一部分令人毛骨悚然的东西。你还知道其他诡异的命令么？请随时告诉我。

万圣节快乐！（LCTT：可惜我们翻译完了，只能将恐怖的感觉延迟了 :D）

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/spookier-side-unix-linux

作者：[Patrick H.Mullins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
[b]: https://github.com/lujun9972
