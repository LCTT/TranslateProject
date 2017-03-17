如何在 Ubuntu 中加密硬盘
=========================
 ![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/hdd-encryption-ubuntu.jpg "How to Encrypt Your Hard Disk in Ubuntus")

隐私保护、安全和加密是不可分开的，用户可以通过加密来提高安全和保护操作系统的隐私信息。本文将会介绍在 Ubuntu Linux 中对硬盘全盘加密的优缺点。此外，我们也介绍如何在系统级别上进行加密设置，并对一些目录进行加密。加密是非常有用的，而且也没有你想象中那么复杂。综上所述，让我开始进行加密吧。

### 加密的优缺点

尽管进行全盘加密听起来非常棒，但是否要这么做还是有些争议的。我们先来看看这个做法有哪些优缺点。

#### 加密的优点

* 提高私密程度
* 只有拥有密钥的人才能访问操作系统及其中文件
* 确保政府或者黑客无法侦测你的系统和侵犯你的隐私

#### 加密的缺点

* 在其他的 Linux 操作系统上访问和挂载文件系统将变得困难
* 无法从那些加密分区中恢复数据
* 如果用户丢失了加密密钥，那就彻底悲剧了

### 安装前的准备

在 Ubuntu 中加密最好就是在安装进程开始之前在系统层面进行。在 Ubuntu 安装进程开始之后是无法加密的，所以先备份你的重要数据到 [Dropbox][10]、 [Google Drive][11] （或者其它硬盘上），然后后准备重新安装 Ubuntu。

![ubuntu 下载](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-ubuntu-alternative-downloads.jpg "ubuntu-encrypt-ubuntu-alternative-downloads")

从 [此处][12] 开始下载最新版本的 Ubuntu，并制作好可启动的 U 盘 （需要至少 2 GB 可用空间）。

制作启动 U 盘需要一个烧录程序，可以到 [etcher.io][13] 去下载。下载好之后解压 zip 文件，右击 (或者使用鼠标选定之后按下回车) 解压出来的文件以运行。

![烧录程序](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-etcher.jpg "ubuntu-encrypt-etcher")

**注意**：烧录程序会询问是否创建图标，选择“yes”。

在烧录程序中点击“选择镜像（Select Image）”按钮，选择之前下载好的 Ubuntu ISO 镜像。然后插入你的 U 盘。烧录程序会自动检测并为你选择。最后，点击“开始烧录（ Flash）”按钮来开始创建进程。

完成之后，重启电脑至 BIOS，设置为 U 盘启动。

**注意**：如果你的电脑不支持从 U 盘启动，下载 32 位的 Ubuntu，并使用你电脑中的烧录软件将其烧录到 DVD 中。

### 对你的硬盘进行全盘加密

加载好 Live Ubuntu 之后，安装进程就可以开始了。当 Ubuntu 安装进程开始之后，会出现下面这样一个界面。注意每个人安装进程都可能不同的，或许你会看到的不太一样。

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-installation-type1.jpg "ubuntu-encrypt-installation-type")

选择“擦除磁盘并安装 Ubuntu （Erase disk and install Ubuntu）”,并选择“加密新装的 Ubuntu 以提高安全程度（Encrypt the new Ubuntu installation for Security）”来开始加密的安装进程。这样会自动选择 LVM。两个选框都必须选中。选好加密选项之后，点击“现在安装（Install Now）”。

**注意**：如果是双系统启动的话，你需要安装到空余磁盘空间，而非擦除磁盘。选择好之后，像上边一样选择加密选项。

选择加密选项并开始安装之后，会出现一个加密配置页面。这个页面用户需要为安装进程设置自己的加密密钥。

![设置安全密码](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-choose-security-key.jpg "ubuntu-encrypt-choose-security-key")

输入安全密钥。该安全密钥设置窗口会自动为你输入的密钥进行密码强度评级，使用这个功能时看着后边的显示，直到显示为“高强度密码（strong password）”为止。输入完成后，在下方在此输入来确认密码，最后用一张纸把密码写下下来妥善保管。

此外，选定“覆些磁盘空余空间（Overwrite empty disk space）”，当然这是一个可选步骤。一切准备就绪之后点击现在安装即可。

![选择时区](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-timezone-select.jpg "ubuntu-encrypt-timezone-select")

在设置完加密密钥之后，就是传统的 Ubuntu 安装配置了。选择时区、创建用户以及对应的安全密码。

![加密家目录](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-home-folder-e1483900399596.jpg "ubuntu-encrypt-home-folder")

与创建和加密 Ubuntu 磁盘对应，在创建用户的时记得候选择“登录系统需要密码（require my password to log in）”和“加密我的家目录（encrypt my home folder）”。这样可以为你的数据再增加一层保护。

等到用户名、加密设置以及其他所有事情都完成之后，Ubuntu 安装进程就可以开始了。随后，安装进程会告知你安装已完成，移除安装介质后重启即可享受 Ubuntu 之旅。

### 结论

进行磁盘加密之后，如果没有加密密钥则无法开启 Ubuntu。尽管无趣，但这种级别的加密使用最容易的，并且还充分利用了操作系统提供的特性。用户不需要过多的知识，或者使用其他第三方程序就可以很快完成加密要求。

![加密电脑](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-decrypt-computer.jpg "ubuntu-encrypt-decrypt-computer")

加密之后的 Ubuntu，使用起来和没有加密的并没有什么区别。不需要其他的步骤，也不需要学习什么复杂的解密方法。对于那些非常在意隐私但又不想太过麻烦的人来说，这个提高安全等级的方法是必须学会的（当然，这很容易不是吗）。

你是否会使用 Ubuntu 对硬盘进行加密呢？在下方评论告诉我们。

---------------------------------

译者简介：

[GHLandy](http://GHLandy.com) —— 欲得之，则为之奋斗 (If you want it, work for it.)。

-----------------------------------

via: https://www.maketecheasier.com/encrypt-hard-disk-in-ubuntu/

作者：[Derrik Diener][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/author/derrikdiener/
[2]:https://www.maketecheasier.com/encrypt-hard-disk-in-ubuntu/#comments
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fencrypt-hard-disk-in-ubuntu%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fencrypt-hard-disk-in-ubuntu%2F&text=How+to+Encrypt+Your+Hard+Disk+in+Ubuntu
[6]:mailto:?subject=How%20to%20Encrypt%20Your%20Hard%20Disk%20in%20Ubuntu&body=https%3A%2F%2Fwww.maketecheasier.com%2Fencrypt-hard-disk-in-ubuntu%2F
[7]:https://www.maketecheasier.com/why-is-iphone-overheating/
[8]:https://www.maketecheasier.com/it-security-ethical-hacking-training/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:http://www.maketecheasier.com/tag/dropbox
[11]:http://www.maketecheasier.com/tag/google-drive
[12]:https://www.ubuntu.com/download/alternative-downloads
[13]:https://etcher.io/
