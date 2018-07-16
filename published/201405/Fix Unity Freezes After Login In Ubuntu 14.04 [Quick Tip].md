解决Ubuntu 14.04 Unity桌面环境登录后冻结问题
================================================================================

如果你把Ubuntu从13.10更新到14.04，你也许会遇到**用Unity桌面环境登录时冻结的现象**。引导进入Ubuntu14.04，输入验证信息，系统会挂起，冻结在那里。如果你稍微幸运些，你还能看到鼠标光标、桌面背景，仅此而已。**没有Unity触发器，也没有顶部面板**等等。你的ubuntu基本上不可用了。

缺少Unity触发器和面板以及系统冻结的问题，可以通过重新安装Unity来解决。让我们看看怎么做：

### 重新安装14.04的Unity 以解决系统冻结的问题###

好吧，如果你正被困在一个冻结的系统上，按下**Ctrl+Alt+F2**。这会让你进入一个命令行界面而不是默认的用户桌面界面。切换到命令行界面后，输入用户名和密码登录之后，使用下面的命令重装Unity桌面环境：

    sudo apt-get update
    sudo apt-get install –reinstall ubuntu-desktop
    sudo apt-get install unity
    sudo shutdown -r now

最后一个命令是重启系统，重启之后，你的Unity应该就变好了。

### 解决Nvidia显卡的Unity冻结问题###

我没有使用过Nvidia的显卡，但是我找到了别人解决这个问题的方法。尽管上面的技巧对我来说有效，但是我没有过验证下面的命令。使用Nvidia的用户，请告诉我下面的步骤是否工作：

和上面一样使用**Ctrl+Alt+F2**登录到命令行界面，输入下面的命令：

    sudo apt-get update
    sudo apt-get install –reinstall ubuntu-desktop
    sudo apt-get install unity
    sudo apt-get remove –purge nvidia*
    sudo shutdown -r now

如果重启之后Unity恢复了，记得重新安装你的Nvidia显卡的驱动，因为你已经卸载了它。

我希望这些技巧能够帮助你从冻结的unbuntu 14.04中恢复。最后，任何的问题和建议都欢迎来提。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-unity-freezes-after-login-ubuntu-14-04/

译者：[ggaaooppeenngg](https://github.com/ggaaooppeenngg) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
