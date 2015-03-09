Linux有问必答时间：怎样解决“XXX is not in the sudoers file”错误
================================================================================
> **问题**:我想在我的Linux系统上使用sudo来运行一些特权命令，然而当我试图这么做时，我却得到了"[我的用户名] is not in the sudoers file. This incident will be reported."的错误信息。我该怎么处理这种sudo错误呢？ 

sudo是一个允许特定的用户组用另一个用户(典型的是root)的特权来运行一个命令。sudo有详细的日志功能，并且提供了对用户可通过sudo来运行哪些命令的细粒度控制。

### Sudo vs. Su ###

su命令也提供了同样的特权提升功能，两者不同的是它们认证过程和特权变化的粒度。su允许你从你的登录会话切换到另一个用户的会话，然后你可以随心所欲地用该用户的特权来运行任何程序，但是你需要知道目标用户的密码才能切换这个用户。而另一方面，sudo能在单个命令的基础上工作，允许你用root的特权来运行单个命令。用sudo你不必一定要知道root的密码，但是在提示输入sudo密码的时候要输入你的密码。

### 在Sudoers列表里添加用户 ###

作为一个新用户的你如果试图运行sudo命令，你会碰到以下错误。意思是你不在这个包含经过认证就可以使用sudo特权的这么一个用户组的sudoers列表里。

    [my-user-id] is not in the sudoers file.  This incident will be reported.

有两个方法可以把你加入到sudoers列表中去。

### 方法一 ###

第一个方法是把你添加到名为sudo的Linux用户组里。这个特殊的Linux用户组是预配置来使用sudo的。因此，一旦你在这个组里面，那你就可以运行sudo命令了。

以下命令会把你加入到Linux的sudo组里，来确保让你能作为root用户来运行命令。

    # adduser <用户名> sudo

现在来确认你的组员资格有没有更新，使用groups命令来看看你当前属于哪个组的列表里。这个列表必定是包含sudo组的。

    $ groups 

----------

    alice adm cdrom sudo dip plugdev fuse lpadmin netdev sambashare davfs2 libvirtd docker promiscuous

组员资格变动（和sudo访问）会在你登出后重新登录后生效。

### 方法二 ###

第二个能让你使用sudo的方法是直接把你自己添加到 /etc/sudoers 这个配置文件中去。

要修改 /etc/sudoers 文件，你可以使用一个名为visudo的特殊sudo编辑器命令。用root身份简单调用以下命令。

    # visudo 

这条命令能打开并编辑 /etc/sudoers 文件，将以下这行文字添加至文件末尾，并按Ctrl+X。提示出现时，保存修改退出。

    <username> ALL=(ALL) ALL

这个修改会立即生效，你就能马上使用sudo了。

![](https://farm8.staticflickr.com/7511/15866443418_e147329e1b_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-is-not-in-the-sudoers-file.html

译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
