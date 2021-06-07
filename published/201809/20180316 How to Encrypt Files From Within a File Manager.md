如何从 Linux 的文件管理器中加密文件
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/encryption.jpg?itok=Pk3_x5hz)

Linux 桌面版和服务器版具有卓越的安全性。然而这并不意味着你可以放松警惕。你应该一直认为你的数据总是很快就会被破坏。也就是说，你可能需要使用各种加密工具。比如 GnuPG，它可以让你加密和解密文件等更多功能。GnuPG 的一个问题是一些用户不想在命令行输入那么复杂的命令。如果是这样的话，你可以转向桌面文件管理器。许多 Linux 桌面版包含了简易的加密和解密文件的功能，如果这种功能没有内置，那么也是很容易添加的。

我将引导你完成从三个流行的 Linux 文件管理器中对文件进行加密和解密过程：

  * Nautilus （即 GNOME Files）
  * Dolphin
  * Thunar

### 安装 GnuPG

在我们讨论如何处理这个问题之前，我们必须确保你的系统包含了必要的基本组件 —— [GnuPG][1]。大多数发行版本都包含 GnuPG。 在某些偶然情况下，你使用的是没有自带 GnuPG 的发行版，以下是安装方法：

  * 基于 Ubuntu 的发行版： `sudo apt install gnupg`
  * 基于 Fedora 的发行版： `sudo yum install gnupg`
  * openSUSE： `sudo zypper in gnupg`
  * 基于 Arch 的发行版：`sudo pacman -S gnupg`


无论你是刚刚安装了 GnuPG，还是默认安装的，你都必须创建一个 GPG 密钥才能使用。每个桌面版都使用不同的 GUI 工具完成这个工作（或者甚至根本没有包含一个完成这个任务的 GUI 工具），所以让我们从命令行中创建这个密钥。打开终端窗口并输入以下指令：

```
gpg --gen-key
```

然后，你将被要求回答以下问题。除非你有充分的理由，否则你可以接受默认值：

  * 你想要哪种密钥？
  * 你想要多长的密钥？
  * 密钥有效期？

一旦你回答了这些问题，输入 `y` 来表示答案是正确的。接下来你需要提供以下信息：

  * 真实姓名。
  * Email 地址。
  * 备注。

完成上述操作后，然后在提示的时候输入 `O` （即 ok）。然后，你将被要求为新密钥输入一个密码。一旦系统收集到了足够的熵（你需要在桌面上做一些工作才能做到这一点，LCTT 译注：比如随便敲击键盘），你的密钥就会被创建，然后你就可以开始工作了。

让我们看看如何从文件管理器中加密/解密文件：

### Nautilus

让我们从默认的 GNOME 文件管理器开始，因为它是最简单的。Nautilus 不需要额外安装什么或额外的工作就可以从精心设计的界面内加密/解密文件。一旦你创建完 gpg 密钥后，就可以打开文件管理器，导航到包含要加密的文件的目录，右键单击要加密的文件，然后从菜单中选择 “Encrypt” （图1）。

![nautilus][3]

*图1：从 Nautilus 中加密文件。*

你将被要求选择一个收件人（或者收件人列表 —— 图2）。注意：收件人将是那些你已经导入了公钥的用户。选择所需的密钥，然后从签名信息下拉列表中选择你的密钥（电子邮件地址）。

![nautilus][6]

*图2：选择收件人和签名者。*

注意：你还可以选择仅使用密码来加密文件。如果文件将保留在你的本地机器上，这一点非常重要（稍后将详细介绍）。一旦你设置好加密后，单击 “OK” 并（在提示时）输入 gpg 密钥的密码。文件将被加密（现在文件名以 .gpg 结尾）并保存在工作目录中。现在你可以将加密后的文件发送给在加密过程中已选择的收件人。

比如说（有你的公钥的）某人已经给你发送了一个加密文件。保存该文件，打开文件管理器，导航到该文件所在的目录，右击这个加密文件，选择 “Open With Decrypt File”，给文件一个新名称（不带 .gpg 的扩展名），然后单击“Save”。当提示时，输入你的 gpg 密钥的密码，该文件就会被解密并准备使用。

### Dolphin

