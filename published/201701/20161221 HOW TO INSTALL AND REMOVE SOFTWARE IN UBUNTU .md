完全指南之在 Ubuntu 操作系统中安装及卸载软件
============================================================

![Complete guide for installing and removing applications in Ubuntu](https://itsfoss.com/wp-content/uploads/2016/12/Managing-Software-in-Ubuntu-1.jpg) 

摘要：这篇文章详尽地说明了在 Ubuntu Linux 系统中安装及卸载软件的各种方法。

当你从 Windows 系统[转向 Linux 系统][14]的时候，刚开始的体验绝对是非比寻常的。在 Ubuntu 系统下就连最基本的事情，比如安装个应用程序都会让（刚从 Windows 世界来的）人感到无比困惑。

但是你也不用太担心。因为 Linux 系统提供了各种各样的方法来完成同一个任务，刚开始你感到困惑那也是正常的。你并不孤单，我们大家都是这么经历过来的。

在这篇初学者指南中，我将会教大家在 Ubuntu 系统里以最常用的方式来安装软件，以及如何卸载之前已安装的软件。

关于在 Ubuntu 上应使用哪种方法来安装软件，我也会提出自己的建议。请用心学习。这篇文章写得很长也很详细，你从中绝对能够学到东西。

### 在 Ubuntu 系统中安装和卸载软件

在这篇教程中我使用的是运行着 Unity 桌面环境的 Ubuntu 16.04 版本的系统。除了一些截图外，这篇教程也同样适用于其它版本的 Ubuntu 系统。

### 1.1 使用 Ubuntu 软件中心来安装软件 【推荐使用】

在 Ubuntu 系统中查找和安装软件最简单便捷的方法是使用 Ubuntu 软件中心。在 Ubuntu Unity 桌面里，你可以在 Dash 下搜索 Ubuntu 软件中心，然后选中打开即可：

[
 ![Run Ubuntu Software Center](https://itsfoss.com/wp-content/uploads/2016/12/Ubuntu-Software-Center.png) 
][15]

你可以把 Ubuntu 软件中心想像成 Google 的 Play 商店或者是苹果的 App 商店。它包含 Ubuntu 系统下所有可用的软件。你可以通过应用程序的名称来搜索应用程序或者是通过浏览各种软件目录来进行查找软件。你还可以根据作者进行查询。这由你自己来选择。

![Installing software in Ubuntu using Ubuntu Software Center](https://itsfoss.com/wp-content/uploads/2016/12/install-software-Ubuntu-linux.jpeg) 

一旦你找到自己想要的应用程序，选中它。软件中心将打开该应用程序的描述页面。你可以阅读关于这款软件的说明，评分等级和用户的评论。如果你愿意，也可以写一条评论。

一旦你确定想安装这款软件，你可以点击安装按钮来安装已选择的应用程序。在 Ubuntu 系统中，你需要输入 root 账号的密码才能安装该应用程序。

[
 ![Installing software in Ubuntu: The easy way](https://itsfoss.com/wp-content/uploads/2016/12/install-software-Ubuntu-linux-1.jpg) 
][16]

还有什么比这更简单的吗？我觉得应该没有了吧！

提示：正如我[在 Ubuntu 16.04 系统安装完成后你需要做的事情][17]这篇文章提到的那样，你应该启用 Canonical 合作伙伴仓库。默认情况下，Ubuntu 系统仅提供了那些源自自身软件库（Ubuntu 认证）的软件。

但是还有一个 Canonical 合伙伙伴软件库，它包含一些闭源专属软件，Ubuntu 并不直接管控它。启用该仓库后将让你能够访问更多的软件。[在 Ubuntu 系统下安装 Skype 软件][18]就是通过那种方式安装完成的。

在 Unity Dash 中，找到软件或更新工具。

[
 ![Ubuntu Software Update Settings](https://itsfoss.com/wp-content/uploads/2014/08/Software_Update_Ubuntu.jpeg) 
][19]

如下图，打开其它软件标签面，勾选 Canonical 合作伙伴选项。

[
 ![Enable Canonical partners in Ubuntu 14.04](https://itsfoss.com/wp-content/uploads/2014/04/Enable_Canonical_Partner.jpeg) 
][20]

### 1.2 从 Ubuntu 软件中心卸载软件（推荐方式）

我们刚刚演示了如何在 Ubuntu 软件中心安装软件。那么如何使用同样的方法来卸载已安装的软件呢？

在 Ubuntu 软件中心卸载软件跟安装软件的步骤一样简单。

打开软件中心然后点击已安装的软件标签面。它将显示所有已安装的软件。或者，你也可以只搜索应用程序的名称。

要卸载 Ubuntu 系统中的应用程序，点击删除按钮即中。你同样需要输入 root 账号的密码。

[
 ![Uninstall software installed in Ubuntu](https://itsfoss.com/wp-content/uploads/2016/12/Uninstall-Software-Ubuntu.jpeg) 
][22]

### 2.1 在 Ubuntu 系统中使用 .DEB 文件来安装软件

.deb 文件跟 Windows 下的 .exe 文件很相似。这是一种安装软件的简易方式。很多软件开发商都会提供 .deb 格式的安装包。

Google Chrome 浏览器就是这样的。你可以下载从其官网下载 .deb 安装文件

[
 ![Downloading deb packaging](https://itsfoss.com/wp-content/uploads/2016/12/install-software-deb-package.png) 
][23]

一旦你下载完成 .deb 安装文件之后，只需要双击运行即可。它将在 Ubuntu 软件中心打开，你就可以使用前面 1.1 节中同样的方式来安装软件。

或者，你也可以使用轻量级的安装程序 [在 Ubuntu 系统中使用 Gdebi 工具来安装 .deb 安装文件][24]。

软件安装完成后，你可以随意删除下载的 .deb 安装包。

提示：在使用 .deb 文件的过程中需要注意的一些问题：

* 确保你是从官网下载的 .deb 安装文件。仅使用官网或者 GitHub 上提供的软件包。
* 确保你下载的 .deb 文件系统类型正确（32 位或是 64 位）。请阅读我们写的快速指南[如何查看你的 Ubuntu 系统是 32 位的还是 64 位的][8]

### 2.2 使用 .DEB 文件来删除已安装的软件

卸载 .deb 文件安装的软件跟我们在 1.2 节看到的步骤一样的。只需要打开 Ubuntu 软件中心，搜索应用程序名称，然后单击移除并卸载即可。

或者你也可以使用[新立得包管理器][25]。这也不是必须的，但是如果在 Ubuntu 软件中心找不到已安装的应用程序的情况下，就可以使用这个工具了。新立得软件包管理器会列出你系统里已安装的所有可用的软件。这是一个非常强大和有用的工具。

这个工具很强大非常有用。在 Ubuntu 软件中心被开发出来提供一种更友好的安装软件方式之前，新立得包管理器是 Ubuntu 系统中默认的安装和卸载软件的工具。

你可以单击下面的链接来安装新立得软件包管器（它将会在 Ubuntu 软件中心中打开）。

- [安装新立得包管理器][26]

打开新立得包管理器，然后找到你想卸载的软件。已安装的软件标记为绿色按钮。单击并选择“标记为删除”。然后单击“应用”来删除你所选择的软件。

[
 ![Using Synaptic to remove software in Ubuntu](https://itsfoss.com/wp-content/uploads/2016/12/uninstall-software-ubuntu-synaptic.jpeg) 
][27]

### 3.1 在 Ubuntu 系统中使用 APT 命令来安装软件（推荐方式）

你应该看到过一些网站告诉你使用 `sudo apt-get install` 命令在 Ubuntu 系统下安装软件。

实际上这种命令行方式跟第 1 节中我们看到的安装方式一样。只是你没有使用 Ubuntu 软件中心来安装或卸载软件，而是使用的是命令行接口。别的没什么不同。

使用 `apt-get` 命令来安装软件超级简单。你只需要执行下面的命令：

```
sudo apt-get install package_name
```

上面使用 `sudo` 是为了获取“管理员”或 “root” （Linux 专用术语）账号权限。你可以替换 package_name 为你想要安装的软件包名。

`apt-get` 命令可以自动补全，你只需要输入一些字符并按 tab 键即可， `apt-get` 命令将会列出所有与该字符相匹配的程序。

### 3.2 在 Ubuntu 系统下使用 APT 命令来卸载软件（推荐方式）

在命令行下，你可以很轻易的卸载 Ubuntu 软件中心安装的软件，以及使用 `apt` 命令或是使用 .deb 安装包安装的各种软件。

你只需要使用下面的命令，替换 package-name 为你想要删除的软件名。

```
sudo apt-get remove package_name
```

同样地，你也可以通过按 tab 键来利用 `apt-get` 命令的自动补全功能。

使用 `apt-get` 命令来安装卸载或卸载并不算什么高深的技能。这实际上非常简便。通过这些简单命令的运用，你可以熟悉 Ubuntu Linux 系统的命令行操作，长期使用对你学习 Linux 系统的帮忙也很大。建议你看下我写的一篇很详细的[apt-get 命令使用指导][28]文章来进一步的了解该命令的使用。

- 建议阅读：[Linux 系统下 apt-get 命令初学者完全指南][29]

### 4.1 使用 PPA 命令在 Ubuntu 系统下安装应用程序

PPA 是[个人软件包归档（ Personal Package Archive）][30]的缩写。这是开发者为 Ubuntu 用户提供软件的另一种方式。

在第 1 节中出现了一个叫做 ‘仓库（repository）’ 的术语。仓库本质上是一个软件集。 Ubuntu 官方仓库主要用于提供经过 Ubuntu 自己认证过的软件。 Canonical 合作伙伴仓库包含来自合作厂商提供的各种应用软件。

同时，PPA 允许开发者创建自己的 APT 仓库。当用户在系统里添加了一个仓库时（`sources.list` 中增加了该仓库），用户就可以使用开发者自己的仓库里提供的软件了。

现在你也许要问既然我们已经有 Ubuntu 的官方仓库了，还有什么必要使用 PPA 方式呢？

答案是并不是所有的软件都会自动添加到 Ubuntu 的官方仓库中。只有受信任的软件才会添加到其中。假设你开发出一款很棒的 Linux 应用程序，然后你想为用户提供定期的更新，但是在它被添加到 Ubuntu 仓库之前，这需要花费好几个月的时间（如果是在被允许的情况下）。 PPA 的出现就是为了解决这个问题。

除此之外， Ubuntu 官方仓库通常不会把最新版的软件添加进来。这会影响到 Ubuntu 系统的安全性及稳定性。新版本的软件或许会有影响到系统的[回退][31]。这就是为什么在新款软件进入到官方仓库前要花费一定的时间，有时候需要等待几个月。

但是，如果你不想等待最新版出现在 Ubuntu 仓库中呢？这个时候 PPA 就对你有帮助了。通过 PPA 方式，你可以获得该应用程序的最新版本。

通常情况下， PPA 通过这三个命令来进行使用。第一个命令添加 PPA 仓库到源列表中。第二个命令更新软件缓存列表，这样你的系统就可以获取到可用的新版本软件了。第三个命令用于从 PPA 安装软件。

我将演示使用 PPA 方式来安装 [Numix 主题][32]：

```
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle
```

在上面的实例中，我们添加了一个[Numix 项目][33]提供的 PPA 。在更新软件信息之后，我们安装了两个 Numix PPA 中可用的应用程序。

如果你想使用带有图形界面的应用程序，你可以使用 [Y-PPA 应用程序][34]。通过它你可以很方便地查询 PPA，添加和删除软件。

注意：PPA 的安全性经常受到争议。我的建议是你应该从受信任的源添加 PPA，最好是从官方软件源添加。

### 4.2 卸载使用 PPA 方式安装的应用程序

在之前的文章[在 Ubuntu 系统下移除 PPA][35] 中我已经写得很详细了。你可以跳转到这篇文章去深入学习卸载 PPA 方式安装的软件。

这里简要提一下，你可以使用下面的两个命令来卸载：

```
sudo apt-get remove numix-gtk-theme numix-icon-theme-circle

sudo add-apt-repository --remove ppa:numix/ppa
```

第一个命令是卸载通过 PPA 方式安装的软件。第二个命令是从 `source.list` 中删除该 PPA。

### 5.1 在 Ubuntu Linux 系统中使用源代码来安装软件（不推荐使用）

我并不建议你使用[软件源代码][36]来安装该应用程序。这种方法很麻烦，容易出问题而且还非常地不方便。你得费尽周折去解决依赖包的问题。你还得保留源代码文件，以便将来卸载该应用程序。

但是还是有一些用户喜欢通过源代码编译的方式来安装软件，尽管他们自己本身并不会开发软件。实话告诉你，我曾经也经常使用这种方式来安装软件，不过那都是 5 年前的事了，那时候我还是一个实习生，我必须在 Ubuntu 系统下开发一款软件出来。但是，从那之后我更喜欢使用其它方式在 Ubuntu 系统中安装应用程序。我觉得，对于普通的 Linux 桌面用户，最好不要使用源代码的方式来安装软件。

在这一小节中我将简要地列出使用源代码方式来安装软件的几个步骤：
* 下载你想要安装软件的源代码。
* 解压下载的文件。
* 进入到解压目录里并找到 `README` 或者 `INSTALL` 文件。一款开发完善的软件都会包含这样的文件，用于提供安装或卸载软件的指导方法。
* 找到名为 `configure` 的配置文件。如果在当前目录下，使用这个命令来执行该文件：`./configure` 。它将会检查你的系统是否包含所有的必须的软件（在软件术语中叫做‘依赖包’）来安装该应用程序。（LCTT 译注：你可以先使用 `./configure --help` 来查看有哪些编译选项，包括安装的位置、可选的特性和模块等等。）注意并不是所有的软件都包括该配置文件，我觉得那些开发很糟糕的软件就没有这个配置文件。
* 如果配置文件执行结果提示你缺少依赖包，你得先安装它们。
* 一旦你安装完成所有的依赖包后，使用 `make` 命令来编译该应用程序。
* 编译完成后，执行 `sudo make install` 命令来安装该应用程序。

注意有一些软件包会提供一个安装软件的脚本文件，你只需要运行这个文件即可安装完成。但是大多数情况下，你可没那么幸运。

还有，使用这种方式安装的软件并不会像使用 Ubuntu 软件库、 PPA 方式或者 .deb 安装方式那样安装的软件会自动更新。

如果你坚持使用源代码方式来安装软件，我建议你看下这篇很详细的文章[在 Ubuntu 系统中使用源代码安装软件][37]。

### 5.2 卸载使用源代码方式安装的软件（不推荐使用）

如果你觉得使用源代码安装软件的方式太难了，再想想看，当你卸载使用这种方式安装的软件将会更痛苦。

* 首先，你不能删除用于安装该软件的源代码。
* 其次，你必须确保在安装的时候也有对应的方式来卸载它。一款设计上很糟糕的应用程序就不会提供卸载软件的方法，因此你不得不手动去删除那个软件包安装的所有文件。

正常情况下，你应该切换到源代码的解压目录下，使用下面的命令来卸载那个应用程序：

```
sudo make uninstall
```

但是，这也不能保证你每次都会很顺利地卸载完成。

看到了吧，使用源代码方式来安装软件实在是太麻烦了。这就是为什么我不推荐大家在 Ubuntu 系统中使用源代码来安装软件的原因。

### 其它一些在 Ubuntu 系统中安装软件的方法

另外，还有一些在 Ubuntu 系统下并不常用的安装软件的方法。由于这篇文章已经写得够长了，我就不再深入探讨了。下面我将把它们列出来：
* Ubuntu 新推出的 [Snap 打包][9]方式
* 使用 [dpkg][10] 命令
* [AppImage][11] 方式
* [pip][12] : 用于安装基于 Python 语言的应用程序

### 你是如何在 UBUNTU 系统中安装软件的呢？

如果你一直都在使用 Ubuntu 系统，那么你在 Ubuntu Linux 系统下最喜欢使用什么方式来安装软件呢？你觉得这篇文章对你有用吗？请分享你的一些观点，建议和提出相关的问题。

--------------------

作者简介：
![](https://secure.gravatar.com/avatar/20749c268f5d3e4d2c785499eb6a17c0?s=70&d=mm&r=g)

我叫 Abhishek Prakash ，F.O.S.S 开发者。我的工作是一名专业的软件开发人员。我是一名狂热的 Linux 系统及开源软件爱好者。我使用 Ubuntu 系统，并且相信分享是一种美德。除了 Linux 系统之外，我喜欢经典的侦探神秘小说。我是 Agatha Christie 作品的真爱粉。

--------------------------------------------------------------------------------

via: https://itsfoss.com/remove-install-software-ubuntu/

作者：[ABHISHEK PRAKASH][a]
译者：[rusking](https://github.com/rusking)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/author/abhishek/
[2]:https://itsfoss.com/remove-install-software-ubuntu/#comments
[3]:http://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Fremove-install-software-ubuntu%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=How+To+Install+And+Remove+Software+In+Ubuntu+%5BComplete+Guide%5D&url=https://itsfoss.com/remove-install-software-ubuntu/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=abhishek_pc
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Fremove-install-software-ubuntu%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Fremove-install-software-ubuntu%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:https://www.reddit.com/submit?url=https://itsfoss.com/remove-install-software-ubuntu/&title=How+To+Install+And+Remove+Software+In+Ubuntu+%5BComplete+Guide%5D
[8]:https://itsfoss.com/32-bit-64-bit-ubuntu/
[9]:https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[10]:https://help.ubuntu.com/lts/serverguide/dpkg.html
[11]:http://appimage.org/
[12]:https://pypi.python.org/pypi/pip
[13]:https://itsfoss.com/remove-install-software-ubuntu/managing-software-in-ubuntu-1/
[14]:https://itsfoss.com/reasons-switch-linux-windows-xp/
[15]:https://itsfoss.com/wp-content/uploads/2016/12/Ubuntu-Software-Center.png
[16]:https://itsfoss.com/remove-install-software-ubuntu/install-software-ubuntu-linux-1/
[17]:https://itsfoss.com/things-to-do-after-installing-ubuntu-16-04/
[18]:https://itsfoss.com/install-skype-ubuntu-1404/
[19]:https://itsfoss.com/ubuntu-notify-updates-frequently/software_update_ubuntu/
[20]:https://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/enable_canonical_partner/
[21]:https://itsfoss.com/essential-linux-applications/
[22]:https://itsfoss.com/remove-install-software-ubuntu/uninstall-software-ubuntu/
[23]:https://itsfoss.com/remove-install-software-ubuntu/install-software-deb-package/
[24]:https://itsfoss.com/gdebi-default-ubuntu-software-center/
[25]:http://www.nongnu.org/synaptic/
[26]:apt://synaptic
[27]:https://itsfoss.com/remove-install-software-ubuntu/uninstall-software-ubuntu-synaptic/
[28]:https://itsfoss.com/apt-get-linux-guide/
[29]:https://itsfoss.com/apt-get-linux-guide/
[30]:https://help.launchpad.net/Packaging/PPA
[31]:https://en.wikipedia.org/wiki/Software_regression
[32]:https://itsfoss.com/install-numix-ubuntu/
[33]:https://numixproject.org/
[34]:https://itsfoss.com/easily-manage-ppas-ubuntu-1310-ppa-manager/
[35]:https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[36]:https://en.wikipedia.org/wiki/Source_code
[37]:http://www.howtogeek.com/105413/how-to-compile-and-install-from-source-on-ubuntu/
