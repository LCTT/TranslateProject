如何在 Ubuntu 中再次登录时还原上次运行的应用
================================================================================
在你的 Ubuntu 里，如果你需要处理一些工作，你并不需要关闭正运行着的那些应用，只需要管理一下窗口，并打开那些工作需要的应用就行。然而，如果你需要离开处理些别的事情或你的机器电量低使得你必须马上关闭电脑，这些程序可能就需要关闭终止了。不过幸运的是，你可以让 Ubuntu 记住所有你正运行的应用并在你下一次登录时还原它们。

###自动保存会话

现在，为了让我们的 Ubuntu 记住当前会话中正运行的应用并在我们下一次登录时还原它们，我们将会使用到 `dconf-editor`。这个工具代替了前一个 Ubuntu 版本里安装的 `gconf-editor`，但默认情况下现在这个 Ubuntu 版本(注：这里指的是 Ubuntu 14.04 LTS) 并没有安装。为了安装 `dconf-editor`， 你需要运行 `sudo apt-get install dconf-editor`命令：

    $ sudo apt-get install dconf-tools

一旦 `dconf-editor` 安装完毕，你就可以从应用菜单（注：这里指的是 Unity Dash）里打开它，或者你可以通过直接在终端里运行，或使用 `alt+f2` 运行下面的命令来启动它:

    $ dconf-editor

在 “dconf Editor” 窗口中，在左边窗格里点击临近 "org" 的右箭头来展开这个选项的分支。

![Dconf Editor Apps, org](http://blog.linoxide.com/wp-content/uploads/2015/01/dconf-editor-clicking-org-300x146.png)

然后在 “org” 下，点击临近 “gnome” 的右箭头。

![dconf editor clicking gnome](http://blog.linoxide.com/wp-content/uploads/2015/01/dconf-editor-clicking-gnome.png)

接着在 “gnome” 下点击 “gnome-session”。在右边窗格里，选择 “auto-save-session” 选项框并将它开启。

![dconf-editor selecting auto save session](http://blog.linoxide.com/wp-content/uploads/2015/01/dconf-editor_selecting_auto_save_session.png)

在你确认对刚才的选项打钩之后，点击默认情况下位于窗口左上角的关闭按钮(X)来关闭 “Dconf Editor”。

![dconf-editor closing dconf editor](http://blog.linoxide.com/wp-content/uploads/2015/01/dconf-editor_closing_dconf_editor.png)

在你登出并再登录回来时，所有你正运行的应用就可以被还原了。

欢呼吧，我们已经成功地配置了我们的 Ubuntu 14.04 LTS "Trusty" 来自动记住我们上一次会话中正在运行的应用。

除了关机后恢复应用之外，还可以通过休眠来达成类似的功能。

###休眠功能

现在，在这个教程里，我们也将学会 **如何在 Ubuntu 14.04 LTS 里开启休眠功能** :

在开始之前，在键盘上按 `Ctrl+Alt+T` 来开启终端。在它开启以后，运行：

    sudo pm-hibernate

在你的电脑关闭后，再重新开启它。这时，你开启的应用被重新打开了吗？如果休眠功能没有发挥作用，请检查你的交换分区大小，它至少要和你可用 RAM 大小相当。

你可以在系统监视器里查看你的交换分区大小，系统监视器可以通过在应用菜单或在终端里运行下面的命令来开启：

    $ gnome-system-monitor

#### 在系统托盘里启用休眠功能: ####

系统托盘里面的会话指示器现在使用 logind 而不是 upower 了。默认情况下，在 upower 和 logind 中，休眠菜单都被禁用了。

为了开启它的休眠菜单，依次运行下面的命令来编辑配置文件：

    sudo -i

    cd /var/lib/polkit-1/localauthority/50-local.d/

    gedit com.ubuntu.enable-hibernate.pkla

**提示：假如对你来说，这个配置文件并没有起到作用，请替换上面代码中的 /var/lib 为 /etc 来试试另一个配置文件**

复制并粘贴下面的代码到文件中并保存：

    [Re-enable hibernate by default in upower]
     Identity=unix-user:*
     Action=org.freedesktop.upower.hibernate
     ResultActive=yes

    [Re-enable hibernate by default in logind]
     Identity=unix-user:*
     Action=org.freedesktop.login1.hibernate
     ResultActive=yes

重启你的电脑就可以了。

#### 当你盖上笔记本的后盖时，让它休眠: ####

1. 通过下面的命令编辑文件 “/etc/systemd/logind.conf” :
	
		$ sudo nano /etc/systemd/logind.conf

2. 将 **#HandleLidSwitch=suspend** （挂起）这一行改为 **HandleLidSwitch=hibernate** （休眠）并保存文件；

3. 运行下面的命令或重启你的电脑来应用更改:

    	$ sudo restart systemd-logind

就是这样。 成功了吗？现在我们设置了 dconf 并开启了休眠功能 :) 这样，无论你是关机还是直接合上笔记本盖子，你的 Ubuntu 将能够完全记住你开启的应用和窗口了。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/remember-running-applications-ubuntu/

作者：[Arun Pyasi][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
