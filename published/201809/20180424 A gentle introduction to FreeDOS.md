FreeDOS 的简单介绍
======
> 学习如何穿行于 C:\ 提示符下，就像上世纪 90 年代的 DOS 高手一样。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-fish-laptop-color.png?itok=vfv_Lpph)

FreeDOS 是一个古老的操作系统，但是对于多数人而言它又是陌生的。在 1994 年，我和几个开发者一起 [开发了 FreeDOS][1] —— 这是一个完整、自由、兼容 DOS 的操作系统，你可以用它来玩经典的 DOS 游戏、运行过时的商业软件或者开发嵌入式系统。任何在 MS-DOS 下工作的程序在 FreeDOS 下也可以运行。

在 1994 年，任何一个曾经使用过微软的商业版 MS-DOS 的人都会迅速地熟悉 FreeDOS。这是设计而为之的；FreeDOS 尽可能地去模仿 MS-DOS。结果，1990 年代的 DOS 用户能够直接转换到 FreeDOS。但是，时代变了。今天，开源的开发者们对于 Linux 命令行更熟悉，或者他们可能倾向于像 [GNOME][2] 一样的图形桌面环境，这导致 FreeDOS 命令行界面最初看起来像个异类。

新的用户通常会问，“我已经安装了 [FreeDOS][3]，但是如何使用呢？”。如果你之前并没有使用过 DOS，那么闪烁的 `C:\>` DOS 提示符看起来会有点不太友好，而且可能有点吓人。这份 FreeDOS 的简单介绍将带你起步。它只提供了基础：如何浏览以及如何查看文件。如果你想了解比这里提及的更多的知识，访问 [FreeDOS 维基][4]。

### DOS 提示符

首先，让我们看一下空的提示符以及它的含义。

