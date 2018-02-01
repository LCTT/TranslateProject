利用 Resetter 将 Ubuntu 系发行版重置为初始状态
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_0.png?itok=YEX5IGdx)

*这个 Resetter 工具可以将 Ubuntu、 Linux Mint （以及其它基于 Ubuntu 的发行版）返回到其初始配置。*

有多少次你投身于 Ubuntu（或 Ubuntu 衍生版本），配置某项内容和安装软件，却发现你的桌面（或服务器）平台并不是你想要的结果。当在机器上产生了大量的用户文件时，这种情况可能会出现问题。既然这样，你有一个选择，你要么可以备份你所有的数据，重新安装操作系统，然后将您的数据复制回本机，或者也可以利用一种类似于 [Resetter][1] 的工具做同样的事情。

Resetter 是一个新的工具（由名为“[gaining][2]”的加拿大开发者开发），用 Python 和 PyQt 编写，它将会重置 Ubuntu、Linux Mint（和一些其他的，基于 Ubuntu 的衍生版）回到初始配置。Resetter 提供了两种不同的复位选择：自动和自定义。利用自动方式，工具就会完成以下内容：

* 删除用户安装的应用软件
* 删除用户及家目录
* 创建默认备份用户
* 自动安装缺失的预装应用软件（MPIA） 
* 删除非默认用户
* 删除 snap 软件包

自定义方式会：

* 删除用户安装的应用程序或者允许你选择要删除的应用程序
* 删除旧的内核
* 允许你选择用户进行删除
* 删除用户及家目录
* 创建默认备份用户
* 允许您创建自定义备份用户
* 自动安装缺失的预装应用软件（MPIA）或选择 MPIA 进行安装
* 删除非默认用户
* 查看所有相关依赖包
* 删除 snap 软件包

我将带领您完成安装和使用 Resetter 的过程。但是，我必须告诉你这个工具非常前期的测试版。即便如此， Resetter 绝对值得一试。实际上，我鼓励您测试该应用程序并提交 bug 报告（您可以通过 [GitHub][3] 提交，或者直接发送给开发人员的电子邮件地址 [gaining7@outlook.com][4])。

还应注意的是，目前仅支持的衍生版有：

* Debian 9.2 （稳定）Gnome 版本
* Linux Mint 17.3+（对 Mint 18.3 的支持即将推出）
* Ubuntu 14.04+ （虽然我发现不支持 17.10）
* Elementary OS 0.4+
* Linux Deepin 15.4+

说到这里，让我们安装和使用 Resetter。我将在 [Elementary OS Loki][5] 平台展示。

### 安装

有几种方法可以安装 Resetter。我选择的方法是通过 `gdebi` 辅助应用程序，为什么？因为它将获取安装所需的所有依赖项。首先，我们必须安装这个特定的工具。打开终端窗口并发出命令：

```
sudo apt install gdebi
```

一旦安装完毕，请将浏览器指向 [Resetter 下载页面][6]，并下载该软件的最新版本。一旦下载完毕，打开文件管理器，导航到下载的文件，然后单击（或双击，这取决于你如何配置你的桌面） `resetter_XXX-stable_all.deb` 文件（XXX 是版本号）。`gdebi` 应用程序将会打开（图 1）。点击安装包按钮，输入你的 `sudo` 密码，接下来 Resetter 将开始安装。


![gdebi][8]

*图 1：利用 gdebi 安装 Resetter*

当安装完成，准备接下来的操作。

### 使用 Resetter

**记住，在这之前，必须备份数据。别怪我没提醒你。**

从终端窗口发出命令 `sudo resetter`。您将被提示输入 `sudo`密码。一旦 Resetter 打开，它将自动检测您的发行版（图 2）。

![Resetter][11]

*图 2：Resetter 主窗口*

我们将通过自动重置来测试 Resetter 的流程。从主窗口，点击 Automatic Reset（自动复位）。这款应用将提供一个明确的警告，它将把你的操作系统（我的实例，Elementary OS 0.4.1 Loki）重新设置为出厂默认状态（图 3）。

![警告][13]

*图 3：在继续之前，Resetter 会警告您。 *


单击“Yes”，Resetter 会显示它将删除的所有包（图 4）。如果您没有问题，单击 OK，重置将开始。

![移除软件包][15]

*图 4：所有要删除的包，以便将 Elementary OS 重置为出厂默认值。*

在重置过程中，应用程序将显示一个进度窗口（图 5）。根据安装的数量，这个过程不应该花费太长时间。

![进度][17]

*图 5：Resetter 进度窗口*

当过程完成时，Resetter 将显示一个新的用户名和密码，以便重新登录到新重置的发行版（图 6）。

![新用户][19]

*图 6：新用户及密码*

单击 OK，然后当提示时单击“Yes”以重新启动系统。当提示登录时，使用 Resetter 应用程序提供给您的新凭证。成功登录后，您需要重新创建您的原始用户。该用户的主目录仍然是完整的，所以您需要做的就是发出命令 `sudo useradd USERNAME` （ USERNAME 是用户名）。完成之后，发出命令 `sudo passwd USERNAME` （USERNAME 是用户名）。使用设置的用户/密码，您可以注销并以旧用户的身份登录（使用在重新设置操作系统之前相同的家目录）。

### 我的成果

我必须承认，在将密码添加到我的老用户（并通过使用 `su` 命令切换到该用户进行测试）之后，我无法使用该用户登录到 Elementary OS 桌面。为了解决这个问题，我登录了 Resetter 所创建的用户，移动了老用户的家目录，删除了老用户（使用命令 `sudo deluser jack`），并重新创建了老用户（使用命令 `sudo useradd -m jack`）。

这样做之后，我检查了原始的家目录，只发现了用户的所有权从 `jack.jack` 变成了 `1000.1000`。利用命令 `sudo chown -R jack.jack /home/jack`，就可以容易的修正这个问题。教训是什么？如果您使用 Resetter 并发现无法用您的老用户登录（在您重新创建用户并设置一个新密码之后），请确保更改用户的家目录的所有权限。

在这个问题之外，Resetter 在将 Elementary OS Loki 恢复到默认状态方面做了大量的工作。虽然 Resetter 处在测试中，但它是一个相当令人印象深刻的工具。试一试，看看你是否有和我一样出色的成绩。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/12/set-ubuntu-derivatives-back-default-resetter

作者：[Jack Wallen][a]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

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
