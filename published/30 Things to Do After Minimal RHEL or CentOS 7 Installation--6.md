安装完最小化 RHEL/CentOS 7 后需要做的 30 件事情（六）
================================================================================
### 30. 用密码保护 GRUB ###

用密码保护你的 boot 引导程序这样你就可以在启动时获得额外的安全保障。同时你也可以在实物层面获得保护。通过在引导时给 GRUB 加锁防止任何无授权访问来保护你的服务器。

首先备份两个文件，这样如果有任何错误出现，你可以有回滚的选择。备份 ‘/etc/grub2/grub.cfg’ 为 ‘/etc/grub2/grub.cfg.old’。

    # cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.old

同样，备份 ‘/etc/grub.d/10\_linux’ 为 ‘/etc/grub.d/10\_linux.old’。

    # cp /etc/grub.d/10_linux /etc/grub.d/10_linux.old

打开文件 ‘/etc/grub.d/10\_linux’ 并在文件末尾添加下列行。

    cat <<EOF
    set superusers="tecmint"
    Password tecmint avi@123
    EOF

![密码保护 Grub](http://www.tecmint.com/wp-content/uploads/2015/04/Password-Protect-Grub.png)

*密码保护 Grub*

注意在上面的文件中，用你自己的用户名和密码代替 “tecmint” 和 “avi@123”。

现在通过运行下面的命令生成新的 grub.cfg 文件。

    # grub2-mkconfig --output=/boot/grub2/grub.cfg

![生成 Grub 文件](http://www.tecmint.com/wp-content/uploads/2015/04/Generate-Grub-File.jpeg)

*生成 Grub 文件*

创建 grub.cfg 文件之后，重启机器并敲击 ‘e’ 进入编辑。你会发现它会要求你输入 “有效验证” 来编辑 boot 菜单。

![有密码保护的 Boot 菜单](http://www.tecmint.com/wp-content/uploads/2015/04/Edit-Boot-Menu.jpeg)

*有密码保护的 Boot 菜单*

输入登录验证之后，你就可以编辑 grub boot 菜单。

![Grub 菜单文件](http://www.tecmint.com/wp-content/uploads/2015/04/Grub-Menu-Edit.jpeg)

*Grub 菜单文件*

你也可以用加密的密码代替上一步的明文密码。首先按照下面推荐的生成加密密码。

    # grub2-mkpasswd-pbkdf2

    [两次输入密码]

![生成加密的 Grub 密码](http://www.tecmint.com/wp-content/uploads/2015/04/Generate-Encrypted-Grub-Password.jpeg)

*生成加密的 Grub 密码*

打开 ‘/etc/grub.d/10_linux’ 文件并在文件末尾添加下列行。

    cat <<EOF
    set superusers=”tecmint”
    Password_pbkdf2 tecmint
    grub.pbkdf2.sha512....你的加密密码....
    EOF

![加密 Grub 密码](http://www.tecmint.com/wp-content/uploads/2015/04/Encrypted-Grub-Password.jpeg)

*加密 Grub 密码*

用你系统上生成的密码代替原来的密码，别忘了交叉检查密码。

同样注意在这种情况下你也需要像上面那样生成 grub.cfg。重启并敲击 ‘e’ 进入编辑，会提示你输入用户名和密码。

我们已经介绍了大部分工业标准发行版 RHEL 7 和 CentOS 7 安装后必要的操作。如果你发现我们缺少了一些点或者你有新的东西可以扩充这篇文章，你可以和我们一起分享，我们会通过扩充在这篇文章中包括你的分享。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/6/

作者：[Avishek Kumar][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/