在 KDE 前端，必须安装一个软件包才能使用 Dolphin 文件管理器进行加密/解密。 登录到你的 KDE 桌面，打开终端窗口，然后输入以下命令（我正在使用 Neon 进行演示。如果你的发行版不是基于 Ubuntu 的，则必须相应地更改命令）：

```
sudo apt install kgpg
```

安装完毕后，注销并重新登录 KDE 桌面。 你可以打开 Dolphin 并右键单击要加密的文件。 由于这是你第一次使用 kgpg，因此你必须完成快速设置向导（不言自明）。当完成该向导后，你可以返回该文件，右键单击它（图3），然后选择 Encrypt File。

![Dolphin][8]

*图3：在 Dolphin 中加密文件。*

系统将提示你选择用于加密的密钥（图4）。 进行选择并单击 “OK”。 该文件将被加密，而且你已准备好将其发送给收件人。

注意：使用 KDE 的 Dolphin 文件管理器市，你无法仅使用密码加密。

![Dolphin][10]

*图4：选择要加密的收件人。*

如果你收到来自有你的公钥的用户的加密文件（或者你有一个自己加密的文件），请打开 Dolphin，导航到相关文件，双击该文件，为该文件指定一个新名称 ，键入加密密码并单击 “OK”。 你现在可以读取到新解密的文件。 如果你使用自己的密钥加密了该文件，则不会提示你键入密码（因为它已经被存储了）。

### Thunar

Thunar 文件管理器有点棘手。 没有任何额外的软件包可供安装；相反，你需要为了加密创建新的自定义操作。完成此操作后，你将能够在文件管理器中执行此操作。

要创建自定义操作，请打开 Thunar 文件管理器，然后单击 “Edit > Configure Custom Actions”。 在所得到的窗口中，单击 “+” 按钮（图5）并为加密操作输入以下内容：

- 名称：加密
- 描述：文件加密
- 命令：`gnome-terminal -x gpg --encrypt --recipient ％f`

单击 “OK” 以保存此操作。

![Thunar][12]

*图5：在Thunar中创建自定义操作。*

注意：如果 gnome-terminal 不是你的默认终端，请替换该命令以打开你的默认终端。

你还可以创建仅使用密码（而非密钥）加密的操作。 为此，该操作的详细动作将会是以下内容：

- 名称：加密密码
- 说明：仅使用密码加密
- 命令：`gnome-terminal -x gpg -c ％f`

你不需要为解密过程创建一个自定义操作，因为 Thunar 已经知道如何处理一个加密文件。 要解密文件，只需（在 Thunar 中）右键单击它，选择 “Open With Decrypt File”，为解密文件命名，然后（在提示时）键入加密密码。 Viola，你的加密文件已被解密并可以使用。

### 一个警告

请注意：如果你使用自己的密钥加密自己的文件，则无需输入加密密码来解密它们（因为你的公钥已存储）。 但是，如果你收到（拥有你的公钥的）其他人的文件，则需要输入你的密码。 如果你想要存储自己的加密文件，而不是使用密钥来加密它们，请使用仅使用密码加密。 Nautilus 和Thunar（但不是 KDE）可以做到这一点。 通过选择密码加密（通过密钥加密），当你解密文件时，它将始终提示你输入密码。

### 其他文件管理器

还有很多其它的文件管理器，它们中的一些可以使用加密，有些则不能。 你很有可能正在使用这三种工具中的一种，因此不仅可以将加密 / 解密添加到上下文菜单，而且是非常容易。 尝试一下，看看它是否会使加密和解密的过程变得更容易。

从 Linux 基金会和 edX 免费提供的[“Linux 介绍”][13]课程了解更多关于 Linux 的信息。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/3/how-encrypt-files-within-file-manager

作者：[JACK WALLEN][a]
译者：[Auk7f7](https://github.com/Auk7f7)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.gnupg.org/
[3]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/nautilus.jpg?itok=ae7Gtj60 "nautilus"
[4]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/nautilus_2.jpg?itok=3ht7j63n "nautilus"
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kde_0.jpg?itok=KSTctVw0 "Dolphin"
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kde_2.jpg?itok=CeqWikNl "Dolphin"
[12]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/thunar.jpg?itok=fXcHk08B "Thunar"
[13]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
