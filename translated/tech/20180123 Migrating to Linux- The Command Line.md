迁徙到 Linux：命令行环境
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/migrate.jpg?itok=2PBkvV7s)

这是关于迁徙到 Linux 系列的第四篇文章了。如果您错过了之前的内容，可以回顾我们之前谈到的内容 [新手之 Linux][1]、[文件和文件系统][2]、和 [图形环境][3]。Linux 无处不在，它可以运行在大部分的网络服务器，如 web、email 和其他服务器；它同样可以在您的手机、汽车控制台和其他很多设备上使用。现在，您可能会开始好奇 Linux 系统，并对学习 Linux 的工作原理萌发兴趣。

在 Linux 下，命令行非常实用。Linux 的桌面系统中，尽管命令行只是可选操作，但是您依旧能看见很多朋友开着一个命令行窗口和其他应用窗口并肩作战。在运行 Linux 系统的网络服务器中，命令行通常是唯一能直接与操作系统交互的工具。因此，命令行是有必要了解的，至少应当涉猎一些基础命令。

在命令行（通常称之为 Linux shell）中，所有操作都是通过键入命令完成。您可以执行查看文件列表、移动文件位置、显示文件内容、编辑文件内容等一系列操作，通过命令行，您甚至可以查看网页中的内容。

如果您在 Windows（CMD 或者 PowerShell） 上已经熟悉关于命令行的使用，您是否想跳转到了解 Windows 命令行的章节上去？先了阅读这些内容吧。

### 导语

在命令行中，这里有一个当前工作目录（文件夹和目录是同义词，在 Linux 中它们通常都被称为目录）的概念。如果没有特别指定目录，许多命令的执行会在当前目录下生效。比如，键入 ls 列出文件目录，当前工作目录的文件将会被列举出来。看一个例子：
```
$ ls
Desktop Documents Downloads Music Pictures README.txt Videos
```

`ls Documents` 这条命令将会列出 `Documents` 目录下的文件：
```
$ ls Documents
report.txt todo.txt EmailHowTo.pdf
```

通过 `pwd` 命令可以显示当前您的工作目录。比如：
```
$ pwd
/home/student
```

您可以通过 `cd` 命令改变当前目录并切换到您想要抵达的目录。比如：
```
$ pwd
/home/student
$ cd Downloads
$ pwd
/home/student/Downloads
```

路径中的目录由 `/`（左斜杠）字符分隔。路径中有一个隐含的层次关系，比如 `/home/student` 目录中，home 是顶层目录，而 student 是 home 的子目录。

路径要么是绝对路径，要么是相对路径。绝对路径由一个 `/` 字符打头。

相对路径由 `.` 或者 `..` 开始。在一个路径中，一个 `.` 意味着当前目录，`..` 意味着当前目录的上级目录。比如，`ls ../Documents` 意味着在此寻找当前目录的上级名为 `Documets` 的目录：
```
$ pwd
/home/student
$ ls
Desktop Documents Downloads Music Pictures README.txt Videos
$ cd Downloads
$ pwd
/home/student/Downloads
$ ls ../Documents
report.txt todo.txt EmailHowTo.pdf
```

当您第一次打开命令行窗口时，您当前的工作目录被设置为您的家目录，通常为 `/home/<您的登录名>`。家目录专用于登陆之后存储您的专属文件。

设置环境变量 `$HOME` 到您的家目录，比如：
```
$ echo $HOME
/home/student
```

下表显示了用于目录导航和管理简单的文本文件的一些命令摘要。

![table](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/table-1_0.png?itok=j4Sgv6Vy)

### 搜索

有时我们会遗忘文件的位置，或者忘记了我要寻找的文件名。Linux 命令行有几个命令可以帮助您搜索到文件。

第一个命令是 `find`。您可以使用 `find` 命令通过文件名或其他属性搜索文件和目录。举个例子，当您遗忘了 todo.txt 文件的位置，我们可以执行下面的代码：
```
$ find $HOME -name todo.txt
/home/student/Documents/todo.txt
```

`find` 程序有很多功能和选项。一个简单的例子：
```
find <要寻找的目录> -name <文件名>
```

如果这里有 `todo.txt` 文件且不止一个，它将向我们列出拥有这个名字的所有文件的所有所在位置。`find` 命令有很多便于搜索的选项比如类型（文件或是目录等等）、时间、大小和其他一些选项。更多内容您可以同通过:`man find` 获取关于如何使用 `find` 命令的帮助。

您还可以使用 `grep` 命令搜索文件的特殊内容，比如：
```
grep "01/02/2018" todo.txt
```
这将为您展示 `todo` 文件中 `01/02/2018` 所在行。

