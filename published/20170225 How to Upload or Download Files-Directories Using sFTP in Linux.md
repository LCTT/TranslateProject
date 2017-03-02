如何在 Linux 中使用 sFTP 上传或下载文件/文件夹
============================================================

[sFTP（安全文件传输程序）][1]是一种安全的交互式文件传输程序，其工作方式与 FTP（文件传输协议）类似。 然而，sFTP 比 FTP 更安全；它通过加密 SSH 传输处理所有操作。

它可以配置使用几个有用的 SSH 功能，如[公钥认证][2]和压缩。 它连接并登录到指定的远程机器，然后切换到交互式命令模式，在该模式下用户可以执行各种命令。

在本文中，我们将向你展示如何使用 sFTP 上传/下载整个目录（包括其子目录和子文件）。

### 如何在 Linux 中使用 sFTP 传输文件/文件夹

默认情况下，SFTP 协议采用和 SSH 传输协议一样的方式建立到远程服务器的安全连接。虽然，用户验证使用类似于 SSH 默认设置的密码方式，但是，建议[创建和使用 SSH 无密码登录][3]，以简化和更安全地连接到远程主机。

要连接到远程 sftp 服务器，如下建立一个安全 SSH 连接并创建 SFTP 会话：

```
$ sftp tecmint@192.168.56.10
```

登录到远程主机后，你可以如下运行交互式的 sFTP 命令：

```
sftp> ls			#list directory 
sftp> pwd			#print working directory on remote host
sftp> lpwd			#print working directory on local host
sftp> mkdir uploads		#create a new directory
```
[
 ![Run sFTP Commands on Remote Linux](http://www.tecmint.com/wp-content/uploads/2017/02/Run-sFTP-Commands-on-Remote-Linux.png) 
][4]

* Linux 主机上运行 sFTP 命令*

#### 如何使用 sFTP 上传文件夹

要将整个目录上传到远程 Linux 主机中，请使用 `put` 命令。但是，如果目录名称不存在于远程主机上的工作目录中，你将收到错误，如下面的屏幕截图所示。

因此，首先在远程主机上创建一个具有相同名称的目录，然后从本地主机上传它，`-r` 参数允许拷贝子目录和子文件：

```
sftp> put -r  Tecmint.com-articles
sftp> mkdir Tecmint.com-articles
sftp> put -r Tecmint.com-articles
```

[
 ![Upload Directory using SFTP](http://www.tecmint.com/wp-content/uploads/2017/02/Upload-Directory-using-SFTP.png) 
][5]

*使用 sFTP 上传文件夹*

要保留修改时间、访问时间以及被传输的文件的模式，请使用 `-p` 标志。

```
sftp> put -pr Tecmint.com-articles
```

#### 如何使用 sFTP 下载文件夹

要从远程 Linux 主机下载整个 fstools-0.0 文件夹到本机中，如下所示使用 get 命令带上 `-r` 标志：

```
sftp> get -r fstools-0.0
```
[
 ![Download Directory using sFTP](http://www.tecmint.com/wp-content/uploads/2017/02/Download-Directory-using-sFTP.png) 
][6]

*使用 sFTP 下载目录*

如果文件夹已经下载完成了，接着查看本机的工作目录。

要退出 sFTP shell，输入：

```
sftp> bye
或者
sftp> exit
```

此外，阅读这篇 [sFTP 命令和使用技巧][7]。

请注意，为了防止用户访问远程主机上的整个文件系统，出于安全原因，你可以使用 chroot Jail [将 sFTP 用户限制到其主目录][8]中。

就是这样了！在本文中，我们向你展示了如何使用 sFTP 上传/下载整个目录。使用下面的评论栏向我们提供你对本文/主题的看法。

--------------------------------------------------------------------------------


作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux 系统管理员和网络开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sftp-upload-download-directory-in-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/sftp-command-examples/
[2]:https://linux.cn/article-6901-1.html
[3]:https://linux.cn/article-6901-1.html
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Run-sFTP-Commands-on-Remote-Linux.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Upload-Directory-using-SFTP.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Download-Directory-using-sFTP.png
[7]:http://www.tecmint.com/sftp-command-examples/
[8]:http://www.tecmint.com/restrict-sftp-user-home-directories-using-chroot/
[9]:http://www.tecmint.com/author/aaronkili/
[10]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[11]:http://www.tecmint.com/free-linux-shell-scripting-books/
