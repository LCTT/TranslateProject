translated by stevenzdg988

利用 Resetter 将 Ubuntu 衍生版重置为初始状态
======
有多少次你投入到Ubuntu（或Ubuntu衍生版本），配置某项内容和安装软件，却发现你的桌面（或服务器）平台并不是你想要的。当在机器上产生了大量的用户文件时，这种情况可能会出现问题。既然这样，你有一个选择，你或者可以备份你所有的数据，重新安装操作系统，然后将您的数据复制回本机，或者也可以利用一种类似于[Resetter][1]的工具做同样的事情。

Resetter 是一个新的工具（由加拿大开发者，被称为"[gaining][2]"），用python和PyQt，将重置Ubuntu，Linux Mint（和一些其他的，基于Ubuntu的衍生版）回到初始配置。Resetter 提供了两种不同的复位选项：自动和自定义。利用自动选项，工具就会完成以下内容：
  * 删除用户安装的应用软件

  * 删除用户及家目录

  * 创建默认备份用户

  * 自动安装预装的应用软件(MPIAs) 

  * 删除非默认用户

  * 删除协议软件包

自定义选项:

 * 删除用户安装的应用程序或者允许你选择要删除的应用程序

 * 删除旧的内核

 * 允许你选择用户进行删除

 * 删除用户及家目录

 * 创建默认备份用户

 * 允许您创建自定义备份用户

 * 自动安装MPIAs或选择MPIAs进行安装

 * 删除非默认用户

 * 查看所有相关依赖包

 * 删除协议软件包

我将带领您完成安装和使用Resetter的过程。但是，我必须告诉你这个工具非常的测试版。即便如此，resetter绝对值得一试。实际上，我鼓励您测试应用程序并提交bug报告(您可以通过[GitHub][3]提交，或者直接发送给开发人员的电子邮件地址[gaining7@outlook.com][4])。
It should also be noted that, at the moment, the only supported distributions are:
还应注意的是，目前仅支持的衍生版有:
  * Debian 9.2(稳定)Gnome版本
  * Linux Mint 17.3 +(支持Mint 18.3即将推出)
  * Ubuntu 14.04+(虽然我发现不支持17.10)
  * Elementary OS 0.4+
  * Linux Deepin 15.4+

说到这里，让我们安装和使用Resetter。我将在[Elementary OS Loki][5]平台展示
### 安装

有几种方法可以安装Resetter。我选择的方法是通过gdebi辅助应用程序，为什么?因为它将获取安装所需的所有依赖项。首先，我们必须安装那个特定的工具。打开终端窗口并发出命令:
```
sudo apt install gdebi
```
一旦安装完毕，请将浏览器指向[Resetter下载页面][6]，并下载该软件的最新版本。一旦下载完毕，打开文件管理器，导航到下载的文件，然后单击(或双击，这取决于你如何配置你的桌面)在resetter_xxx - stable_all.deb文件(XXX是版本号)。gdebi应用程序将会打开(图1)。点击安装包按钮，输入你的sudo密码，接下来 Resetter 将开始安装。
## [resetter_1.jpg][7]

![gdebi][8]

图1:利用gdebi安装Resetter
[使用许可][9]

当安装完成，准备接下来的操作。
### 使用 Resetter

记住，在做这个之前，必须备份数据。别怪我没提醒你。从终端窗口发出命令```sudo resetter```。您将被提示输入sudo密码。一旦Resetter打开，它将自动检测您的发行版(图2)。
## [resetter_2.jpg][10]

![Resetter][11]

图2: Resetter 主窗口
[使用许可][9]

我们将通过自动重置来测试 Resetter 的流程。从主窗口，点击Automatic Reset（自动复位）。这款应用将提供一个明确的警告，它将把你的操作系统(的实例，Elementary OS 0.4.1 Loki)重新设置为出厂默认状态(图3)。
## [resetter_3.jpg][12]

![警告][13]

图3:在继续之前，Resetter警告您。 
[用户许可][9]

单击Yes,Resetter将显示它将删除的所有包(图4)。如果您没有问题，单击OK，重置将开始。
## [resetter_4.jpg][14]

![移除软件包][15]

图4:所有要删除的包，以便将 Elementary OS 重置为出厂默认值。
[使用许可][9]

在重置过程中，应用程序将显示一个进度窗口(图5)。根据安装的数量，这个过程不应该花费太长时间。
## [resetter_5.jpg][16]

![进度][17]

图5: Resetter 进度窗口
[使用许可][9]

当进程完成时，Resetter将显示一个新的用户名和密码，以便重新登录到新重置的发行版(图6)。
## [resetter_6.jpg][18]

![新用户][19]

图6:新用户及密码
[使用许可][9]

单击OK，然后在提示单击Yes以重新启动系统。当提示登录时，使用 Resetter 应用程序提供给您的新凭证。成功登录后，您需要重新创建您的原始用户。该用户的主目录仍然是完整的，所以您需要做的就是发出命令```sudo useradd USERNAME (USERNAME 是用户名)```。完成之后，发出命令```sudo passwd USERNAME (USERNAME 是用户名)```。使用设置的用户/密码，您可以注销并以旧用户的身份登录(在重新设置操作系统之前使用相同的家目录)。
### 我的成果

我必须承认，在将密码添加到我的老用户(并通过使用su命令对该用户进行更改)之后，我无法使用该用户登录到 Elementary OS 桌面。为了解决这个问题，我登录了Resetter-created 用户，移动了老用户的家目录，删除了老用户(使用命令``` sudo deluser jack```)，并重新创建了老用户(使用命令```sudo useradd -m jack```)。

这样做之后，我检查了原始的家目录，只发现了用户的所有权从 jack.jack 变成了 1000.1000。利用命令 ```sudo chown -R jack.jack /home/jack```，就可以容易的修正这个问题。这非常关键？如果您使用Resetter并发现无法用您的老用户登录(在您重新创建用户并设置一个新密码之后)，请确保更改用户的家目录的所有权限。

在这个问题之外，Resetter在将 Elementary OS Loki 恢复到默认状态方面做了大量的工作。虽然 Resetter 处在测试中，但它是一个相当令人印象深刻的工具。试一试，看看你是否有和我一样出色的成绩。

从Linux基金会和edX的免费[" Linux入门"][20]课程学习更多关于Linux的知识。
--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/12/set-ubuntu-derivatives-back-default-resetter

作者：[Jack Wallen][a]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://github.com/gaining/Resetter
[2]:https://github.com/gaining
[3]:https://github.com
[4]:mailto:gaining7@outlook.com
[5]:https://elementary.io/
[6]:https://github.com/gaining/Resetter/releases/tag/v1.1.3-stable
[7]:/files/images/resetter1jpg-0
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_1_0.jpg?itok=3c_qrApr (gdebi)
[9]:/licenses/category/used-permission
[10]:/files/images/resetter2jpg
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_2.jpg?itok=bmawiCYJ (Resetter)
[12]:/files/images/resetter3jpg
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_3.jpg?itok=2wlbC3Ue (warning)
[14]:/files/images/resetter4jpg-1
[15]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_4_1.jpg?itok=f2I3noDM (remove packages)
[16]:/files/images/resetter5jpg
[17]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_5.jpg?itok=3FYs5_2S (progress)
[18]:/files/images/resetter6jpg
[19]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_6.jpg?itok=R9SVZgF1 (new username)
[20]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
