如何使用 lftp 来加速 Linux/UNIX 上的 ftp/https 下载速度
======

`lftp` 是一个文件传输程序。它可以用复杂的 FTP、 HTTP/HTTPS 和其他连接。如果指定了站点 URL，那么 `lftp` 将连接到该站点，否则会使用 `open` 命令建立连接。它是所有 Linux/Unix 命令行用户的必备工具。我目前写了一些关于 [Linux 下超快命令行下载加速器][1]，比如 Axel 和 prozilla。`lftp` 是另一个能做相同的事，但有更多功能的工具。`lftp` 可以处理七种文件访问方式：

  1. ftp
  2. ftps
  3. http
  4. https
  5. hftp
  6. fish
  7. sftp
  8. file

### 那么 lftp 的独特之处是什么？

  * `lftp` 中的每个操作都是可靠的，即任何非致命错误都被忽略，并且重复进行操作。所以如果下载中断，它会自动重新启动。即使 FTP 服务器不支持 `REST` 命令，lftp 也会尝试从开头检索文件，直到文件传输完成。
  * `lftp` 具有类似 shell 的命令语法，允许你在后台并行启动多个命令。
  * `lftp` 有一个内置的镜像功能，可以下载或更新整个目录树。还有一个反向镜像功能（`mirror -R`），它可以上传或更新服务器上的目录树。镜像也可以在两个远程服务器之间同步目录，如果可用的话会使用 FXP。

### 如何使用 lftp 作为下载加速器

`lftp` 有 `pget` 命令。它能让你并行下载。语法是：

```
lftp -e 'pget -n NUM -c url; exit'
```

例如，使用 `pget` 分 5个部分下载 <http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.22.2.tar.bz2>：

```
$ cd /tmp 
$ lftp -e 'pget -n 5 -c http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.22.2.tar.bz2'
```

示例输出：

```
45108964 bytes transferred in 57 seconds (775.3K/s)
lftp :~>quit
```

这里：

  1. `pget` - 并行下载文件
  2. `-n 5` - 将最大连接数设置为 5
  3. `-c` - 如果当前目录存在 `lfile.lftp-pget-status`，则继续中断的传输

### 如何在 Linux/Unix 中使用 lftp 来加速 ftp/https下载

再尝试添加 `exit` 命令：

```
$ lftp -e 'pget -n 10 -c https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.15.tar.xz; exit'`

[Linux-lftp-command-demo][https://www.cyberciti.biz/tips/wp-content/uploads/2007/08/Linux-lftp-command-demo.mp4]

### 关于并行下载的说明

请注意，通过使用下载加速器，你将增加远程服务器负载。另请注意，`lftp` 可能无法在不支持多点下载的站点上工作，或者防火墙阻止了此类请求。

其它的命令提供了更多功能。有关更多信息，请参考 [lftp][2] 的 man 页面：

```
man lftp
```

### 关于作者

作者是 nixCraft 的创建者，经验丰富的系统管理员，也是 Linux 操作系统/Unix shell 脚本的培训师。他曾与全球客户以及IT、教育、国防和太空研究以及非营利部门等多个行业合作。在 [Twitter][9]、[Facebook][10]、[Google +][11] 上关注他。通过 [RSS/XML 订阅][5]获取最新的系统管理、Linux/Unix 以及开源主题教程。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/linux-unix-download-accelerator.html

作者：[Vivek Gite][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/tips/download-accelerator-for-linux-command-line-tools.html
[2]:https://lftp.yar.ru/
[3]:https://twitter.com/nixcraft
[4]:https://facebook.com/nixcraft
[5]:https://plus.google.com/+CybercitiBiz
[6]:https://www.cyberciti.biz/atom/atom.xml
