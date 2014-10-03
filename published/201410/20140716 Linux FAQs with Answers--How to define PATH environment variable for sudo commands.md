
Linux有问必答——如何为sudo命令定义PATH环境变量 
================================================================================
>**问题**:我安装了一个程序到/usr/local/bin目录下，这个程序需要root权限才能执行，当我用sudo去执行它时，收到"sudo: XXXXX: command not found"的错误提示，不知道为什么/usr/local/bin没有被包含到PATH环境变量下面来，我该如何解决这个问题？

当你使用sudo去执行一个程序时，处于安全的考虑，这个程序将在一个新的、最小化的环境中执行，也就是说，诸如PATH这样的环境变量，在sudo命令下已经被重置成默认状态了。所以当一个刚初始化的PATH变量中不包含你所要运行的程序所在的目录，用sudo去执行，你就会得到"command not found"的错误提示。

要想改变PATH在sudo会话中的初始值，用文本编辑器打开/etc/sudoers文件，找到"secure_path"一行，当你执行sudo 命令时，"secure_path"中包含的路径将被当做默认PATH变量使用。

添加所需要的路径(如 /usr/local/bin）到"secure_path"下，在开篇所遇见的问题就将迎刃而解。 

    Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

这个修改会即刻生效。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/define-path-environment-variable-sudo-commands.html

译者：[nd0104](https://github.com/nd0104) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

