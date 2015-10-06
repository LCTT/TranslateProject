如何在 Ubuntu 中安装 QGit 客户端
================================================================================

QGit是一款由Marco Costalba用Qt和C++写的开源的图形界面 Git 客户端。它是一款可以在图形界面环境下更好地提供浏览版本历史、查看提交记录和文件补丁的客户端。它利用git命令行来执行并显示输出。它有一些常规的功能像浏览版本历史、比较、文件历史、文件标注、归档树。我们可以格式化并用选中的提交应用补丁，在两个或多个实例之间拖拽并提交等等。它允许我们用它内置的生成器来创建自定义的按钮去执行特定的命令。

这里有简单的几步在Ubuntu 14.04 LTS "Trusty"中编译并安装QGit客户端。

### 1. 安装 QT4 库 ###

首先在ubuntu中运行QGit需要先安装QT4库。由于apt是ubuntu默认的包管理器，同时qt4也在官方的仓库中，因此我们直接用下面的apt-get命令来安装qt4。

    $ sudo apt-get install qt4-default

### 2. 下载QGit压缩包 ###

安装完Qt4之后，我们要安装git，这样我们才能在QGit中克隆git仓库。运行下面的apt-get命令。

    $ sudo apt-get install git

现在，我们要使用下面的git命令来克隆QGit客户端的仓库。

    $ git clone git://repo.or.cz/qgit4/redivivus.git

    Cloning into 'redivivus'...
    remote: Counting objects: 7128, done.
    remote: Compressing objects: 100% (2671/2671), done.
    remote: Total 7128 (delta 5464), reused 5711 (delta 4438)
    Receiving objects: 100% (7128/7128), 2.39 MiB | 470.00 KiB/s, done.
    Resolving deltas: 100% (5464/5464), done.
    Checking connectivity... done.

### 3. 编译 QGit ###

克隆之后，我们现在进入redivivus的目录，并创建我们编译需要的makefile文件。进入目录，运行下面的命令。

    $ cd redivivus

接下来，我们运行下面的命令从qmake项目文件（qgit.pro）来生成新的Makefile。

    $ qmake qgit.pro

生成Makefile之后，我们现在终于可以编译qgit的源代码并生成二进制。首先我们要安装make和g++包用于编译，因为这是一个用C++写的程序。

    $ sudo apt-get install make g++

现在，我们要用make命令来编译代码了。

    $ make

### 4. 安装 QGit ###

成功编译QGit的源码之后，我们就要在Ubuntu 14.04中安装它了，这样就可以在系统中执行它。因此我们将运行下面的命令。

    $ sudo make install

    cd src/ && make -f Makefile install
    make[1]: Entering directory `/home/arun/redivivus/src'
    make -f Makefile.Release install
    make[2]: Entering directory `/home/arun/redivivus/src'
    install -m 755 -p "../bin/qgit" "/usr/lib/x86_64-linux-gnu/qt4/bin/qgit"
    strip "/usr/lib/x86_64-linux-gnu/qt4/bin/qgit"
    make[2]: Leaving directory `/home/arun/redivivus/src'
    make[1]: Leaving directory `/home/arun/redivivus/src'

接下来，我们需要从bin目录下复制qgit的二进制文件到/usr/bin/，这样我们就可以全局运行它了。

    $ sudo cp bin/qgit /usr/bin/

### 5. 创建桌面文件 ###

既然我们已经在ubuntu中成功安装了qgit，我们来创建一个桌面文件，这样QGit就可以在我们桌面环境中的菜单或者启动器中找到了。要做到这点，我们要在/usr/share/applications/创建一个新文件叫qgit.desktop。

    $ sudo nano /usr/share/applications/qgit.desktop

接下来复制下面的行到文件中。

    [Desktop Entry]
    Name=qgit
    GenericName=git 图形界面 viewer
    Exec=qgit
    Icon=qgit
    Type=Application
    Comment=git 图形界面 viewer
    Terminal=false
    MimeType=inode/directory;
    Categories=Qt;Development;RevisionControl;

完成之后，保存并退出。

### 6. 运行 QGit 客户端 ###

QGit安装完成之后，我们现在就可以从任何启动器或者程序菜单中启动它了。要在终端下面运行QGit，我们可以像下面那样。

    $ qgit

这会打开基于Qt4框架图形界面模式的QGit。

![QGit Viewer](http://blog.linoxide.com/wp-content/uploads/2015/07/qgit-viewer.png)

### 总结 ###

QGit是一个很棒的基于QT的git客户端。它可以在Linux、MAC OSX和 Microsoft Windows所有这三个平台中运行。它帮助我们很容易地浏览历史、版本、分支等等git仓库提供的信息。它减少了使用命令行的方式去执行诸如浏览版本、历史、比较功能的需求，并用图形化的方式来简化了这些任务。最新的qgit版本也在默认仓库中，你可以使用 **apt-get install qgit** 命令来安装。因此，QGit用它简单的图形界面使得我们的工作更加简单和快速。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-qgit-viewer-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
