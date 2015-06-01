如何在局域网中将Ubuntu文件夹共享给Windows
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Share_Folder_Ubuntu_windows.jpeg)

本文全面详细地向你描述了**在Ubuntu中如何实现局域网内的文件夹共享**。

你的家中是不是有多台电脑？当你需要从一台Ubuntu电脑向另一台电脑传输数据时，是不是必须用到U盘或SD卡？你是否也觉得这个方法很烦人？我想肯定是。本文的目的就是使你在局域网内快速方便地传输文件、文档和其它较大的数据，以节省你的宝贵时间。只需一次设置，然后轻点鼠标，你就可以自由地**在Ubuntu和Windows之间共享文件**，当然这对其它Linux系统同样使用。不要担心，这很容易操作，不会花费太多时间。

除此之外，尽管本文是在Ubuntu上进行实践，但这个教程在其它Linux系统上同样有用。

#### 在Ubuntu上实现局域网共享文件夹 ####

如果你的系统是Ubuntu 14.04、14.10或12.04，有两个方法可以使你通过局域网在搭载Windows或其他Linux的电脑上共享本地文件。

- 对局域网中的每个用户提供无密码共享
- 仅限特定访问，提供文件夹密码保护

这篇文章包括两种方法，你可以选择你想用的那种。

### 1. 局域网无密码共享文件夹 ###

#### 步骤一：####

为了在Ubuntu上实现局域网共享文件夹，右键点击打算共享的文件夹，并选择“Local Network Share（本地网络共享）”：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Share_Folder_Ubuntu.jpeg)

**可能有用的故障解决方案**：如果在右键菜单中看不到“Local Network Share”的选项，那就新建一个终端，使用下面的命令去安装nautlius-share插件：

    sudo apt-get install nautilus-share

然后重启Nautilus。可以选择注销再登录，或者使用这个命令:

    nautilus -q

#### 步骤二：####

一旦点击“Local Network Share”，就会出现共享文件夹的选项。只需选中“Share this folder（共享该文件夹）”这一项：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Share_Folder_Ubuntu_1.jpeg)

**可能的故障解决方案**：如果提示共享服务还未安装，就像下图所示，那就点击安装服务，按照提示操作。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Share_Folder_Ubuntu_2.jpeg)

#### 步骤三：####

当选中“Share this folder”的选项，就会看到按钮“Create Share（创建共享）”变得可以点击了。你也可以“Allow others to create and delete fies in this folder（允许其他用户在共享文件夹中编辑文件）”。选项“Guest access（允许访客访问）”也是如此。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Share_folder_Ubuntu_3.png)

你会看到文件夹图标已经显示为共享的。如果要停止共享文件夹，只需取消“Share this floder”这个选项。

这个方法就是这么简单，使得局域网中的任何人都可以访问共享文件夹中的文件。在正常情况下，你会选择这种方式。因为，家用局域网中的电脑通常都是可信电脑。但情况也不总是这样。如果你只是想特定的用户才能访问怎么办？这个时候就需要Samba服务器了。我们在本文的第二部分讨论这种方法。

### 2. 在Ubuntu上使用密码保护实现局域网共享文件夹###

为了达到这个目的，首先需要配置Samba服务器。事实上，在这篇教程的前一部分我们已经用到了Samba，只是我们没有刻意强调。在介绍如何在Ubuntu上搭建Samba服务器实现局域网共享的方法之前，先快速预览一下[Samba][1]到底是什么。

#### Samba是什么？ ####

Samba是一个允许用户通过网络共享文件、文档和打印机的软件包，无论是在Linux、Windows，还是Mac上。它适用于所有的主流平台，可以在所有支持系统上流畅运行。下面是维基百科的介绍：

> Samba是一款重新实现SMB/CIFS网络协议的自由软件，最初由安德鲁·垂鸠开发。在第三版中，Smaba不仅支持通过不同的Windows客户端访问及分享SMB的文件夹及打印机，还可以集成到Windows Server域，作为主域控制器（PDC）或者域成员。它也可以作为活动目录域的一部分。

#### 在Ubuntu上安装Samba服务器 ####

你可以很方便地在Ubuntu电脑上安装Samba。安装前，请先更新系统以便安装任何可用的更新。

    sudo apt-get update && apt-get upgrade

然后按照这条命令安装samba和少量所需的软件包：

    sudo apt-get install samba samba-common system-config-samba python-glade2 gksu

一旦安装完成Samba服务器，就可以从图形界面配置Samba来分享文件。

#### 在Ubuntu上配置Samba服务器 ####

从dash中打开Samba配置工具：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Setup-Samba.png)

进入到**Preference->Server Settings**。尽管默认已经设置好，可能就是你需要的。但在某些情况下你可能需要做一些改动。

