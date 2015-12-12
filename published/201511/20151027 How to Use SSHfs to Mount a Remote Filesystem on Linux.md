如何在 Linux 上使用 SSHfs 挂载一个远程文件系统
================================================================================
你曾经想过用安全 shell 挂载一个远程文件系统到本地吗？如果有的话，SSHfs 也许就是你所需要的。它通过使用 SSH 和 Fuse（LCTT 译注：Filesystem in Userspace，用户态文件系统，是 Linux 中用于挂载某些网络空间，如 SSH，到本地文件系统的模块） 允许你挂载远程计算机（或者服务器）到本地。

**注意**： 这篇文章假设你明白[SSH 如何工作并在你的系统中配置 SSH][1]。

### 准备 ###

在使用 SSHfs 挂载之前，需要进行一些设置 - 在你的系统上安装 SSHfs 以及 fuse 软件包。你还需要为 fuse 创建一个组，添加用户到组，并创建远程文件系统将会驻留的目录。

要在 Ubuntu Linux 上安装两个软件包，只需要在终端窗口输入以下命令：

    sudo apt-get install sshfs fuse

![ubuntu 安装 sshfs-fuse](https://www.maketecheasier.com/assets/uploads/2015/10/sshfs-install-fuse-ubuntu.jpg)

如果你使用的不是 Ubuntu，那就在你的发行版软件包管理器中搜索软件包名称。最好搜索和 fuse 或 SSHfs 相关的关键字，因为取决于你运行的系统，软件包名称可能稍微有些不同。

在你的系统上安装完软件包之后，就该创建好 fuse 组了。在你安装 fuse 的时候，应该会在你的系统上创建一个组。如果没有的话，在终端窗口中输入以下命令以便在你的 Linux 系统中创建组：

    sudo groupadd fuse

添加了组之后，把你的用户添加到这个组。

    sudo gpasswd -a "$USER" fuse

![sshfs 添加用户到组 fuse](https://www.maketecheasier.com/assets/uploads/2015/10/sshfs-add-user-to-fuse-group.png)

别担心上面命令的 `$USER`。shell 会自动用你自己的用户名替换。处理了和组相关的工作之后，就是时候创建要挂载远程文件的目录了。

    mkdir ~/remote_folder

在你的系统上创建了本地目录之后，就可以通过 SSHfs 挂载远程文件系统了。

### 挂载远程文件系统 ###

要在你的机器上挂载远程文件系统，你需要在终端窗口中输入一段较长的命令。

    sshfs -o idmap=user username@ip.address:/remote/file/system/ ~/remote

![sshfs 挂载文件系统到本地目录1](https://www.maketecheasier.com/assets/uploads/2015/10/sshfs-mount-file-system-to-local-folder.png)

**注意**： 也可以通过 SSH 密钥文件挂载 SSHfs 文件系统。只需要在上面的命中用 `sshfs -o IdentityFile=~/.ssh/keyfile`, 替换 `sshfs -o idmap=user` 部分。

输入这个命令之后，会提示你输入远程用户的密码。如果登录成功了，你的远程文件系统就会被挂载到之前创建的 `~/remote_folder` 目录。

![sshfs挂载文件系统到本地目录2](https://www.maketecheasier.com/assets/uploads/2015/10/sshfs-mount-file-system-to-local-folder-2.jpg)

使用完了你的远程文件系统，想要卸载它？容易吗？只需要在终端输入下面的命令：

    sudo umount ~/remote_folder

这个简单的命令会断开远程连接同时清空 remote_folder 目录。

### 总结 ###

在 Linux 上有很多工具可以用于访问远程文件并挂载到本地。但是如之前所说，如果有的话，也只有很少的工具能充分利用 SSH 的强大功能。我希望在这篇指南的帮助下，也能认识到 SSHfs 是一个多么强大的工具。

你觉得 SSHfs 怎么样呢？在下面的评论框里告诉我们吧！

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/sshfs-mount-remote-filesystem-linux/

作者：[Derrik Diener][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/setup-ssh-ubuntu/