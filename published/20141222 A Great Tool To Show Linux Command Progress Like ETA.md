一个可以显示Linux命令运行进度的伟大工具
================================================================================
Coreutils Viewer（**cv**）是一个简单的程序，它可以用于显示任何核心组件命令（如：cp、mv、dd、tar、gzip、gunzip、cat、grep、fgrep、egrep、cut、sort、xz、exiting）的进度。它使用文件描述信息来确定一个命令的进度，比如cp命令。**cv**之美在于，它能够和其它Linux命令一起使用，比如你所知道的watch以及I/O重定向命令。这样，你就可以在脚本中使用，或者你能想到的所有方式，别让你的想象力束缚住你。

### 安装 ###

你可以从cv的[github仓库那儿][1]下载所需的源文件。把zip文件下载下来后，将它解压缩，然后进入到解压后的文件夹。

该程序需要**ncurses library**。如果你已经在你的Linux系统中安装了ncurses，那么cv的安装过程对你而言就是那么的轻松写意。

通过以下两个简单步骤来进行编译和安装吧。

    $ make
    $ sudo make install

### 运行cv ###

要运行cv，只需要想其它程序一样，在命令行输入此命令即可。如果你没有执行make install，而选择从当前目录中去运行，那么你可以运行以下命令：

    $ ./cv

否则，就运行以下命令吧。

    $ cv

如果没有核心组件命令在运行，那么cv程序会退出，并告诉你：没有核心组件命令在运行。

![cv no command](http://blog.linoxide.com/wp-content/uploads/2014/11/cv-no-command.png)

要有效使用该程序，请在你系统上运行某个核心组件程序。在本例中，我们将使用**cp**命令。

当拷贝一个打文件时，你就可以看到当前进度了，以百分比显示。

![cv default](http://blog.linoxide.com/wp-content/uploads/2014/11/cv-default.png)

### 添加选项到 cv ###

你也可以添加几个选项到cv命令，就像其它命令一样。一个有用的选项是让你了解到拷贝或移动大文件时的预计剩余时间。

添加**-w**选项，它就会帮你显示预计的剩余时间。

    $ cv -w

![cv estimated throughput](http://blog.linoxide.com/wp-content/uploads/2014/11/cv-estimated-throughput.png)

试着添加更多的命令选项吧。像下面这样添加其它选项：

    $ cv -wq

### cv 和 watch 命令 ###

watch是一个用于周期性运行程序并显示输出结果的程序。有时候，你可能想要持续看看命令运行状况而不想将 cv 的结果存储到日志文件中。在这种情况下，watch就会派上用场了，它可以和cv一起使用。

    $ watch cv -qw

该命令将会显示所有运行着的核心组件命令的实例。它也会显示进度和预计完成时间。

![cv and watch](http://blog.linoxide.com/wp-content/uploads/2014/11/cv-and-watch-e1416519384265.png)

### 在日志文件中查看输出结果 ###

正如其所承诺的那样，你可以使用cv来重定向它的输出结果到一个日志文件。这功能在命令运行太快而看不到任何有意义的内容时特别有用。

要在日志文件中查看进度，你仅仅需要重定向输出结果，就像下面这样。

    $ cv -w >> log.txt

要查看该命令的输出结果，请用你喜爱的文本编辑器打开日志文件，也可以用cat命令，就像下面这样：

    $ cat log.txt

### 获得帮助 ###

如果你在任何地方受到阻碍，你总是可以通过查阅手册页或使用help选项来获取帮助信息。
要获取帮助信息，可以使用带**-h**选项的cv命令。

    $ cv -h

如果需要更多详细信息，那么手册页是个很不错的地方。

    $ man cv

但是，要获取上述手册页，你必须执行make install来安装cv。

耶！现在，你的Linux工具箱中又多了个伟大的工具。 你学会么？亲自去试试吧~

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/tool-show-command-progress/

作者：[Allan Mbugua][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/allan/
[1]:http://github.com/Xfennec/cv
