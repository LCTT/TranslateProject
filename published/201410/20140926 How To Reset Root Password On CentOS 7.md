如何重置CentOS 7的Root密码
===

重置Centos 7 Root密码的方式和Centos 6完全不同。让我来展示一下到底如何操作。

1 - 在启动grub菜单，选择编辑选项启动

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_003.png)

2 - 按键盘e键，来进入编辑界面

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_005.png)

3 - 找到Linux 16的那一行，将ro改为rw init=/sysroot/bin/

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_006.png)

4 - 现在按下 Control+x ，使用单用户模式启动

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_007.png)

5 - 现在，可以使用下面的命令访问系统

    chroot /sysroot

6 - 重置密码

    passwd root

7 - 更新系统信息

    touch /.autorelabel

8 - 退出chroot

    exit

9 - 重启你的系统

    reboot

就是这样！

---

via: http://www.unixmen.com/reset-root-password-centos-7/

作者：M.el Khamlichi
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