### 获取帮助

Linux 有很多命令，这里,我们没有办法一一列举。授人以鱼不如授人以渔，所以下一步我们将向您介绍帮助命令。

`apropos` 命令可以帮助您查找需要使用的命令。也许您想要查找能够操作目录或是获得文件列表的所有命令，但是您并不希望让这些命令执行。您可以这样尝试：
```
apropos directory
```

要在帮助文档中，得到一个于 `directiory` 关键字的相关命令列表，您可以这样操作：
```
apropos "list open files"
```

这将提供一个 `lsof` 命令给您，帮助您打开文件列表。

当您明确您要使用的命令，但是不确定应该使用什么选项完成预期工作，您可以使用 man 命令，它是 manual 的缩写。您可以这样使用：
```
man ls
```

您可以在自己的设备上尝试这个命令。它会提供给您关于使用这个命令的完整信息。

通常，很多命令都会有能够给 `help` 选项（比如说，`ls --help`），列出命令使用的提示。`man` 页面的内容通常太繁琐，`--help` 选项可能更适合快速浏览。

### 脚本

Linux 命令行中最贴心的功能是能够运行脚本文件，并且能重复运行。Linux 命令可以存储在文本文件中，您可以在文件的开头写入 `#!/bin/sh`，之后追加命令。之后，一旦文件被存储为可执行文件，您就可以像执行命令一样运行脚本文件，比如， 
```
--- contents of get_todays_todos.sh ---
#!/bin/sh
todays_date=`date +"%m/%d/%y"`
grep $todays_date $HOME/todos.txt
```

在一个确定的工作中脚本可以帮助自动化重复执行命令。如果需要的话，脚本也可以很复杂，能够使用循环、判断语句等。限于篇幅，这里不细述，但是您可以在网上查询到相关信息。

您是否已经熟悉了 Windows 命令行？

如果您对 Windows CMD 或者 PowerShell 程序很熟悉，在命令行输入命令应该是轻车熟路的。然而，它们之间有很多差异，如果您没有理解它们之间的差异可能会为之困扰。

首先，在 Linux 下的 PATH 环境于 Windows 不同。在 Windows 中，当前目录被认为是路径中的第一个文件夹，尽管该目录没有在环境变量中列出。而在 Linux 下，当前目录不会在路径中显示表示。Linux 下设置环境变量会被认为是风险操作。在 Linux 的当前目录执行程序，您需要使用 ./（代表当前目录的相对目录表示方式） 前缀。这可能会干扰很多 CMD 用户。比如：
```
./my_program
```

而不是
```
my_program
```

另外，在 Windows 环境变量的路径中是以 `;`（分号） 分割的。在 Linux 中，由 `:` 分割环境变量。同样，在 Linux 中路径由 `/` 字符分隔，而在 Windows 目录中路径由 `\` 字符分割。因此 Windows 中典型的环境变量会像这样：
```
PATH="C:\Program Files;C:\Program Files\Firefox;"
while on Linux it might look like:
PATH="/usr/bin:/opt/mozilla/firefox"
```

还要注意，在 Linux 中环境变量由 `$` 拓展，而在 Windows 中您需要使用百分号（就是这样: %PATH%）。

在 Linux 中，通过 `-` 使用命令选项，而在 Windows 中，使用选项要通过 `/` 字符。所以，在 Linux 中您应该：
```
a_prog -h
```

而不是
```
a_prog /h
```

在 Linux 下，文件拓展名并没有意义。例如，将 `myscript` 重命名为 `myscript.bat` 并不会因此而可执行，需要设置文件的执行权限。文件执行权限会在下次的内容中覆盖到。

在 Linux 中，如果文件或者目录名以 `.` 字符开头，意味着它们是隐藏文件。比如，如果您申请编辑 `.bashrc` 文件，您不能在 `home` 目录中找到它，但是它可能真的存在，只不过它是隐藏文件。在命令行中，您可以通过 `ls` 命令的 `-a` 选项查看隐藏文件，比如：
```
ls -a
```

在 Linux 中，普通的命令与 Windows 的命令不尽相同。下面的表格显示了常用命令中 CMD 命令和 Linux 命令行的差异。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/table-2_0.png?itok=NNc8TZFZ)

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/1/migrating-linux-command-line

作者：[John Bonesio][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://www.linux.com/blog/learn/intro-to-linux/2017/10/migrating-linux-introduction
[2]:https://www.linux.com/blog/learn/intro-to-linux/2017/11/migrating-linux-disks-files-and-filesystems
[3]:https://www.linux.com/blog/learn/2017/12/migrating-linux-graphical-environments
