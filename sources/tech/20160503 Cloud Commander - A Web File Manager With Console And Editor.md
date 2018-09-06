fuzheng1998 translating
======
Cloud Commander – 一个有控制台和编辑器在Web 上的文件管家
======

![](https://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-A-Web-File-Manager-With-Console-And-Editor-720x340.png)

**Cloud Commander** 是一个基于 web 的文件管理程序，它允许你通过任何计算机、移动端或平板电脑的 web 浏览器查看、访问或管理系统文件或文件夹。他有两个简单而又经典的面板，并且会自动。It has two simple and classic panels, and automatically converts it’s size as per your device’s display size. It also has two built-in editors namely **Dword** and **Edward** with support of Syntax-highlighting and one **Console** with support of your system’s command line. So you can edit your files on the go. Cloud Commander server is a cross-platform application that runs on Linux, Windows and Mac OS X operating systems, and 客户端将在任何一款浏览器上运行the client will run on any web browser. 它是用 **JavaScript/Node.Js**，and is licensed under **MIT**.

在这个简易教程中，让我们看一看如何在 Ubuntu 18.04 LTS 服务器上安装 Cloud Commander。

### 前提条件

像我之前提到的，是用 Node.js 写的。所以为了安装 Cloud Commander，我们需要首先安装 Node.js。To do so, refer the following guide.

### 安装 Cloud Commander

在安装 Node.js 之后，运行下列命令安装 Cloud Commander:
```
$ npm i cloudcmd -g

```

祝贺！Cloud Commander 已经被安装了。让我们往下继续看看 Cloud Commander 的基本使用。

### 开始使用 Cloud Commander

运行以下命令启动 Cloud Commander:
```
$ cloudcmd

```

**输出示例：**

```
url: http://localhost:8000

```

Now, open your web browser and navigate to the URL: **<http://localhost:8000** or> **<http://IP-address:8000>**.

From now on, you can create, delete, view, manage files or folders right in the web browser from the local system or remote system, or mobile, tablet etc.

![][2]

当你看见上面的截图时，Clouder Commander 有两个面板，十个热键 (F1 to F10)，和控制台。

每个热键执行的都是一个任务。

  * F1 – 帮助
  * F2 – 重命名文件/文件夹
  * F3 – 查看文件/文件夹
  * F4 – 编辑文件
  * F5 – 复制文件/文件夹
  * F6 – 移动文件/文件夹
  * F7 – 创建新目录
  * F8 – 删除文件/文件夹
  * F9 – 打开菜单
  * F10 – 打开设置



#### Cloud Commmander 控制台

点击控制台图标。 This will open your default system’s shell.

![][3]

在此控制台中，您可以执行各种管理任务，例如安装软件包，删除软件包，更新系统等。您甚至可以关闭或重新引导系统。 因此，Cloud Commander 不仅仅是一个文件管理器，还具有远程管理工具的功能。

#### 创建文件/文件夹

要创建新的文件或文件夹 Right click on any empty place and go to **New - >File or Directory**.

![][4]

#### 查看文件

你可以查看图片，查看音视频文件。

![][5]

#### 上传文件

另一个很酷的特性是我们可以从任何系统或设备简单地上传一个文件到 Cloud Commander 系统。

要上传文件，右键单击 Cloud Commander 面板的任意空白处，并且单击**上传**选项。

![][6]

选择你想要上传的文件。

Also, you can upload files from the Cloud services like Google drive, Dropbox, Amazon cloud drive, Facebook, Twitter, Gmail, GtiHub, Picasa, Instagram and many.

要从云端上传文件, 右键单击面板的任意空白处，并且右键单击面板任意空白处并选择**从云端上传**。

![][7]

选择任意一个你选择的网络服务，例如谷歌云盘。点击**连接到谷歌云盘**按钮。

![][8]

下一步，用 Cloud Commander 验证你的谷歌云端硬盘，从谷歌云端硬盘选择文件并点击**上传**。

![][9]

#### 更新 Cloud Commander

要更新到最新的可提供版本，执行下面的命令：
```
$ npm update cloudcmd -g

```

#### 总结

As far as I tested Cloud Commander, It worked like charm. I didn’t face a single issue during the testing in my Ubuntu server. Also, Cloud Commander is not just a web-based file manager, but also acts as a remote administration tool that performs most Linux administration tasks. You can create a files/folders, rename, delete, edit, and view them. Also, You can install, update, upgrade, and remove any package as the way you do in the local system from the Terminal. And, of course, you can even shutdown or restart the system from the Cloud Commander console itself. What do you need more? Give it a try, you will find it useful.

That’s all for now. I will be here soon with another interesting article. Until then, stay tuned with OSTechNix.

祝贺！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cloud-commander-a-web-file-manager-with-console-and-editor/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
