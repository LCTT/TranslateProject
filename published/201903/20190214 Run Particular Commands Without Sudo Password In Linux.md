[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10641-1.html)
[#]: subject: (Run Particular Commands Without Sudo Password In Linux)
[#]: via: (https://www.ostechnix.com/run-particular-commands-without-sudo-password-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

在 Linux 中运行特定命令而无需 sudo 密码
======

我有一台部署在 AWS 上的 Ubuntu 系统，在它的里面有一个脚本，这个脚本的原有目的是以一定间隔（准确来说是每隔 1 分钟）去检查某个特定服务是否正在运行，如果这个服务因为某些原因停止了，就自动重启这个服务。但问题是我需要 sudo 权限来开启这个服务。正如你所知道的那样，当我们以 sudo 用户运行命令时，我们应该提供密码，但我并不想这么做，实际上我想做的是以 sudo 用户的身份运行这个服务但无需提供密码。假如你曾经经历过这样的情形，那么我知道一个简单的方法来做到这点。今天，在这个简短的指南中，我将教你如何在类 Unix 的操作系统中运行特定命令而无需 sudo 密码。

就让我们看看下面的例子吧。

```
$ sudo mkdir /ostechnix
[sudo] password for sk:
```

![][2]

正如上面的截图中看到的那样，当我在根目录（`/`）中创建一个名为 `ostechnix` 的目录时，我需要提供 sudo 密码。每当我们尝试以 sudo 特权执行一个命令时，我们必须输入密码。而在我的预想中，我不想提供 sudo 密码。下面的内容便是我如何在我的 Linux 机子上运行一个 `sudo` 命令而无需输入密码的过程。

### 在 Linux 中运行特定命令而无需 sudo 密码

基于某些原因，假如你想允许一个用户运行特定命令而无需提供 sudo 密码，则你需要在 `sudoers` 文件中添加上这个命令。

假如我想让名为 `sk` 的用户去执行 `mkdir` 而无需提供 sudo 密码，下面就让我们看看该如何做到这点。

使用下面的命令来编辑 `sudoers` 文件：

```
$ sudo visudo
```

将下面的命令添加到这个文件的最后。

```
sk ALL=NOPASSWD:/bin/mkdir
```

![][3]

其中 `sk` 是用户名。根据上面一行的内容，用户 `sk` 可以从任意终端执行 `mkdir` 命令而不必输入 sudo 密码。 

你可以用逗号分隔的值来添加额外的命令（例如 `chmod`），正如下面展示的那样。

```
sk ALL=NOPASSWD:/bin/mkdir,/bin/chmod
```

保存并关闭这个文件，然后注销（或重启）你的系统。现在以普通用户 `sk` 登录，然后试试使用 `sudo` 来运行这些命令，看会发生什么。

```
$ sudo mkdir /dir1
```

![][4]

看到了吗？即便我以 sudo 特权运行 `mkdir` 命令，也不会弹出提示让我输入密码。从现在开始，当用户 `sk` 运行 `mkdir` 时，就不必输入 sudo 密码了。

当运行除了添加到 `sudoers` 文件之外的命令时，你将被提示输入 sudo 密码。

让我们用 `sudo` 来运行另一个命令。

```
$ sudo apt update
```

![][5]

看到了吗？这个命令将提示我输入 sudo 密码。

假如你不想让这个命令提示你输入 sudo 密码，请编辑 `sudoers` 文件：

```
$ sudo visudo
```

像下面这样将 `apt` 命令添加到 `sudoers` 文件中：

```
sk ALL=NOPASSWD:/bin/mkdir,/usr/bin/apt
```

你注意到了上面命令中 `apt` 二进制执行文件的路径与 `mkdir` 的有所不同吗？是的，你必须提供一个正确的可执行文件路径。要找到任意命令的可执行文件路径，例如这里的 `apt`，可以像下面这样使用 `whichis` 命令来查看：

```
$ whereis apt
apt: /usr/bin/apt /usr/lib/apt /etc/apt /usr/share/man/man8/apt.8.gz
```

如你所见，`apt` 命令的可执行文件路径为 `/usr/bin/apt`，所以我将这个路径添加到了 `sudoers` 文件中。

正如我前面提及的那样，你可以添加任意多个以逗号分隔的命令。一旦你做完添加的动作，保存并关闭你的 `sudoers` 文件，接着注销，然后重新登录进你的系统。

现在就检验你是否可以直接运行以 `sudo` 开头的命令而不必使用密码：

```
$ sudo apt update
```

![][6]

看到了吗？`apt` 命令没有让我输入 sudo 密码，即便我用 `sudo` 来运行它。

下面展示另一个例子。假如你想运行一个特定服务，例如 `apache2`，那么就添加下面这条命令到 `sudoers` 文件中：

```
sk ALL=NOPASSWD:/bin/mkdir,/usr/bin/apt,/bin/systemctl restart apache2
```

现在用户 `sk` 就可以运行 `sudo systemctl restart apache` 命令而不必输入 sudo 密码了。

我可以再次让一个特别的命令提醒输入 sudo 密码吗？当然可以！只需要删除添加的命令，注销然后再次登录即可。

除了这种方法外，你还可以在命令的前面添加 `PASSWD:` 指令。让我们看看下面的例子：

在 `sudoers` 文件中添加或者修改下面的一行：

```
sk ALL=NOPASSWD:/bin/mkdir,/bin/chmod,PASSWD:/usr/bin/apt
```

在这种情况下，用户 `sk` 可以运行 `mkdir` 和 `chmod` 命令而不用输入 sudo 密码。然而，当他运行 `apt` 命令时，就必须提供 sudo 密码了。

免责声明：本篇指南仅具有教育意义。在使用这个方法的时候，你必须非常小心。这个命令既可能富有成效但也可能带来摧毁性效果。例如，假如你允许用户执行 `rm` 命令而不输入 sudo 密码，那么他们可能无意或有意地删除某些重要文件。我警告过你了！

那么这就是全部的内容了。希望这个能够给你带来帮助。更多精彩内容即将呈现，请保持关注！

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/run-particular-commands-without-sudo-password-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-1.png
[3]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-7.png
[4]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-6.png
[5]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-4.png
[6]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-5.png
