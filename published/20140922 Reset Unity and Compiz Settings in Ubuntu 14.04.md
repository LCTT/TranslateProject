小技巧：在Ubuntu 14.04中重置Unity和Compiz设置
================================================================================
如果你一直在试验你的Ubuntu系统，你可能最终以Unity和Compiz的一片混乱收场。在此贴士中，我们将看看怎样来重置Ubuntu 14.04中的Unity和Compiz。事实上，全部要做的事，仅仅是运行几个命令而已。

### 重置Ubuntu 14.04中的Unity和Compiz ###

打开终端（Ctrl+Alt+T），并使用以下命令来重置compiz：

    dconf reset -f /org/compiz/

重置compiz后，重启Unity：

    setsid unity

此外，如果你想将Unity图标也进行重置，试试以下的命令吧：

    unity --reset-icons

### 可能的疑难解决方案： ###

如果你在重置compiz时遇到如下错误：

> error: GDBus.Error:org.gtk.GDBus.UnmappedGError.Quark._g_2dfile_2derror_2dquark.Code17: Cannot open dconf database: invalid gvdb header

可能的原因是用户文件被搞乱了。备份dconf配置，并移除配置文件：

    mv ~/.config/dconf/ ~/.config/dconf.bak

希望本贴士对你重置Ubuntu 14.04中Unity和compiz有所帮助，欢迎您随时提出问题和建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/reset-unity-compiz-settings-ubuntu-1404/

作者：[Abhishek][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
