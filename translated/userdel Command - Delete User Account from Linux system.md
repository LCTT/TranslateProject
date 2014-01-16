userdel 命令 - 从Linux系统中删除用户账户
================================================================================
**userdel** command to delete a user
在服务器上维护用户意味着加入、修改和删除他们。当用户不在需要在系统上时，我们需要删除它避免安全缺口。在Linux系统上，我们有**userdel**命令来删除一个用户。

![](http://linoxide.com/wp-content/uploads/2013/12/userdel-linux-command.jpg)

### userdel是什么 ###

userdel是一个底层用于删除用户的工具。在Debian上，我们应该通常使用deluser命令。userdel会查询系统账户文件，例如 **/etc/password** 和 **/etc/group**。那么他会删除所有和用户名相关的条目。在我们删除它之前，用户名必须存在。

### 如何使用userdel ###
既然userdel会修改系统账户文件，那么我们**需要root特权**来运行它。不然我们会遇到一个错误信息“*only root can do that*”或者相似的信息。在我们得到特权后，我们可以在你的控制台下在userdel后面输入用户名。下面是一个平常默认使用userdel的例子。

    $ sudo userdel pasadena

或者

    # userdel pasadena

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_default.png)

如你所见，我们不能没有root权限而删除用户pasadena。当我们有权限时，系统不会给出错误信息，这意味着用户已经成功删除。

### 完全删除用户家目录 ###

不带选项使用userdel，只会删除用户。用户的家目录将仍会在/home目录下。

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_home_folder.png)

当我们进入/home目录时，我们仍旧可以看到1002拥有pasadena文件夹。已创建的用户会有一个与用户名相同的组名。1002是pasadena用户名的UID和GID，还是pasadena的组名。

为了在删除用户时完全删除家目录，我们可以使用-r选项。这个选项同样会删除用户的邮件池如果存在的话。

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_r.png)

### 强制删除一个用户 ###

Userdel provide **-f** option to force user deletion. This option will delete a user even the user still log in into Linux system. Please take a look a sample screenshot.
userdel提供了**-f**选项来强制删除用户。这个选项会删除用户及时用户已经登入系统。请看一下示例截图

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_f.png)

截图的上面显示用户pasadena已经登陆了系统。它被标记的进程**6218**是SSHD进程。但是当我们用“**userdel -f pasadena**”只会显示已经登陆的用户的信息。命令本身是成功的。如果我们使用[cat 命令][1]查看**/etc/passwd**的内容，我们看不到到用户pasadena存在了。他的家目录还存在但是属主已经改变。

有一点我们必须知道的额是，带**-f**选项的userdel**不会断开**SSH链接。因此用户仍旧是已登录并是活跃的及时用户已不存在。但是当用户登出后用户不再可以登陆因为用户已经删除。

因此**这个选项使用很危险**因为它会使你的系统进入不一致的状态。

总结

userdel是一个Linux系统内部删除用户的工具。userdel同样**deluser**命令的后端，一个perl删除用户的脚本。如往常一样，你可以输入**man userdel**来探索关于userdel命令的更多细节。 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-userdel-command/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/13-cat-command-examples/
