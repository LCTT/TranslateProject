Linux 中如何通过命令行访问 Dropbox
================================================================================
在当今这个多设备的环境下，云存储无处不在。无论身处何方，人们都想通过多种设备来从云存储中获取所需的内容。由于拥有漂亮的 UI 和完美的跨平台兼容性，Dropbox 已成为最为广泛使用的云存储服务。 Dropbox 的流行已引发了一系列官方或非官方 Dropbox 客户端的出现，它们支持不同的操作系统平台。

当然 Linux 平台下也有着自己的 Dropbox 客户端： 既有命令行的，也有图形界面客户端。[Dropbox Uploader][1] 是一个简单易用的 Dropbox 命令行客户端，它是用 Bash 脚本语言所编写的（LCTT 译注：对，你没看错， 就是 Bash）。在这篇教程中，我将描述 **在 Linux 中如何使用 Dropbox Uploader 通过命令行来访问 Dropbox**。

### Linux 中安装和配置 Dropbox Uploader ###

要使用 Dropbox Uploader，你需要下载该脚本并使其可被执行。

    $ wget https://raw.github.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
    $ chmod +x dropbox_uploader.sh

请确保你已经在系统中安装了 `curl`，因为 Dropbox Uploader 通过 curl 来运行 Dropbox 的 API。

要配置 Dropbox Uploader，只需运行 dropbox_uploader.sh 即可。当你第一次运行这个脚本时，它将请求得到授权以使得脚本可以访问你的 Dropbox 账户。

    $ ./dropbox_uploader.sh

![](https://c2.staticflickr.com/6/5739/22860931599_10c08ff15f_c.jpg)

如上图所指示的那样，你需要通过浏览器访问 [https://www.dropbox.com/developers/apps][2] 页面，并创建一个新的 Dropbox app。接着像下图那样填入新 app 的相关信息，并输入 app 的名称，它与 Dropbox Uploader 所生成的 app 名称类似。

![](https://c2.staticflickr.com/6/5745/22932921350_4123d2dbee_c.jpg)

在你创建好一个新的 app 之后，你将在下一个页面看到 app key 和 app secret。请记住它们。

![](https://c1.staticflickr.com/1/736/22932962610_7db51aa718_c.jpg)

然后在正运行着 dropbox_uploader.sh 的终端窗口中输入 app key 和 app secret。然后 dropbox_uploader.sh 将产生一个 oAUTH 网址(例如，https://www.dropbox.com/1/oauth/authorize?oauth_token=XXXXXXXXXXXX)。

![](https://c1.staticflickr.com/1/563/22601635533_423738baed_c.jpg)

接着通过浏览器访问那个 oAUTH 网址，并同意访问你的 Dropbox 账户。

![](https://c1.staticflickr.com/1/675/23202598606_6110c1a31b_c.jpg)

这便完成了 Dropbox Uploader 的配置。若要确认 Dropbox Uploader 是否真的被成功地认证了，可以运行下面的命令。

    $ ./dropbox_uploader.sh info

----------

    Dropbox Uploader v0.12
    
     > Getting info... 
    
    Name:   Dan Nanni
    UID:    XXXXXXXXXX
    Email:  my@email_address
    Quota:  2048 Mb
    Used:   13 Mb
    Free:   2034 Mb

### Dropbox Uploader 示例 ###

要显示根目录中的所有内容，运行：

    $ ./dropbox_uploader.sh list

要列出某个特定文件夹中的所有内容，运行：

    $ ./dropbox_uploader.sh list Documents/manuals

要上传一个本地文件到一个远程的 Dropbox 文件夹，使用：

    $ ./dropbox_uploader.sh upload snort.pdf Documents/manuals

要从 Dropbox 下载一个远程的文件到本地，使用：

    $ ./dropbox_uploader.sh download Documents/manuals/mysql.pdf ./mysql.pdf

要从 Dropbox 下载一个完整的远程文件夹到一个本地的文件夹，运行：

    $ ./dropbox_uploader.sh download Documents/manuals ./manuals

要在 Dropbox 上创建一个新的远程文件夹，使用：

    $ ./dropbox_uploader.sh mkdir Documents/whitepapers

要完全删除 Dropbox 中某个远程的文件夹（包括它所含的所有内容），运行：

    $ ./dropbox_uploader.sh delete Documents/manuals

--------------------------------------------------------------------------------

via: http://xmodulo.com/access-dropbox-command-line-linux.html

作者：[Dan Nanni][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://www.andreafabrizi.it/?dropbox_uploader
[2]:https://www.dropbox.com/developers/apps