在Server Setting中可以看到两个选项卡，‘Basic’和‘Security’。在Basic选项卡下的选项含义如下：

- 工作组 - 用户要连接的电脑所在工作组的名字。比如，如果你想连接到一台Windows电脑，你就要输入Windows电脑的工作组名字。在Windows的Samba服务器设置中，已经默认设置好统一的工作组名字。但如果你有不同的工作组名字，就在这个字段中输入自定义的工作组名字。（在Windows 7中获取工作组名字，右击计算机图标，进到属性，就能看到Windows工作组名字。）
- 描述 - 其他用户看到的你的电脑名字。不要使用空格或不适用于网络的字符。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/samba-server-settings.png)

设置samba服务器允许‘Guests’可用是不明智的，所以没必要修改安全设置，保持原样即可。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Samba-Security-Settings-compressed.jpg)

这就搞定了！你已经搭建好Samba服务器，距离实现网络共享第一个文件夹的目标不远了！

#### 为网络文件共享创建一个系统用户 ####

现在我们需要为网络共享文件创建一个系统用户。下面是非常简单的步骤：

- 在Systems Settings下点击**User Accounts**。
- 点击**unlock**使其可用，以及+（**加号**）图标。
- 点击+（加号）图标，创建一个新的系统用户。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/create-system-user1.jpg)

如上图所示，需要输入‘Full name’。当你输入‘Full name’时，Username会自动填充为Full name。因为创建这个用户是为了共享文件，所以还要指定Account Type为‘**Standard**’。

完成上述步骤，点击添加，你就创建好一个系统用户。这个用户还没有被激活，所以需要为其设置密码来激活。确保Users accounts界面已经解锁。点击尚不可用的账户，输入一个新密码，然后确认密码，点击Change。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/activate-system-user.jpg)

耶！到目前为止我们已经安装并配置好Samba，已经创建了一个系统用户以通过这个账户在网络上共享文件，而且也已经激活了新用户。现在来到配置Samba的最后一步，然后就可以共享文件夹了。

#### 添加Samba新用户 ####

打开Samba，在Preference先点击Samba Users。填写弹出的对话框，下面是其中几个字段的说明：

**Unix Username** - 在这种情况下，我选择刚才创建的用户。

**Windows Username** - 输入你要访问的Windows电脑的用户名。

**Samba Password** - 输入你要访问的Windows电脑的密码。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/samba-user-setting.jpg)

完成后点击OK。现在做个深呼吸。你已经在Samba的帮助下成功创建一个网络。然后重启网络或Samba服务，准备好和其它电脑共享文件。

    sudo restart smbd && sudo restart nmbd

#### 通过网络共享文件夹或文件 ####

在图形用户界面下通过Samba共享文件是很简单的。点击加号图标，会看到如图所示的对话框：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/share-files-and-folders.jpg)

填写完这些字段。在‘Directory’中，浏览要共享的文件夹。你会看到的字段的含义如下：

- **Share name** 是其它人会看到的文件夹名字。
- **Description** 是要共享内容的简单描述。
- **Writeable** 默认情况下共享的文件夹是‘read only’。如果允许网络上的其他用户修改它们，设置为writable。
- **Visiable** 当你点击Visiable时，就像它的名字一样，共享文件夹就对网络上的其他人可见。

现在你可以设置共享文件夹的权限。点击‘Access’选项，选择想要共享文件夹的用户。当你选择对所有人允许访问后，这个文件夹就对网络上的所有人可见。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Screenshot-from-2015-02-28-202031.png)

最后点击OK，完成共享。现在这个文件夹就与你想要共享的用户实现共享。你已经完成了网络共享文件。还有其它要做的吗？对！还不知道如何从网络上移除文件夹？

#### 移除共享文件夹 ####

在网络共享一段时间后，我们也需要移除其中的一些文件夹。操作很简答，下面就是我们要做的。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/remove-shared-folder-from-network.jpg)

全部搞定！我们也可以使用终端进行网络文件共享，但这样没有本文介绍的方法这么容易。如果你确实想知道命令行操作，我会再写一篇关于在Linux上使用命令行实现网络文件共享的文章。

所以，你是怎么找到这篇教程的呢？我希望看了这篇教程你可以**很容易地在Ubuntu和Windows之间共享文件**。如果你有任何问题或建议，请在评论里说出来。


--------------------------------------------------------------------------------

via: http://itsfoss.com/share-folders-local-network-ubuntu-windows/

作者：[Mohd Sohail][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/sohail/
[1]:http://en.wikipedia.org/wiki/Samba_%28software%29
[2]:http://itsfoss.com/request-tutorial/
