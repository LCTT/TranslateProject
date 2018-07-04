每个 Linux 新手都应该知道的 10 个命令
=====

> 通过这 10 个基础命令开始掌握 Linux 命令行。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah)

你可能认为你是 Linux 新手，但实际上并不是。全球互联网用户有 [3.74 亿][1]，他们都以某种方式使用 Linux，因为 Linux 服务器占据了互联网的 90%。大多数现代路由器运行 Linux 或 Unix，[TOP500 超级计算机][2] 也依赖于 Linux。如果你拥有一台 Android 智能手机，那么你的操作系统就是由 Linux 内核构建的。

换句话说，Linux 无处不在。

但是使用基于 Linux 的技术和使用 Linux 本身是有区别的。如果你对 Linux 感兴趣，但是一直在使用 PC 或者 Mac 桌面，你可能想知道你需要知道什么才能使用 Linux 命令行接口（CLI），那么你来到了正确的地方。

下面是你需要知道的基本的 Linux 命令。每一个都很简单，也很容易记住。换句话说，你不必成为比尔盖茨就能理解它们。

### 1、 ls

你可能会想：“这是（is）什么东西？”不，那不是一个印刷错误 —— 我真的打算输入一个小写的 l。`ls`，或者说 “list”， 是你需要知道的使用 Linux CLI 的第一个命令。这个 list 命令在 Linux 终端中运行，以显示在存放在相应文件系统下的所有主要目录。例如，这个命令：

```
ls /applications
```

显示存储在 `applications` 文件夹下的每个文件夹，你将使用它来查看文件、文件夹和目录。

显示所有隐藏的文件都可以使用命令 `ls -a`。

### 2、 cd

这个命令是你用来跳转（或“更改”）到一个目录的。它指导你如何从一个文件夹导航到另一个文件夹。假设你位于 `Downloads` 文件夹中，但你想到名为 `Gym Playlist` 的文件夹中，简单地输入 `cd Gym Playlist` 将不起作用，因为 shell 不会识别它，并会报告你正在查找的文件夹不存在（LCTT 译注：这是因为目录名中有空格）。要跳转到那个文件夹，你需要包含一个反斜杠。改命令如下所示：

```
cd Gym\ Playlist
```

要从当前文件夹返回到上一个文件夹，你可以在该文件夹输入 `cd ..`。把这两个点想象成一个后退按钮。

### 3、 mv

该命令将文件从一个文件夹转移到另一个文件夹；`mv` 代表“移动”。你可以使用这个简单的命令，就像你把一个文件拖到 PC 上的一个文件夹一样。

例如，如果我想创建一个名为 `testfile` 的文件来演示所有基本的 Linux 命令，并且我想将它移动到我的 `Documents` 文件夹中，我将输入这个命令：

```
mv /home/sam/testfile /home/sam/Documents/
```

命令的第一部分（`mv`）说我想移动一个文件，第二部分（`home/sam/testfile`）表示我想移动的文件，第三部分（`/home/sam/Documents/`）表示我希望传输文件的位置。

### 4、 快捷键

好吧，这不止一个命令，但我忍不住把它们都包括进来。为什么？因为它们能节省时间并避免经历头痛。

- `CTRL+K` 从光标处剪切文本直至本行结束
- `CTRL+Y` 粘贴文本
- `CTRL+E` 将光标移到本行的末尾
- `CTRL+A` 将光标移动到本行的开头
- `ALT+F` 跳转到下一个空格处
- `ALT+B` 回到前一个空格处
- `ALT+Backspace` 删除前一个词
- `CTRL+W` 剪切光标前一个词
- `Shift+Insert` 将文本粘贴到终端中
- `Ctrl+D` 注销

这些命令在许多方面都能派上用场。例如，假设你在命令行文本中拼错了一个单词：

```
sudo apt-get intall programname
```

你可能注意到 `install` 拼写错了，因此该命令无法工作。但是快捷键可以让你很容易回去修复它。如果我的光标在这一行的末尾，我可以按下两次 `ALT+B` 来将光标移动到下面用 `^` 符号标记的地方：

```
sudo apt-get^intall programname
```

现在，我们可以快速地添加字母 `s` 来修复 `install`，十分简单！

### 5、 mkdir

这是你用来在 Linux 环境下创建目录或文件夹的命令。例如，如果你像我一样喜欢 DIY，你可以输入 `mkdir DIY` 为你的 DIY 项目创建一个目录。

### 6、 at

如果你想在特定时间运行 Linux 命令，你可以将 `at` 添加到语句中。语法是 `at` 后面跟着你希望命令运行的日期和时间，然后命令提示符变为 `at>`，这样你就可以输入在上面指定的时间运行的命令。

例如：

```
at 4:08 PM Sat
at> cowsay 'hello'
at> CTRL+D
```

这将会在周六下午 4:08 运行 `cowsay` 程序。

### 7、 rmdir

这个命令允许你通过 Linux CLI 删除一个目录。例如：

```
rmdir testdirectory
```

请记住，这个命令不会删除里面有文件的目录。这只在删除空目录时才起作用。

### 8、 rm

如果你想删除文件，`rm` 命令就是你想要的。它可以删除文件和目录。要删除一个文件，键入 `rm testfile`，或者删除一个目录和里面的文件，键入 `rm -r`。

### 9、 touch

`touch` 命令，也就是所谓的 “make file 的命令”，允许你使用 Linux CLI 创建新的、空的文件。很像 `mkdir` 创建目录，`touch` 会创建文件。例如，`touch testfile` 将会创建一个名为 testfile 的空文件。

### 10、 locate

这个命令是你在 Linux 系统中用来查找文件的命令。就像在 Windows 中搜索一样，如果你忘了存储文件的位置或它的名字，这是非常有用的。

例如，如果你有一个关于区块链用例的文档，但是你忘了标题，你可以输入 `locate -blockchain` 或者通过用星号分隔单词来查找 "blockchain use cases"，或者星号（`*`）。例如：

```
locate -i*blockchain*use*cases*
```

还有很多其他有用的 Linux CLI 命令，比如 `pkill` 命令，如果你开始关机但是你意识到你并不想这么做，那么这条命令很棒。但是这里描述的 10 个简单而有用的命令是你开始使用 Linux 命令行所需的基本知识。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/10-commands-new-linux-users

作者：[Sam Bocetta][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sambocetta
[1]:https://hostingcanada.org/state-of-the-internet/
[2]:https://www.top500.org/statistics/details/osfam/1
