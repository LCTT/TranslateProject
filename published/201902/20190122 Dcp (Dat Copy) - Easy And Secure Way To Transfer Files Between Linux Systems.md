[#]: collector: (lujun9972)
[#]: translator: (dianbanjiu)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10516-1.html)
[#]: subject: (Dcp (Dat Copy) – Easy And Secure Way To Transfer Files Between Linux Systems)
[#]: via: (https://www.2daygeek.com/dcp-dat-copy-secure-way-to-transfer-files-between-linux-systems/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

dcp：采用对等网络传输文件的方式
======

Linux 本就有 `scp` 和 `rsync` 可以完美地完成这个任务。然而我们今天还是想试点新东西。同时我们也想鼓励那些使用不同的理论和新技术开发新东西的开发者。

我们也写过其他很多有关这个主题的文章，你可以点击下面的链接访问这些内容。  

它们分别是 [OnionShare][1]、[Magic Wormhole][2]、[Transfer.sh][3] 和 ffsend。   

### 什么是 dcp？

[dcp][4] 可以在不同主机之间使用 Dat 对等网络复制文件。

`dcp` 被视作一个像是 `scp` 这样工具的替代品，而无需在主机间进行 SSH 授权。  

这可以让你在两个主机间传输文件时，无需操心所述主机之间互相访问的细节，以及这些主机是否使用了 NAT。 

`dcp` 零配置、安全、快速、且是 P2P 传输。这并不是一个商用软件，使用产生的风险将由使用者自己承担。    

### 什么是 Dat 协议

Dat 是一个 P2P 协议，是一个致力于下一代 Web 的由社区驱动的项目。  

### dcp 如何工作

`dcp` 将会为指定的文件或者文件夹创建一个 dat 归档，并生成一个公开密钥，使用这个公开密钥可以让其他人从另外一台主机上下载上面的文件。  

使用网络共享的任何数据都使用该归档的公开密钥加密，也就是说文件的接收权仅限于那些拥有该公开密钥的人。  

### dcp 使用案例

  * 向多个同事发送文件 —— 只需要告诉他们生成的公开密钥，然后他们就可以在他们的机器上收到对应的文件了。  
  * 无需设置 SSH 授权就可以在你本地网络的两个不同物理机上同步文件。  
  * 无需压缩文件并把文件上传到云端就可以轻松地发送文件。  
  * 当你有 shell 授权而没有 SSH 授权时也可以复制文件到远程服务器上。  
  * 在没有很好的 SSH 支持的 Linux/macOS 以及 Windows 系统之间分享文件。  

### 如何在 Linux 上安装 NodeJS & npm？

`dcp` 是用 JavaScript 写成的，所以在安装 `dcp` 前，需要先安装 NodeJS。在 Linux 上使用下面的命令安装 NodeJS。  

Fedora 系统，使用 [DNF 命令][5] 安装 NodeJS & npm。  

```
$ sudo dnf install nodejs npm
```

Debian/Ubuntu 系统，使用 [APT-GET 命令][6] 或者 [APT 命令][6] 安装 NodeJS & npm。  

```
$ sudo apt install nodejs npm
```

Arch Linux 系统，使用 [Pacman 命令][8] 安装 NodeJS & npm。  

```
$ sudo pacman -S nodejs npm
```

RHEL/CentOS 系统，使用 [YUM 命令][9] 安装 NodeJS & npm。  

```
$ sudo yum install epel-release
$ sudo yum install nodejs npm
```

openSUSE Leap 系统，使用 [Zypper 命令][10] 安装 NodeJS & npm。  

```
$ sudo zypper nodejs6
```

### 如何在 Linux 上安装 dcp？

在安装好 NodeJS 后，使用下面的 `npm` 命令安装 `dcp`。  

`npm` 是一个 JavaScript 的包管理器。它是 JavaScript 的运行环境 Node.js 的默认包管理器。

```
# npm i -g dat-cp
```

### 如何通过 dcp 发送文件？

在 `dcp` 命令后跟你想要传输的文件或者文件夹。而且无需注明目标机器的名字。  

```
# dcp [File Name Which You Want To Transfer]
```

在你运行 `dcp` 命令时将会为传送的文件生成一个 dat 归档。一旦执行完成将会在页面底部生成一个公开密钥。（LCTT 译注：此处并非非对称加密中的公钥/私钥对，而是一种公开的密钥，属于对称加密。）

### 如何通过 dcp 接收文件

在远程服务器上输入公开密钥即可接收对应的文件或者文件夹。  

```
# dcp [Public Key]
```

以递归形式复制目录。  

```
# dcp [Folder Name Which You Want To Transfer] -r
```

下面这个例子我们将会传输单个文件。  

![][12]

上述文件传输的输出。  

![][13]

如果你想传输不止一个文件，使用下面的格式。  

![][14]

上述文件传输的输出。  

![][15]

递归复制文件夹。  

![][16]

上述文件夹传输的输出。  

![][17]

这种方式下你只能够下载一次文件或者文件夹，不可以多次下载。这也就意味着一旦你下载了这些文件或者文件夹，这个链接就会立即失效。  

![][18]

也可以在手册页查看更多的相关选项。  

```
# dcp --help
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/dcp-dat-copy-secure-way-to-transfer-files-between-linux-systems/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/onionshare-secure-way-to-share-files-sharing-tool-linux/
[2]: https://www.2daygeek.com/wormhole-securely-share-files-from-linux-command-line/
[3]: https://www.2daygeek.com/transfer-sh-easy-fast-way-share-files-over-internet-from-command-line/
[4]: https://github.com/tom-james-watson/dat-cp
[5]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[6]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[7]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[10]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[11]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-1.png
[13]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-2.png
[14]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-3.jpg
[15]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-4.jpg
[16]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-6.jpg
[17]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-7.jpg
[18]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-5.jpg
