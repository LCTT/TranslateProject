Linux系统 whoami 命令 – 知晓当前登陆用户
================================================================================
通常，在控制台的命令提示符下你会发现 **用户名已经被显示出来** 。但有一些 shell, 比如 **csh**, 默认情况下是不会显示你的用户名的。所以这个命令最应该用在那些不能回显用户名的 shell 终端上。

### 怎么样使用 whoami ###

要使用这个命令，仅仅只需要输入 whoami 。下面的例子中我们使用的是 chs shell 终端。

    % whoami

![](http://linoxide.com/wp-content/uploads/2013/12/csh.png)

### Whoami 的参数选项 ###

这个命令仅仅只有两个参数选项： **–help** 和 **–version**。

    % whoamin –help

![](http://linoxide.com/wp-content/uploads/2013/12/whoami_help.png)

下面这选项会输出和 **man whoami** 命令一样的信息

    % whoami –version

![](http://linoxide.com/wp-content/uploads/2013/12/whoami_version.png)

不同的是 **–version** 会显示你系统上的 whoami 命令的版本信息

### 相似性 ###

whoami 命令和 **id -un**  有相同的输出。它们都打印出当前用户的用户名。

    % id -un

![](http://linoxide.com/wp-content/uploads/2013/12/id-un.png)

### 结论 ###

whoami 命令也用于当你使用 su 命令（切换用户）时, 它能让你确认出你登陆的用户是否正确。 whoami 跟 who 命令不相同， who 命令会显示所有已经登陆的用户名，而 whoami 不是。当你切换用户时， whoami 命令会显示会话所属的当前用户，而 who 命令会显示你切换前的那个源用户。

![](http://linoxide.com/wp-content/uploads/2013/12/whoami_vs_who.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-whoami-command/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出