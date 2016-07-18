教你用 google-drive-ocamlfuse 在 Linux 上挂载 Google Drive
=====================

>如果你在找一个方便的方式在 Linux 机器上挂载你的 Google Drive 文件夹， Jack Wallen 将教你怎么使用 google-drive-ocamlfuse 来挂载 Google Drive。

![](http://tr4.cbsistatic.com/hub/i/2016/05/18/ee5d7b81-e5be-4b24-843d-d3ca99230a63/651be96ac8714698f8100afa6883e64d/linuxcloudhero.jpg)
>图片来源: Jack Wallen

Google 还没有发行 Linux 版本的 Google Drive 应用，尽管现在有很多方法从 Linux 中访问你的 Drive 文件。
（注：不清楚 app 需不需要翻译成应用，这里翻译了）

如果你喜欢界面化的工具，你可以选择 Insync。如果你喜欢用命令行，这有很多工具，像 Grive2 和用 Ocaml 语言编写的、非常容易使用的、基于 FUSE 的系统（注：there are tools such as Grive2 and the incredibly easy to use FUSE-based system written in Ocaml. 这一句感觉翻译不出来）。我将会用后面这种方式演示如何在 Linux 桌面上挂载你的 Google Drive。尽管这是通过命令行完成的，但是它的用法会简单到让你吃惊。它太简单了以至于谁都能做到。

系统特点：

- 对普通文件/文件夹有完全的读写权限
- 对于 Google Docs，sheets，slides 这三个应用只读
- 能够访问 Drive 回收站（.trash）
- 处理重复文件功能
- 支持多个帐号

接下来完成 google-drive-ocamlfuse 在 Ubuntu 16.04 桌面的安装，然后你就能够访问云盘上的文件了。

### 安装

1. 打开终端。
2. 用`sudo add-apt-repository ppa:alessandro-strada/ppa`命令添加必要的 PPA
3. 出现提示的时候，输入密码并按下回车。
4. 用`sudo apt-get update`命令更新应用。
5. 输入`sudo apt-get install google-drive-ocamlfuse`命令安装软件。
（注：这里，我把所有的命令加上着重标记了）

### 授权

接下来就是授权 google-drive-ocamlfuse，让它有权限访问你的 Google 账户。先回到终端窗口敲下命令 google-drive-ocamlfuse，这个命令将会打开一个浏览器窗口，它会提示你登陆你的 Google 帐号或者如果你已经登陆了 Google 帐号，它会询问是否允许 google-drive-ocamlfuse 访问 Google 账户。如果你还没有登陆，先登陆然后点击允许。接下来的窗口（在 Ubuntu 16.04 桌面上会出现，但不会出现在基本系统 Freya 桌面上）将会询问你是否授给 gdfuse 和 OAuth2 Endpoint访问你的 Google 账户的权限，再次点击允许。然后出现的窗口就会告诉你等待授权令牌下载完成，这个时候就能最小化浏览器了。当你的终端提示像图 A 一样的内容，你就能知道令牌下载完了，并且你已经可以挂载 Google Drive 了。

**图 A**

![](http://tr4.cbsistatic.com/hub/i/r/2016/05/18/a493122b-445f-4aca-8974-5ec41192eede/resize/620x/6ae5907ad2c08dc7620b7afaaa9e389c/googledriveocamlfuse3.png)
>图片来源: Jack Wallen

**应用已经得到授权，你可以进行后面的工作。**

### 挂载 Google Drive

在挂载 Google Drive 之前，你得先创建一个文件夹，作为挂载点。在终端里，敲下`mkdir ~/google-drive`命令在你的家目录下创建一个新的文件夹。最后敲下命令`google-drive-ocamlfuse ~/google-drive`将你的 Google Drive 挂载到 google-drive 文件夹中。

这时你可以查看本地 google-drive 文件夹中包含的 Google Drive 文件/文件夹。你能够把 Google Drive 当作本地文件系统来进行工作。

当你想 卸载 google-drive 文件夹，输入命令 `fusermount -u ~/google-drive`。

### 没有 GUI，但它特别好用

我发现这个特别的系统非常容易使用，在同步 Google Drive 时它出奇的快，并且这可以作为一种巧妙的方式备份你的 Google Drive 账户。

试试 google-drive-ocamlfuse，看看你能用它做出什么有趣的事。

--------------------------------------------------------------------------------

via: http://www.techrepublic.com/article/how-to-mount-your-google-drive-on-linux-with-google-drive-ocamlfuse/

作者：[Jack Wallen ][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.techrepublic.com/search/?a=jack+wallen
