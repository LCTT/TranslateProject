如何在命令行下使用 BitTorrent 下载 ISO 镜像
================================================================================
如果你喜欢尝试最新版甚至是 beta 版的 Linux 发行版来满足你的好奇心，并始终保持是最新版，那么你就会时常遇到下载较大的 ISO 镜像的烦恼。提供 ISO 的人通常会使用 ISO 镜像的 .torrent 文件来减少服务器的带宽消耗。P2P 下载对于使用者来说好处也是很明显的（就下载速度而言），特别是当流行的 Linux 发行版有新版本发布并上传供下载，每个人同时在下载做种的时候。

Ubuntu 14.10 (utopic Unicorn) 这刚刚发布不久，因此现在在 BitTorrent 网络上应该有很多种子可以下载该版本。虽然有很多基于图形界面的 BitTorrent 客户端，不过我将展示**如何通过基于简单的命令行界面的 BitTorrent 客户端下载 ISO 镜像**，如果是在远程无图形界面的服务器上的话这会很方便。在[另外一篇教程][4]里面，我还会演示**如何验证已下载的 ISO 镜像的完整性**。

我今天要使用的基于命令行的 BitTorrent 客户端是 transmission-cli。正如你可能知道的那样，[Transmission][1] 是最流行的基于图形界面的 BitTorrent 客户端之一。transmission-cli 是它的简装的命令行版本。

### 在 Linux 上安装 Transmission-cli ###

要安装 **transmission-cli**，你不必安装完整的基于图形界面的 Transmission，这是听起来不错。

在 Debian、Ubuntu 或者是基于它们的发行版上：

    $ sudo apt-get install transmission-cli 

在 Fedora 上：

    $ sudo yum install transmission-cli

在 CentOS 或者 RHEL 上（在安装了 [EPEL 仓库][2]之后）：

    $ sudo yum install transmission-cli 

### 通过 transmission-cli 快速地下载 ISO 镜像 ###

**transmission-cli**的使用非常简单。如果你懒于学习它的命令行选项，所有你要做的事情就是下载 .torrent 文件并运行命令。这会自动寻找可用的种子并从那里下载 ISO 文件。

    $ wget http://releases.ubuntu.com/14.10/ubuntu-14.10-desktop-amd64.iso.torrent
    $ transmission-cli ubuntu-14.10-desktop-amd64.iso.torrent 

![](https://farm4.staticflickr.com/3933/14999528344_9af3ea5d2e_z.jpg)

一旦 ISO 镜像下载完成，它默认存储在 ~/Downloads 文件夹中。下载 1GB 的 Ubuntu ISO 镜像只用了我 5 分钟的时间。

![](https://farm6.staticflickr.com/5605/15433651319_745df6633a_z.jpg)

程序下载 ISO 镜像完成后，你会在终端中看到“状态由未完成变为完成”的提示。要注意的是 transmission-cli 会继续运行并做种以便于其他下载者下载。可以按 Ctrl+C 来退出。

### 为重复使用定制下载选项 ###

如果你经常使用 **transmission-cli** ，那么值得花时间来熟悉一下它的命令行选项。

- "-w /path/to/download-directory" 选项指定下载文件保存的文件夹。

- "-f /path/to/finish-script" 选项设置当前下载完成后要运行的脚本。注意 transmission-cli 默认在文件下载完成后继续运行。如果你想在成功下载完成后自动关闭 transmission-cli，你可以使用这个选项。下面这个简单的脚本可以完成这个功能。
 	
 		#!/bin/sh
    	sleep 10
    	killall transmission-cli

- 如果你想为 transmission-cli 分配上传/下载带宽限制，你可以使用 “-d <download-speed-in-KB/s>” 和 “-u <upload-speed-in-KB/s>” 选项。如果你不想限制带宽使用，仅仅指定 “D” 或 “-U” 选项即可。

这有一个更高级的 transmission-cli 使用范例。在这个例子中，命令行客户端在成功下载后自动退出。下载速度不限而上传速度限制为 50KB/s。

    $ transmission-cli -w ~/iso -D -u 50 -f ~/finish.sh ubuntu-14.10-desktop-amd64.iso.torrent 

![](https://farm6.staticflickr.com/5599/15434697690_e9a19f0d97_z.jpg)

### 验证已下载的 ISO 镜像的完整性 ###

当你下载了一个 ISO 镜像，特别是从 BitTorrent 网络上很多未知的种子处下载的，通常建议要验证下载镜像的完整性。

对于 Ubuntu 发行版的情况， Canonical 提供了几个供验证使用的验校文件（如 MD5SUM， SHA1SUMS 和 SHA256SUMS）。在这个例子中我们使用 SHA256SUMS。

![](https://farm4.staticflickr.com/3943/15434697700_3b3e6077ee_z.jpg)

首先，下载下面两个文件。

    $ wget http://releases.ubuntu.com/14.10/SHA256SUMS
    $ wget http://releases.ubuntu.com/14.10/SHA256SUMS.gpg

第一个文件是 ISO 镜像的 SHA256 验校文件，而第二个文件（*.gpg）是验校文件的签名。第二个文件的目的是验证验校文件本身的有效性。

我们通过运行下面的命令来验证 SHA256SUMS 文件的有效性。

    $ gpg --verify SHA256SUMS.gpg SHA256SUMS 

----------

    gpg: Signature made Thu 23 Oct 2014 09:36:00 AM EDT using DSA key ID FBB75451
    gpg: Can't check signature: public key not found

如果你得到上面的错误信息，是因为你还没有导入生成这个签名的公共密钥。因此我们现在导入需要的公共密钥。

这样做之前，你需要知道公共密钥的 “key ID”，而这在上面的 gpg 命令的输出中有显示。在这个例子中，密钥 ID 时 “FBB75451”。运行下面的命令来从官方 Ubuntu 密钥服务器导入公共密钥。

    $ gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys FBB75451 

![](https://farm4.staticflickr.com/3953/15620291035_bcdb3cffb9_z.jpg)

既然公共密钥已经被导入，我们可以继续并重新运行之前的命令来验证签名。

    gpg --verify SHA256SUMS.gpg SHA256SUMS 

![](https://farm6.staticflickr.com/5600/15433651369_d22905e65b_z.jpg)

这次你没有看到 “public key not found” 的错误信息。如果 SHA256SUMS 文件时有效的，你会看到 “Good signature from <official source>” 的信息。注意到你还看到一个 “This key is not certified with a trusted signature” 的警告信息。基本上这个警告信息是告诉你对导入的公共密钥没有明确信任。要避免这个警告，你可以选择指定[完全信任][3]导入的公共密钥，但你应该只有在通过其他方式审查了这个密钥之后才这样做。否则的话，你可以暂时忽略这个警告。

在验证了 SHA256SUMS 文件的完整性后，最后一个步骤是比较已下载 ISO 文件的 SHA256 验校和和 SHA256SUMS 文件中对应的验校值。你可以使用 sha256sum 命令行工具来完成这个步骤。

为方便起见，下面一行命令比较 SHA256 验校和并报告结果。

     $ sha256sum -c <(grep ubuntu-14.10-desktop-amd64.iso SHA256SUMS) 

----------

    ubuntu-14.10-desktop-amd64.iso: OK

如果你看到了上面的输出信息，这表明两个验校值相匹配。这样已下载 ISO 镜像的完整性就被成功的验证了。

--------------------------------------------------------------------------------

via: http://xmodulo.com/download-iso-image-bittorrent-command-line.html

作者：[Dan Nanni][a]
译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://www.transmissionbt.com/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[3]:http://xmodulo.com/verify-authenticity-integrity-downloaded-file.html
[4]:http://xmodulo.com/download-iso-image-bittorrent-command-line.html
