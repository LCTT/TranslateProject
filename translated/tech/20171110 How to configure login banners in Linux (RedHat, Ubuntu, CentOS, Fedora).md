如何在 Linux 中配置登录标题（RedHat、Ubuntu、CentOS、Fedora）
======
了解如何在 Linux 中创建登录标题，来向要登录或登录后的用户显示不同的警告或消息。

![Login banners in Linux][1]

无论何时登录公司的某些生产系统，你都会看到一些登录消息，警告或关于你将登录或已登录的服务器的信息，如下所示。这些是登录标题。

![Login welcome messages in Linux][2]

在本文中，我们将引导你配置它们。

你可以配置两种类型的标语。

  1. 用户登录前显示的标题信息（在你选择的文件中配置，例如 `/ etc / login.warn`）
  2. 用户成功登录后显示的标题信息（在 `/ etc / motd` 中配置）



### 如何在用户登录前连接系统时显示消息

当他连接到服务器并且在登录之前，这个消息将被显示给用户。意味着当他输入用户名时，该消息将在密码提示之前显示。

你可以使用任何文件名并在其中输入不的信息。在这里我们使用 `/ etc / login.warn` 并且把我们的消息放在里面。

```
# cat /etc/login.warn
        !!!! Welcome to KernelTalks test server !!!!
This server is meant for testing Linux commands and tools. If you are
not associated with kerneltalks.com and not authorized please dis-connect
immediately.
```

现在，不需要将此文件和路径告诉 `sshd` 守护进程，以便它可以为每个用户登录请求获取此标语。对于此，打开 `/etc/sshd/sshd_config` 文件并搜索 `#Banner none`。

这里你需要编辑文件并写下你的文件名并删除散列标记。它应该看起来像：`Banner /etc/login.warn`

保存文件并重启 `sshd` 守护进程。为避免断开现有的连接用户，请使用 HUP 信号重启 sshd。

```
oot@kerneltalks # ps -ef |grep -i sshd
root     14255     1  0 18:42 ?        00:00:00 /usr/sbin/sshd -D
root     19074 14255  0 18:46 ?        00:00:00 sshd: ec2-user [priv]
root     19177 19127  0 18:54 pts/0    00:00:00 grep -i sshd
 
root@kerneltalks # kill -HUP 14255
```

就是这样了！打开新的会话并尝试登录。你将看待你在上述步骤中配置的消息。

![Login banner in Linux][3]

你可以在用户输入密码登录系统之前看到此消息。

### 如何在用户登录后显示消息

消息用户在成功登录系统后看到的**当天消息**由 `/ etc / motd` 控制。编辑这个文件并输当他成功登录后欢迎用户的消息。

```
root@kerneltalks # cat /etc/motd
           W E L C O M E
Welcome to the testing environment of kerneltalks.
Feel free to use this system for testing your Linux
skills. In case of any issues reach out to admin at
info@kerneltalks.com. Thank you.
 
```

你不需要重启 `sshd` 守护进程来使更改生效。只要保存该文件，sshd 守护进程就会下一次登录请求时读取和显示。

![motd in linux][4]

你可以在上面的截图中看到：黄色框是由 `/ etc / motd` 控制的 MOTD，绿色框就是我们之前看到的登录标题。

你可以使用 [cowsay][5]、[banner][6]、[figlet][7]、[lolcat][8] 等工具创建出色的引人注目的登录消息。此方法适用于几乎所有 Linux 发行版，如 RedHat、CentOs、Ubuntu、Fedora 等。

--------------------------------------------------------------------------------

via: https://kerneltalks.com/tips-tricks/how-to-configure-login-banners-in-linux/

作者：[kerneltalks][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://c3.kerneltalks.com/wp-content/uploads/2017/11/login-banner-message-in-linux.png
[2]:https://c3.kerneltalks.com/wp-content/uploads/2017/11/Login-message-in-linux.png
[3]:https://c1.kerneltalks.com/wp-content/uploads/2017/11/login-banner.png
[4]:https://c3.kerneltalks.com/wp-content/uploads/2017/11/motd-message-in-linux.png
[5]:https://kerneltalks.com/tips-tricks/cowsay-fun-in-linux-terminal/
[6]:https://kerneltalks.com/howto/create-nice-text-banner-hpux/
[7]:https://kerneltalks.com/tips-tricks/create-beautiful-ascii-text-banners-linux/
[8]:https://kerneltalks.com/linux/lolcat-tool-to-rainbow-color-linux-terminal/
