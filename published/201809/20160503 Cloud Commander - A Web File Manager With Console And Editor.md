Cloud Commander：一个有控制台和编辑器的 Web 文件管理器
======

![](https://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-A-Web-File-Manager-With-Console-And-Editor-720x340.png)

**Cloud Commander** 是一个基于 web 的文件管理程序，它允许你通过任何计算机、移动端或平板电脑的浏览器查看、访问或管理系统文件或文件夹。它有两个简单而又经典的面板，并且会像你设备的显示尺寸一样自动转换大小。它也拥有两款内置的叫做 **Dword** 和 **Edward** 的文本编辑器，它们支持语法高亮，并带有一个支持系统命令行的控制台。因此，您可以随时随地编辑文件。Cloud Commander 服务器是一款在 Linux、Windows、Mac OS X 运行的跨平台应用，而且该应用客户端可以在任何一款浏览器上运行。它是用 **JavaScript/Node.Js** 写的，并使用 **MIT** 许可证。

在这个简易教程中，让我们看一看如何在 Ubuntu 18.04 LTS 服务器上安装 Cloud Commander。

### 前提条件

像我之前提到的，是用 Node.js 写的。所以为了安装 Cloud Commander，我们需要首先安装 Node.js。要执行安装，参考下面的指南。

- [如何在 Linux 上安装 Node.js](https://www.ostechnix.com/install-node-js-linux/)

### 安装 Cloud Commander

在安装 Node.js 之后，运行下列命令安装 Cloud Commander:

```
$ npm i cloudcmd -g
```

祝贺！Cloud Commander 已经安装好了。让我们往下继续看看 Cloud Commander 的基本使用。

### 开始使用 Cloud Commander

运行以下命令启动 Cloud Commander：

```
$ cloudcmd
```

**输出示例：**

```
url: http://localhost:8000
```

现在，打开你的浏览器并转到链接：`http://localhost:8000` 或 `http://IP-address:8000`。

从现在开始，您可以直接在本地系统或远程系统或移动设备，平板电脑等Web浏览器中创建，删除，查看，管理文件或文件夹。

![][2]

如你所见上面的截图，Clouder Commander 有两个面板，十个热键 （`F1` 到 `F10`），还有控制台。

每个热键执行的都是一个任务。

  * `F1` – 帮助
  * `F2` – 重命名文件/文件夹
  * `F3` – 查看文件/文件夹
  * `F4` – 编辑文件
  * `F5` – 复制文件/文件夹
  * `F6` – 移动文件/文件夹
  * `F7` – 创建新目录
  * `F8` – 删除文件/文件夹
  * `F9` – 打开菜单
  * `F10` – 打开设置

#### Cloud Commmander 控制台

点击控制台图标。这即将打开系统默认的命令行界面。

![][3]

在此控制台中，您可以执行各种管理任务，例如安装软件包、删除软件包、更新系统等。您甚至可以关闭或重新引导系统。 因此，Cloud Commander 不仅仅是一个文件管理器，还具有远程管理工具的功能。

#### 创建文件/文件夹

要创建新的文件或文件夹就右键单击任意空位置并找到 “New - >File or Directory”。

![][4]

#### 查看文件

你可以查看图片，查看音视频文件。

![][5]

#### 上传文件

另一个很酷的特性是我们可以从任何系统或设备简单地上传一个文件到 Cloud Commander 系统。

要上传文件，右键单击 Cloud Commander 面板的任意空白处，并且单击“Upload”选项。

![][6]

选择你想要上传的文件。

另外，你也可以上传来自像 Google 云盘、Dropbox、Amazon 云盘、Facebook、Twitter、Gmail、GitHub、Picasa、Instagram 还有很多的云服务上的文件。

要从云端上传文件, 右键单击面板的任意空白处，并且右键单击面板任意空白处并选择“Upload from Cloud”。

![][7]

选择任意一个你选择的网络服务，例如谷歌云盘。点击“Connect to Google drive”按钮。

![][8]

下一步，用 Cloud Commander 验证你的谷歌云端硬盘，从谷歌云端硬盘选择文件并点击“Upload”。

![][9]

#### 更新 Cloud Commander

要更新到最新的可用版本，执行下面的命令：

```
$ npm update cloudcmd -g
```

#### 总结

据我测试，它运行很好。在我的 Ubuntu 服务器测试期间，我没有遇到任何问题。此外，Cloud Commander 不仅是基于 Web 的文件管理器，还可以充当执行大多数 Linux 管理任务的远程管理工具。 您可以创建文件/文件夹、重命名、删除、编辑和查看它们。此外，您可以像在终端中在本地系统中那样安装、更新、升级和删除任何软件包。当然，您甚至可以从 Cloud Commander 控制台本身关闭或重启系统。 还有什么需要的吗？ 尝试一下，你会发现它很有用。

目前为止就这样吧。 我将很快在这里发表另一篇有趣的文章。 在此之前，请继续关注我们。

祝贺！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cloud-commander-a-web-file-manager-with-console-and-editor/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[fuzheng1998](https://github.com/fuzheng1998)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-Google-Chrome_006-4.jpg
[3]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-Google-Chrome_007-2.jpg
[4]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-commander-file-folder-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-home-sk-Google-Chrome_008-1.jpg
[6]:http://www.ostechnix.com/wp-content/uploads/2016/05/cloud-commander-upload-2.png
[7]:http://www.ostechnix.com/wp-content/uploads/2016/05/upload-from-cloud-1.png
[8]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-home-sk-Google-Chrome_009-2.jpg
[9]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-home-sk-Google-Chrome_010-1.jpg
