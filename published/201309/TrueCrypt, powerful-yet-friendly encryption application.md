功能强大界面友好的加密程序，TrueCrypt
===============================

[TrueCrypt][1]是一款免费的开源加密程序，拥具有强大、多样、先进、高质量的加密能力，它具有友好、易懂的用户界面和功能。

TrueCrypt允许用户通过密码访问加密后的文件，其本质上是将文件解密后再像常规文件一样访问。完全加密后的文件，非用户以外的人是无法访问的。

TrueCrypt的各项 **特性** 如下：

- 能够建立加密文件夹并将其呈现为真实的硬盘
- 支持加密存储设备（例如U盘）或整个分区
- 自动根据需要进行实时动态加密
- 充分利用系统资源，能够快速读取加密数据，速度接近访问未加密数据时的速度

TrueCrypt的 **实时动态加密** ，意指：

- 数据在存储之前就已经被自动加密
- 数据在加载之后会自动解密
- 例如，播放一个加密文件夹里的小电影，TrueCrypt会直接在内存中将密数据一部分一部分解密后再送入指定的内存块（或播放器）。也就是说“TrueCrypt从不会将明数据放在硬盘上，这些明数据只会暂时存在于内存里”。

下面几个步骤教你如何用TrueCrypt **新建** 一个加密文件夹：

- [下载][2]TrueCrypt 7.1
- 解压缩后在终端中输入以下命令（假设你解压在了Downloads文件夹下）

		cd Downloads
		./truecrypt-7.1a-setup-x64

（如果你的操作系统是32位，将上面的x64改为x32）

- 然后根据提示，点击鼠标，轻松完成安装
- 在Dash搜索栏中键入`truecrypt`,启动TrueCrypt
- 依次点击`TrueCrypt-->Volumes-->Create New Volume`，建立一个新的“待加密文件夹”
- 选中 `Create an encrypted file container`然后点击`Next`

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20create%20new%20volume.png)

- 选中`Standard Truecrypt volume` 并点击 `Next`

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20standard%20truecrypt%20volume.png)

点击`Select File`，在你认为合适的位置新建目录/条目（例如，在`Music`目录下建立一个`123`条目），然后点击`Next`

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20volume%20location.png)

- 再次点击`Next` （此时默认选择的加密算法是AES）

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20aes.png)

- 选择大小（例如要建立一个100MB的文件夹，就在输入框中填入`100`，后面的复选框选中`MB`）

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20size%20mb.png)

- 设置一个密码

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20password.png)

- 选择一个文件系统类型（例如`Linux Ext4`)

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20ext4.png)

- 选中`I will mount the volume only on Linux`（这里请根据实际情况选择）

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20mount%20linux.png)

- 接下来，持续猛烈晃动你的鼠标几秒钟（译者注：该步骤用来生成密钥，晃动越无规律时间越长越好），然后点击`Format`，最后输入刚才设置的密码，整个加密条目的创建过程就完成了。

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20random%20pool.png)

**使用**

到此为止，刚刚建立的那个加密文件夹就已经在TrueCrypt的保护下了，点击 `Select File`，找到刚建立的加密条目，再点击底部的`Mount`，挂载/打开该加密文件夹。

接下来，用户就可以把这个加密目录当做一个常规目录正常使用，可以复制图像、重命名文件、双击打开图像等等。

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20nautilus.png)

下图中，点击`Dismount`按钮，就可以卸载该加密文件夹，卸载后刚才挂载的盘符就不见了，同时里面的文件自然也就禁止访问了。

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20dismount.png)


via: http://iloveubuntu.net/truecrypt-powerful-yet-friendly-encryption-application

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Mr小眼儿] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Mr小眼儿]:http://linux.cn/space/14801
[Caroline]:http://linux.cn/space/14763

[1]:http://www.truecrypt.org/
[2]:http://www.truecrypt.org/downloads 
