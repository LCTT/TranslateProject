mimipenguin：从当前 Linux 用户转储登录密码
============================================================

mimipenguin 是一个免费、开源、简单但是强大的 shell/python 脚本，用来从当前 Linux 桌面用户转储登录凭证（用户名和密码），并且已在不同的 Linux 发行版中测试过。

另外，它还支持如：VSFTPd（活跃的 FTP 客户端连接）、Apache2（活跃的/旧的 HTTP 基础认证会话，但是这需要 Gcore），还有 openssh-server（活跃的 SSH 链接，需用 [sudo 命令][5]）。重要的是，它逐渐被移植到其他语言中，以支持所有可想到的以后可以利用的情况。

### mimipenguin 是如何工作的？

要理解 mimipenguin 是如何工作的，你需要知道所有或者大多数的 Linux 发行版会在内存中存储大量的重要信息, 如：凭据、加密密钥以及个人数据。

尤其是用户名和密码是由进程（运行中的程序）保存在内存中，并以明文形式存储较长时间。mimipenguin 在技术上利用这些在内存中的明文凭证 - 它会转储一个进程，并提取可能包含明文凭据的行。

然后，通过以下内容的哈希值来尝试计算每个单词的出现几率：`/etc/shadow`、内存和 regex 搜索。一旦找到任何内容，它就会在标准输出上打印出来。

### 在 Linux 中安装 mimipenguin

我们将使用 git 来克隆 mimipenguin 仓库，因此如果你还没安装，那么首先在系统上安装 git。

```
$ sudo apt install git 		#Debian/Ubuntu systems
$ sudo yum install git		#RHEL/CentOS systems
$ sudo dnf install git		#Fedora 22+
```

接着像这样在你的家目录（或者其他任何地方）克隆 mimipenguin 目录：

```
$ git clone https://github.com/huntergregal/mimipenguin.git
```

下载完成后，进入并如下运行 mimipenguin：

```
$ cd mimipenguin/
$ ./mimipenguin.sh 
```

注意：如果你遇到下面的错误，那就使用 sudo 命令：

```
Root required - You are dumping memory...
Even mimikatz requires administrator
```

![Dump Login Passwords in Linux](https://www.tecmint.com/wp-content/uploads/2017/06/Dump-Login-Passwords-in-Linux.png)

*在 Linux 中转储登录密码*

从上面的输出中，mimipenguin 向你提供了桌面环境的用户名和密码。

另外，还可以如下运行 python 版脚本：

```
$ sudo ./mimipenguin.py
```

注意有时 gcore 可能会阻塞脚本（这是 gcore 中一个已知问题）。

#### 未来更新

下面是将会被添加到 mimipenguin 的功能：

*   提升总体效率
*   添加更多支持以及其他的凭据位置
*   包括支持非桌面环境
*   添加 LDAP 的支持

mimipenguin 的 Github 仓库：[https://github.com/huntergregal/mimipenguin][6]

同样，请查阅：

1.  [如何在 Linux 中用密码保护一个 vim 文件][1]
2.  [如何在 Linux 中生成/加密/解密随机密码][2]
3.  [如何在 RHEL/CentOS/Fedora 中用密码保护 GRUB][3]
4.  [在 CentOS 7 中重置/恢复忘记的 root 用户账号密码][4]

在下面的评论栏中分享你关于这个工具的额外想法或者对 Linux 中内存中明文凭据的问题。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，即将成为 Linux SysAdmin 和网络开发人员，目前是 TecMint 的内容创作者，他喜欢在电脑上工作，并坚信分享知识。

-------------

via: https://www.tecmint.com/mimipenguin-hack-login-passwords-of-linux-users/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://linux.cn/article-8547-1.html
[2]:https://www.tecmint.com/generate-encrypt-decrypt-random-passwords-in-linux/
[3]:https://www.tecmint.com/password-protect-grub-in-linux/
[4]:https://linux.cn/article-8212-1.html
[5]:https://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[6]:https://github.com/huntergregal/mimipenguin
[7]:https://www.tecmint.com/author/aaronkili/
[8]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[9]:https://www.tecmint.com/free-linux-shell-scripting-books/
