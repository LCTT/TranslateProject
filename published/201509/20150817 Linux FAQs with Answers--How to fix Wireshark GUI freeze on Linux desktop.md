Linux 有问必答：如何解决 Linux 上的 Wireshark 界面僵死
================================================================================
> **问题**: 当我试图在 Ubuntu 上的 Wireshark 中打开一个 pre-recorded 数据包转储时，它的界面突然死机，在我运行 Wireshark 的终端出现了下面的错误和警告。我该如何解决这个问题？

    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GObject'
    (wireshark:3480): GLib-GObject-CRITICAL **: g_object_set_qdata_full: assertion 'G_IS_OBJECT (object)' failed
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GtkRange'
    (wireshark:3480): Gtk-CRITICAL **: gtk_range_get_adjustment: assertion 'GTK_IS_RANGE (range)' failed
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GtkOrientable'
    (wireshark:3480): Gtk-CRITICAL **: gtk_orientable_get_orientation: assertion 'GTK_IS_ORIENTABLE (orientable)' failed
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GtkScrollbar'
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GtkWidget'
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GObject'
    (wireshark:3480): GLib-GObject-CRITICAL **: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed
    (wireshark:3480): Gtk-CRITICAL **: gtk_widget_set_name: assertion 'GTK_IS_WIDGET (widget)' failed


Wireshark 是一个基于 GUI 的数据包捕获和嗅探工具。该工具被网络管理员普遍使用，网络安全工程师或开发人员对于各种任务的数据包级的网络分析是必需的，例如在网络故障，漏洞测试，应用程序调试，或逆向协议工程是必需的。 Wireshark 允许实时记录数据包，并通过便捷的图形用户界面浏览他们的协议首部和有效负荷。

![](https://farm1.staticflickr.com/722/20584224675_f4d7a59474_c.jpg)

这是 Wireshark 的 UI，尤其是在 Ubuntu 桌面下运行时，当你向上或向下滚动分组列表视图时，或开始加载一个 pre-recorded 包转储文件时，有时会挂起或冻结，并出现以下错误。

![](https://farm1.staticflickr.com/589/20062177334_47c0f2aeae_c.jpg)

显然，这个错误是由 Wireshark 和叠加滚动条之间的一些不兼容造成的，在最新的 Ubuntu 桌面还没有被解决（例如，Ubuntu 15.04 的桌面）。

一种避免 Wireshark 的 UI 卡死的办法就是 **暂时禁用叠加滚动条**。在 Wireshark 上有两种方法来禁用叠加滚动条，这取决于你在桌面上如何启动 Wireshark 的。

### 命令行解决方法 ###

叠加滚动条可以通过设置"**LIBOVERLAY_SCROLLBAR**"环境变量为“0”来被禁止。

所以，如果你是在终端使用命令行启动 Wireshark 的，你可以在 Wireshark 中禁用叠加滚动条，如下所示。

打开你的 .bashrc 文件，并定义以下 alias。

    alias wireshark="LIBOVERLAY_SCROLLBAR=0 /usr/bin/wireshark"

### 桌面启动解决方法 ###

如果你是使用桌面启动器启动的 Wireshark，你可以编辑它的桌面启动器文件。

    $ sudo vi /usr/share/applications/wireshark.desktop

查找以"Exec"开头的行，并如下更改。

    Exec=env LIBOVERLAY_SCROLLBAR=0 wireshark %f

虽然这种解决方法可以在系统级帮助到所有桌面用户，但升级 Wireshark 就没用了。如果你想保留修改的 .desktop 文件，如下所示将它复制到你的主目录。

    $ cp /usr/share/applications/wireshark.desktop ~/.local/share/applications/ 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-wireshark-gui-freeze-linux-desktop.html

作者：[Dan Nanni][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni

