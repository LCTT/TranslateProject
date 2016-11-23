在电脑和安卓设备之间使用 FTP 传输文件
====

[![How to transfer files between Linux and Android using FTP](https://itsfoss.com/wp-content/uploads/2016/09/linux-ftp-android.jpg)](https://itsfoss.com/wp-content/uploads/2016/09/linux-ftp-android.jpg)

每一个使用安卓设备的人都知道可以[使用 USB 线连接电脑来传输文件](https://itsfoss.com/how-to-connect-kindle-fire-hd-with-ubuntu-12-10/)，但是不是所有人都知道可以使用自由开源软件（FOSS 软件）通过无线连接到安卓设备。

我知道，这并非最简易的方式，但这样做的确很有趣而且感觉很极客。所有，如果你有一些 DIY 精神，让我为你展示如何在 Linux 和 安卓设备之间使用 FTP 来传输文件。

### 第一步：安装必要的软件

为了连接你的安卓设备，至少需要：一个 FTP 服务器和一个 FTP 客户端。这两者都有不少的选择，个人比较推荐 [Filezilla](https://filezilla-project.org/) 作为客户端，因为它是开源的，而且支持多种平台。

我最喜欢的 FOSS 安卓应用商店就是 [F-Droid](https://f-droid.org/)。F-Droid 有两个非常棒的 FTP 服务端应用：[primitive ftpd](https://f-droid.org/repository/browse/?fdfilter=ftp&fdid=org.primftpd) 和 [FTP Server (Free)](https://f-droid.org/repository/browse/?fdfilter=ftp&fdid=be.ppareit.swiftp_free)。这两者都只能运行在安卓 4.0 或者更高的版本中。本文我会集中介绍 primitive ftpd，如果使用 FTP Sever (free) 也是一样的步骤。

### 第二步：熟悉 FTP 服务器

安装好 FTP 客户端和服务端之后，就是设置两者之间的连接了。先从安卓设备的 FTP 服务端开始，首先，通过应用启动器打开 primitive ftpd。

[![android-1](https://itsfoss.com/wp-content/uploads/2016/09/android-1-169x300.png)](https://itsfoss.com/wp-content/uploads/2016/09/android-1.png)

打开应用之后，你将看到一大串的数字。不用紧张，你可以看到服务端已经分配到一个 IP 地址 (本文是 192.168.1.131)。往下看，将看到 FTP 和 SFTP 服务 (SFTP 是一个截然不同的协议，它通过 SSH 进行连接) 都是还未运行的。再往下就是用户名，本文设置为 user。

在屏幕顶端有两个按钮，一个用于开启 FTP 服务，另一个则是设置 FTP 服务。启动服务是不言自明的。

[![android-2](https://itsfoss.com/wp-content/uploads/2016/09/android-2-169x300.png)](https://itsfoss.com/wp-content/uploads/2016/09/android-2.png)

在设置菜单中，可以改变服务器的用户名、访问密码以及所使用的端口。并且你可以设置当服务器激活是阻止待机、服务开机自启或者变更主题。

![android-2-2](https://itsfoss.com/wp-content/uploads/2016/09/android-2.2-169x300.png)![android-3](https://itsfoss.com/wp-content/uploads/2016/09/android-3-169x300.png)![android-5](https://itsfoss.com/wp-content/uploads/2016/09/android-5-169x300.png)

### 第三步：使用 Filezilla

现在打开对应你所用系统的 Filezilla。使用 Filezilla 有两种方法：在需要传输文件时输入 IP、用户名、密码和端口，或者在 Filezilla 中预先保存这些信息（值得注意的是：基本上，每次你打开 FTP 服务时，IP 都会不同的，所用需要更新保存在 Filezilla 中信息）。我会展示这两种方法。

如果你想要手动输入，直接在 Filezilla 窗口上方输入必要的信息然后点击“快速连接”即可。

![filezilla-1-2](https://itsfoss.com/wp-content/uploads/2016/09/filezilla-1.2.png)

需要预先存储信息的话，点击文件菜单下方的按钮，这会打开“站点管理器”对话框，填写你想要保存的信息即可。通常，我设置“登录类型”为“询问密码”，安全为上。如果使用的是 FTP，保存默认选项即可；但如果使用的是 SFTP，必须在协议下拉选项框中进行协议的选择。

![filezilla-2](https://itsfoss.com/wp-content/uploads/2016/09/filezilla-2.png)

点击连接，输入密码即可。你会看到一个连接新主机的警告，这是可以在此验证屏幕上显示的“指纹信息”是否与 Primitive FTPD 上的一致。如果一致 (也应该是一致的)，点击确认添加都已知主机列表，之后就不会出现该警告了。

![filezilla-5](https://itsfoss.com/wp-content/uploads/2016/09/filezilla-5.png)

### 第四步：传输文件

现在，你会看到两个框，一个是“本地站点”，一个是“远程站点”，对应的呈现了你电脑和安装设备上的目录和文件信息。然后你就可以在电脑端浏览和传输文件到你的安卓设备上了。个人建议上传文件到你的 Download 文件夹，以便于文件跟踪管理。你可以右击某个文件，在弹出的菜单中选择上传或者下载以及移动操作，或者简单双击也行。

![filezilla-6](https://itsfoss.com/wp-content/uploads/2016/09/filezilla-6.png)

### 第五步：停止服务

当你完成文件的传输之后，你需要做得就是停止安卓设备上的 FTP 服务和关闭 Filezilla，如此简单，不是吗？

### 结论

我相信会有人指出，FTP 并不安全。而我认为，本例不需要考虑这个问题，因为连接时间一般很短。并且多数情况下，都是在家庭私有网络环境中进行操作。

这就是我在 Linux 和安卓设备间最喜欢使用的方法。

觉得有用吗？或有又没觉得推荐的相似软件？请在评论中告诉我们。

如果觉得此文有用，清花几分钟分享到你常用的社交站点中。

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-ftp-linux-android/

作者：[John Paul][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
