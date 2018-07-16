userdel 命令 - 从Linux系统中删除用户账户
================================================================================

在服务器上维护用户就是添加、修改以及删除用户。当一个用户出于某种原因不再需要登录系统时，我们需要删除此用户以避免安全漏洞。在Linux系统上，我们用 **userdel** 命令来删除一个用户。

![](http://linoxide.com/wp-content/uploads/2013/12/userdel-linux-command.jpg)

### userdel是什么 ###

userdel 是一个底层用于删除用户的工具。在 Debian 上，我们通常会使用 deluser 命令。userdel 会查询系统账户文件，例如 **/etc/password** 和 **/etc/group**。那么它会删除所有和用户名相关的条目。在我们删除它之前，用户名必须存在。

### 如何使用userdel ###

由于 userdel 会修改系统账户文件，那么我们**需要root特权**来运行它。不然我们会遇到一个报错信息“*只有root权限才能执行这项操作*”或者类似的信息。在我们得到特权后，我们可以通过输入 userdel 从你的控制台删除用户。下面是一个默认使用 userdel 的样例。

    $ sudo userdel pasadena

或者

    # userdel pasadena

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_default.png)

正如你所见，我们不能没有root权限而删除用户 pasadena。当我们有权限时，系统不会给出错误信息，这意味着用户已经成功删除。

### 完全删除用户家目录 ###

不带选项使用 userdel，只会删除用户。用户的家目录将仍会在/home目录下。

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_home_folder.png)

当我们进入/home目录时，我们仍旧可以看到ID 1002拥有 pasadena 文件夹。已创建的用户通常会有一个与用户名相同的组名。1002是 pasadena 用户名的 UID 和 pasadena 组名的 GID。

为了在删除用户时完全删除家目录，我们可以使用 **-r** 选项。这个选项同样会删除用户的邮件池，如果存在的话。

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_r.png)

### 强制删除一个用户 ###

userdel 提供了 **-f** 选项来强制删除用户。甚至当用户已经登入 Linux 系统时此选项仍旧生效。请看一下示例截图。

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_f.png)

截图的上面显示用户 pasadena 已经登录了系统。它被标记的进程**6218**是 SSHD 进程。而当我们用“**userdel -f pasadena**”只会显示已经登录的要被删除的用户信息。命令本身已经成功。如果我们使用[cat 命令][1]查看**/etc/passwd**的内容，我们看不到到用户 pasadena 存在了。他的家目录还存在但是所有者只能显示为数字ID。

有一件事我们必须了解，带 **-f** 选项的 userdel **不会断开** 该用户已有的 SSH 链接。因此，即使用户已经不存在，但实际上仍是登录状态，并且是活跃用户。但是当用户登出后不可再登录，因为用户已经被删除。

因此**所以这个选项使用起来有些危险**，因为它会使你的系统进入不一致的状态。

### 总结 ###

userdel 是一个 Linux 系统内部删除用户的工具。userdel同样是**deluser**命令的后端，这是一个用perl编写的删除用户的脚本。如往常一样，你可以输入**man userdel**来查看关于userdel命令的更多细节。 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-userdel-command/

译者：[geekpi](https://github.com/geekpi) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/13-cat-command-examples/
