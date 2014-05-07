解决Ubuntu 14.04 Unity桌面环境登陆后卡机情况的
================================================================================

如果你把Ubuntu从13.10更新到14.04,就会出现**用Unity桌面环境登陆时卡机的现象**.如果进入Ubuntu14.04的boot,并且验证进入后,系统也会挂断,并且卡机.如果你足够幸运,你可能会看到仅有的鼠标或者桌面背景.**没有Unity触发器,不存在顶部面板**等等.基本上你的ubuntu已经处于一种不稳定的状态了.

缺少Unity触发器和面板以及系统卡机的问题,需要通过重新下载Unity来解决.让我们看看怎么做:

### 重新下载Unity 解决系统卡机的问题###

好吧,既然你整纠结于一个完全冻结了的系统.按下**Ctrl+Alt+F2**.这会让你进入一个命令行接口而不是默认的用户桌面接口.切换到命令行接口后,输入用户名和密码登陆之后,使用下面的命令重装Unity桌面环境:

    sudo apt-get update
    sudo apt-get install –reinstall ubuntu-desktop
    sudo apt-get install unity
    sudo shutdown -r now

最后一个命令是重启系统,重启之后,你的Unity就完好如初了.


### 解决Nvidia显卡的Unity卡机问题###

我没有解决这个问题的经验,但是我找到了别人解决这个问题的方法.尽管上面的技巧对我来说有效,但是我不验证下面的命令.Nvidia的用户需要确认下面的步奏:

和上面一样使用**Ctrl+Alt+F2**登陆到命令行接口,输入下面的命令:

    sudo apt-get update
    sudo apt-get install –reinstall ubuntu-desktop
    sudo apt-get install unity
    sudo apt-get remove –purge nvidia*
    sudo shutdown -r now

如果重启之后Unity恢复了,记得重新安装你的Nvidia显卡的驱动,因为你已经卸载了它.

我希望这些技巧能够帮助你恢复14.04的unbuntu.最后任何的问题和建议都欢迎来提.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-unity-freezes-after-login-ubuntu-14-04/

译者：[ggaaooppeenngg](https://github.com/ggaaooppeenngg) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
