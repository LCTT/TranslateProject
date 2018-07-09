迁移到 Linux：使用 sudo
======

>  sudo 机制可以让你轻松以普通用户偶尔执行管理任务。让我们来学习一下。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ray-hennessy-233438-unsplash.jpg?itok=d4l7QUtF)

本文是我们关于迁移到 Linux 的系列文章的第五篇。如果你错过了之前的那些，你可以在这里赶上：

[第1部分 - 入门介绍][1]
[第2部分 - 磁盘、文件和文件系统][2]
[第3部分 - 图形操作环境][3]
[第4部分 - 命令行][4]

你可能一直想了解 Linux。也许它在你的工作场所使用，如果你每天使用它，你的工作效率会更高。或者，也许你想在家里的某些计算机上安装 Linux。无论是什么原因，这一系列文章都是为了让过渡更容易。

与许多其他操作系统一样，Linux 支持多用户。它甚至支持多个用户同时登录。

用户帐户通常会被分配一个可以存储文件的家目录。通常这个家目​​录位于：

```
/home/<login name>
```

这样，每个用户都有存储自己的文档和其他文件的独立位置。

### 管理任务

在传统的 Linux 安装中，常规用户帐户无权在系统上执行管理任务。典型的安装 Linux 的系统会要求用户以管理员身份登录以执行某些任务，而不是为每个用户分配权限以执行各种任务。

Linux 上的管理员帐户称为 root。

### Sudo 解释

从历史上看，要执行管理任务，必须以 root 身份登录，执行任务，然后登出。这个过程有点乏味，所以很多人以 root 登录并且整天都以管理员身份工作。这种做法可能会导致灾难性的后果，例如，意外删除系统中的所有文件。当然，root 用户可以做任何事情，因此没有任何保护措施可以防止有人意外地执行影响很大的操作。

创建 `sudo` 工具是为了使你更容易以常规用户帐户登录，偶尔以 root 身份执行管理任务，而无需登录、执行任务然后登出。具体来说，`sudo` 允许你以不同的用户身份运行命令。如果你未指定特定用户，则假定你指的是 root 用户。

`sudo` 可以有复杂的设置，允许用户有权限使用 `sudo` 运行某些命令，而其他的不行。通常，安装的桌面系统会使创建的第一个帐户在 `sudo` 中有完全的权限，因此你作为主要用户可以完全管理 Linux 安装。

### 使用 Sudo

某些安装 Linux 的系统设置了 `sudo`，因此你仍需要知道 root 帐户的密码才能执行管理任务。其他人，设置 `sudo` 输入自己的密码。这里有不同的哲学。

当你尝试在图形环境中执行管理任务时，通常会打开一个要求输入密码的对话框。输入你自己的密码（例如，在 Ubuntu 上）或 root 帐户的密码（例如，Red Hat）。

当你尝试在命令行中执行管理任务时，它通常只会给你一个 “permission denied” 错误。然后你在前面用 `sudo` 重新运行命令。例如：

```
systemctl start vsftpd
Failed to start vsftpd.service: Access denied

sudo systemctl start vsftpd
[sudo] password for user1:
```

### 何时使用 Sudo

以 root 身份运行命令（在 `sudo` 或其他情况下）并不总是解决权限错误的最佳解决方案。虽然将以 root 身份运行会消除 “permission denied” 错误，但有时最好寻找根本原因而不是仅仅解决症状。有时文件拥有错误的所有者和权限。

当你在尝试一个需要 root 权限来执行操作的任务或者程序时使用 `sudo`。如果文件恰好由另一个用户（包括 root 用户）拥有，请不要使用 `sudo`。在第二种情况下，最好正确设置文件的权限。

通过 Linux 基金会和 edX 的免费[“Linux 介绍”][5]课程了解有关 Linux 的更多信息。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/3/migrating-linux-using-sudo

作者：[John Bonesio][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://linux.cn/article-9212-1.html
[2]:https://linux.cn/article-9213-1.html
[3]:https://linux.cn/article-9293-1.html
[4]:https://linux.cn/article-9565-1.html
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
