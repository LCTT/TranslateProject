Linux/Unix桌面趣事：文本模式艺术框及注释图
================================================================================
Boxes command is a text filter and a little known tool that can draw any kind of ASCII art box around its input text or code for fun and profit. You can quickly create email signatures, or create regional comments in any programming language. This command was intended to be used with the vim text editor, but can be tied to any text editor which supports filters, as well as from the command line as a standalone tool.
boxes是一个文本过滤器并且是一个鲜为人知的可以在文字或者代码周围绘出任何形式的ASCII艺术框的工具。你可以快速地创建一个email签名或者在任何语言中创建一个注释。这个命令可以和vim一起使用，但是可以和任何支持过滤和可以在命令行中使用独立工具的文本编辑器绑定在一起。。

### 任务： 安装 boxes ###

在Debian/Ubuntu中使用[apt-get命令][1]来安装boxes:

    $ sudo apt-get install boxes

示例输出:

    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following NEW packages will be installed:
      boxes
    0 upgraded, 1 newly installed, 0 to remove and 6 not upgraded.
    Need to get 0 B/59.8 kB of archives.
    After this operation, 205 kB of additional disk space will be used.
    Selecting previously deselected package boxes.
    (Reading database ... 224284 files and directories currently installed.)
    Unpacking boxes (from .../boxes_1.0.1a-2.3_amd64.deb) ...
    Processing triggers for man-db ...
    Setting up boxes (1.0.1a-2.3) ...

对于RHEL / CentOS / Fedora用户，使用[yum命令来安装boxes][2](首先[启用EPEL仓库][3])

    # yum install boxes

示例输出:

    Loaded plugins: rhnplugin
    Setting up Install Process
    Resolving Dependencies
    There are unfinished transactions remaining. You might consider running yum-complete-transaction first to finish them.
    --> Running transaction check
    ---> Package boxes.x86_64 0:1.1-8.el6 will be installed
    --> Finished Dependency Resolution
    Dependencies Resolved
    ==========================================================================
     Package        Arch            Version               Repository     Size
    ==========================================================================
    Installing:
     boxes          x86_64          1.1-8.el6             epel           64 k
    Transaction Summary
    ==========================================================================
    Install       1 Package(s)
    Total download size: 64 k
    Installed size: 151 k
    Is this ok [y/N]: y
    Downloading Packages:
    boxes-1.1-8.el6.x86_64.rpm                         |  64 kB     00:00
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
      Installing : boxes-1.1-8.el6.x86_64                                 1/1
    Installed:
      boxes.x86_64 0:1.1-8.el6
    Complete!

FreeBSD user can use the port as follows:
FreeBSD用户可以使用port：

    cd /usr/ports/misc/boxes/ && make install clean

或者使用pkg_add命令添加包：

    # pkg_add -r boxes

### 用给定的文字画出任何形式的框 ###

输入下面的额命令：

    echo "This is a test" | boxes

或者指定设计：

    echo -e "\n\tVivek Gite\n\tvivek@nixcraft.com\n\twww.cyberciti.biz" | boxes -d dog

示例输出：

![Unix / Linux: Boxes Command To Draw Various Designs](http://s0.cyberciti.org/uploads/l/tips/2012/06/unix-linux-boxes-draw-dog-design.png)

图01:Unix / Linux：Box命令来画出不同的设计

#### 我如何列出所有的设计？ ####

语法是：

    boxes option
    pipe | boxes options
    echo "text" | boxes -d foo
    boxes -l
 
-d选项设置使用的设计。语法是：

    echo "Text" | boxes -d design
    pipe | boxes -d desig

-l选项列出设计列表。它会列出配置文件中所有的设计，以及它的设计者的一些信息：

    boxes -l
    boxes -l | more
    boxes -l | less

示例输出：

    43 Available Styles in "/etc/boxes/boxes-config":
    -------------------------------------------------
    ada-box (Neil Bird ):
        ---------------
        --           --
        --           --
        ---------------
    ada-cmt (Neil Bird ):
        --
        -- regular Ada
        -- comments
        --
    boy (Joan G. Stark ):
                        .-"""-.
                       / .===. \
                       \/ 6 6 \/
                       ( \___/ )
          _________ooo__\_____/______________
         /                                   \
        |   joan stark   spunk1111@juno.com   |
        |     VISIT MY ASCII ART GALLERY:     |
        | http://www.geocities.com/SoHo/7373/ |
         \_______________________ooo_________/  jgs
                        |  |  |
                        |_ | _|
                        |  |  |
                        |__|__|
                        /-'Y'-\
                       (__/ \__)
    ....
    ...
    output truncated
    ..

### 我如何在vi/vim中使用boxes过滤文本？ ###

你可以在vi或者vim中使用任何外部命令。比如，[插入日期和时间][4]，输入：

    !!date

或者

    :r !date

你需要在vim中输入上面的命令来读取date命令的输出。这可以在当前行中插入时间和日期：

    Tue Jun 12 00:05:38 IST 2012

你可以用boxes命令做同样的事情。如下创建一个示例脚本或者程序:

    #!/bin/bash
    Purpose: Backup mysql database to remote server.
    Author: Vivek Gite
    Last updated on: Tue Jun, 12 2012

现在输入下面的命令（移动光标到第二行，也就是说以Purpose开头的那行）

    3!!boxes

你就会得到下面的示例输出：

    #!/bin/bash
    /****************************************************/
    /* Purpose: Backup mysql database to remote server. */
    /* Author: Vivek Gite           */
    /* Last updated on: Tue Jun, 12 2012                */
    /****************************************************/

This video will give you an introduction to boxes command:
这个视频是boxes命令的一个介绍

注：youtube 视频
<iframe width="595" height="446" frameborder="0" src="http://www.youtube.com/embed/glzXjNvrYOc?rel=0"></iframe>

（视频01：boxes命令实践。顺便说一下，这是我的第一个视频，所以对我不要太认真并让我知道你们所想）
同样可见

- boxes man页

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/tips/unix-linux-draw-any-kind-of-boxes-around-text-editor.html

作者：Vivek Gite 
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html
[2]:http://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[3]:http://www.cyberciti.biz/faq/fedora-sl-centos-redhat6-enable-epel-repo/
[4]:http://www.cyberciti.biz/faq/vim-inserting-current-date-time-under-linux-unix-osx/


