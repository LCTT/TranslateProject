如何在Linux上找出并删除重复的文件
================================================================================
大家好，今天我们会学习如何在Linux PC或者服务器上找出和删除重复文件。这里有一款工具你可以工具自己的需要使用。

无论你是否正在使用Linux桌面或者服务器，有一些很好的工具能够帮你扫描系统中的重复文件并删除它们来释放空间。图形界面和命令行界面的都有。重复文件是磁盘空间不必要的浪费。毕竟，如果你的确需要在不同的位置享有同一个文件，你可以使用软链接或者硬链接，这样就可以在磁盘的一个地方存储数据了。

### FSlint ###

[FSlint][1] 在不同的Linux发行版二进制仓库中都有，包括Ubuntu、Debian、Fedora和Red Hat。只需你运行你的包管理器并安装“fslint”包就行。这个工具默认提供了一个简单的图形化界面，同样也有包含各种功能的命令行版本。

不要担心FSlint的图形化界面太复杂。默认情况下，它会自动选中Duplicate窗格，并以你的家目录作为搜索路径。

要安装fslint，若像我这样运行的是Ubuntu，这里是默认的命令：

    $ sudo apt-get install fslint

这里还有针对其他发行版的安装命令：

Debian：

    svn checkout http://fslint.googlecode.com/svn/trunk/ fslint-2.45
    cd fslint-2.45
    dpkg-buildpackage -I.svn -rfakeroot -tc
    sudo dpkg -i ../fslint_2.45-1_all.deb

Fedora：

    sudo yum install fslint

OpenSuse：

    [ -f /etc/mandrake-release ] && pkg=rpm
    [ -f /etc/SuSE-release ] && pkg=packages
    wget http://www.pixelbeat.org/fslint/fslint-2.42.tar.gz
    sudo rpmbuild -ta fslint-2.42.tar.gz
    sudo rpm -Uvh /usr/src/$pkg/RPMS/noarch/fslint-2.42-1.*.noarch.rpm

对于其他发行版：

    wget http://www.pixelbeat.org/fslint/fslint-2.44.tar.gz
    tar -xzf fslint-2.44.tar.gz
    cd fslint-2.44
    (cd po && make)
    ./fslint-gui

要在Ubuntu中运行fslint的GUI版本fslint-gui, 使用Alt+F2运行命令或者在终端输入：

    $ fslint-gui

默认情况下，它会自动选中Duplicate窗格，并以你的家目录作为搜索路径。你要做的就是点击Find按钮，FSlint会自动在你的家目录下找出重复文件列表。

![Delete Duplicate files with Fslint](http://blog.linoxide.com/wp-content/uploads/2015/01/delete-duplicates-fslint.png)

点击按钮来删除任何你要删除的文件，并且可以双击预览。

完成这一切后，我们就成功地删除你系统中的重复文件了。

**注意** ，命令行工具默认不在环境的路径中，你不能像典型的命令那样运行它。在Ubuntu中，你可以在/usr/share/fslint/fslint下找到它。因此，如果你要在一个单独的目录运行fslint完整扫描，下面是Ubuntu中的运行命令：

    cd /usr/share/fslint/fslint
    
    ./fslint /path/to/directory

**这个命令实际上并不会删除任何文件。它只会打印出重复文件的列表-你需要自己做接下来的事。**

    $ /usr/share/fslint/fslint/findup --help
    find dUPlicate files.
    Usage: findup [[[-t [-m|-d]] | [--summary]] [-r] [-f] paths(s) ...]
    
    If no path(s) specified then the current directory is assumed.
    
    When -m is specified any found duplicates will be merged (using hardlinks).
    When -d is specified any found duplicates will be deleted (leaving just 1).
    When -t is specfied, only report what -m or -d would do.
    When --summary is specified change output format to include file sizes.
    You can also pipe this summary format to /usr/share/fslint/fslint/fstool/dupwaste
    to get a total of the wastage due to duplicates.

![fslint help](http://blog.linoxide.com/wp-content/uploads/2015/01/fslint-help.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/file-system/find-remove-duplicate-files-linux/

作者：[Arun Pyasi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.pixelbeat.org/fslint/
[2]:http://www.pixelbeat.org/fslint/fslint-2.42.tar.gz