用‘slay’干掉某个用户的所有进程
================================================================================
**slay** 是**Chris Ausbrooks**写的一款用于杀掉指定用户所有运行进程的命令行工具。slay对系统管理员而言在找出那些不应该运行进程的用户是很有用的。

slay在大多数发行版中都有官方仓库。

安装

### Ubuntu 和它的衍生版 ###

    sudo apt-get install slay

### Arch Linux 和它的衍生版 ###

    sudo pacman -S slay

### Fedora 和它的衍生版 ###

    sudo yum install slay

### 用法 ###

你应该有管理员权限来使用slay，

要杀掉指定用户的进程，你就要：

    sudo slay <usename>

比如：我想杀掉用户**amitooo**的所有进程。

    ~ sudo slay amitooo
    slay: Done.

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/slay-amitoo-kpenee.png)

当slay运行完成后，你应该就可以看到反馈了。

爽吧？！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/kill-processes-specific-user-slay/

作者：[Enock Seth Nyamador][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/