![](https://opensource.com/sites/default/files/u128651/0-prompt.png)

DOS 是在个人电脑从软盘运行时期创建的一个“<ruby>磁盘操作系统<rt>disk operating system</rt></ruby>”。甚至当电脑支持硬盘了，在 1980 年代和 1990 年代，频繁地在不同的驱动器之间切换也是很普遍的。举例来说，你可能想将最重要的文件都备份一份拷贝到软盘中。

DOS 使用一个字母来指代每个驱动器。早期的电脑仅拥有两个软盘驱动器，他们被分配了 `A:` 和 `B:` 盘符。硬盘上的第一个分区盘符是 `C:` ，然后其它的盘符依次这样分配下去。提示符中的 `C:` 表示你正在使用第一个硬盘的第一个分区。

从 1983 年的 PC-DOS 2.0 开始，DOS 也支持目录和子目录，非常类似 Linux 文件系统中的目录和子目录。但是跟 Linux 不一样的是，DOS 目录名由 `\` 分隔而不是 `/`。将这个与驱动器字母合起来看，提示符中的 `C:\` 表示你正在 `C:` 盘的顶端或者“根”目录。

`>` 符号是提示你输入 DOS 命令的地方，就像众多 Linux shell 的 `$`。`>` 前面的部分告诉你当前的工作目录，然后你在 `>` 提示符这输入命令。

### 在 DOS 中找到你的使用方式

在 DOS 中浏览目录的基本方式和你在 Linux 命令行下的步骤非常相似。你仅需要记住少数的命令。

#### 显示一个目录

当你想要查看当前目录的内容时，使用 `DIR` 命令。因为 DOS 命令是大小写不敏感的，你也可以输入 `dir`。默认地，DOS 会显示每个文件和子目录的细节，包括了名字、扩展类型、大小以及最后一次更改的日期和时间。

![](https://opensource.com/sites/default/files/u128651/1-dir.png)

如果你不想显示单个文件大小的额外细节，你可以在 `DIR` 命令中使用 `/w` 选项来显示一个“宽”的目录列表。注意，Linux 用户使用连字号（`-`）或者双连字号（`--`）来开始命令行选项，而 DOS 使用斜线字符（`/`）。

![](https://opensource.com/sites/default/files/u128651/2-dirw.png)

你可以将特定子目录的路径名作为参数传递给 `DIR` 命令来查看它。此外，另一个与 Linux 系统的区别是 Linux 文件和目录是大小写敏感的，而 DOS 下的名称是大小写不敏感的。DOS 通常将文件和目录使用全部大写的方式显示，不过你可以等同地用小写格式来使用它们。

![](https://opensource.com/sites/default/files/u128651/3-dir-fdos.png)


#### 切换当前工作目录

一旦你能够查看一个目录的内容，你就能够“移动到”任何其它的目录。在 DOS 上，使用 `CHDIR` 命令来切换工作目录，也可以简写为 `CD`。你可以使用类似 `CD CHOICE` 的命令进入到一个子目录或者使用 `CD \FDOS\DOC\CHOICE` 进入到一个新的路径。

![](https://opensource.com/sites/default/files/u128651/5-dir-choice.png)

就像在 Linux 命令行，DOS 使用 `.` 来表示当前目录，而 `..` 表示父目录（当前目录的上一级）。你可以将这些组合起来使用。比如，`CD ..` 进入到父目录，然后 `CD ..\..` 由当前目录做两个“向上”目录级别的操作。

![](https://opensource.com/sites/default/files/u128651/11-cd.png)

FreeDOS 也从 Linux 那借鉴了一些特性：你可以使用 `CD -` 跳转回之前的工作目录。在你进入一个新的路径做完一件事之后，想要回退到之前工作状态的情况下，这会很方便。

#### 切换当前工作盘符

在 Linux 下，“磁盘”的概念是隐藏的。在 Linux 和其它 Unix 系统中，你“挂载”磁盘到一个目录，例如 `/backup`，或者系统自动帮你完成，比如 `/var/run/media/user/flashdrive`。但是 DOS 是一个相对简单的系统。使用 DOS，你必须自行更改工作磁盘。

记住 DOS 分配第一块硬盘的第一个分区为 `C:` 盘，然后这样依次分配其它盘符。在现代系统中，人们很少将硬盘分割成多个 DOS 分区；他们简单地使用整个磁盘或者尽可能多地分配给 DOS。如今 `C:` 通常是第一块硬盘，而 `D:` 通常是另一块硬盘或者 CD-ROM 驱动器。其它的网络磁盘驱动器也可以被映射到别的盘符，比如 `E:` 或者 `Z:` 或者任何你想要的组织方式。

在 DOS 下切换磁盘很容易。只要在命令行输入盘符后附加一个冒号（`:`），然后 DOS 就会切换到该工作磁盘。举例来说，在我的 [QEMU][5] 系统上，我将 `D:` 设置到我的 Linux 主目录下的一个共享目录，那里存放了各种我想测试的 DOS 应用程序和游戏的安装文件。

![](https://opensource.com/sites/default/files/u128651/8-d-dirw.png)

小心不要尝试切换到一个不存在的磁盘。DOS 可能会将它设置为工作磁盘，但是如果你尝试在那做任何事，你将会遇到略微臭名昭著的“<ruby>退出、重试、失败<rt>Abort, Retry, Fail</rt></ruby>” DOS 错误信息。

![](https://opensource.com/sites/default/files/u128651/9-e-fail.png)

### 其它可以尝试的事情

使用 `CD` 和 `DIR` 命令，你就拥有了基础的浏览 DOS 能力。这些命令允许你查找 DOS 目录并查看其他子目录和文件的存在。一旦你熟悉基础浏览操作，你还可以尝试其它的这些基础 DOS 命令：

  * `MKDIR` 或 `MD` 创建新的目录
  * `RMDIR` 或 `RD` 删除目录
  * `TREE` 以树状格式显示目录和子目录列表
  * `TYPE` 和 `MORE` 显示文件内容
  * `RENAME` 或 `REN` 重命名文件
  * `DEL` 或 `ERASE` 删除文件
  * `EDIT` 编辑文件
  * `CLS` 清除屏幕


如果这些还不够，你可以在 FreeDOS 维基上面找到[所有 DOS 命令][6]的清单。

在 FreeDOS 下，针对每个命令你都能够使用 `/?` 参数来获取简要的说明。举例来说，`EDIT /?` 会告诉你编辑器的用法和选项。或者你可以输入 `HELP` 来使用交互式帮助系统。

像任何一个 DOS 一样，FreeDOS 被认为是一个简单的操作系统。仅使用一些基本命令就可以轻松浏览 DOS 文件系统。那么，启动一个 QEMU 会话，安装 FreeDOS，然后尝试一下 DOS 命令行界面吧。也许它现在看起来就没那么吓人了。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/gentle-introduction-freedos

作者：[Jim Hall][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[icecoobe](https://github.com/icecoobe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://opensource.com/article/17/10/freedos
[2]:https://opensource.com/article/17/8/gnome-20-anniversary
[3]:http://www.freedos.org/
[4]:http://wiki.freedos.org/
[5]:https://www.qemu.org/
[6]:http://wiki.freedos.org/wiki/index.php/Dos_commands
