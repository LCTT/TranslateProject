Nautilus Gksu 插件 -- 在你的右键菜单中增加“以管理员身份打开”选项
===

在过去几天，我漏掉一个用管理员身份打开文件/目录的右键菜单选项（在nautilus文件管理器中）。原因在于，每个操作都必需有root权限，我必须返回命令行终端使用sudo。这并不是说我不习惯命令行，但是我仍希望至少有可用的东西能等价于[sudo或su][1]。我四处搜索发现一个nautilus插件-- **Nautilus-Gksu** 。

**NOTE** -- 本文中所有的示例已经在Ubuntu 13.04上测试过。

**Nautilus-Gksu**  

![](https://github-camo.global.ssl.fastly.net/9c2141e586890d26dd98a869c1eee96c428af855/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676b73752d6d61696e2e706e67)

**简短教程**  

Nautilus-Gksu插件在右键菜单中添加了一个有用的选项-- **以管理员身份打开** 。这有助于在nautilus文件管理器中处理文件和目录。

例如，假设你想从nautilus文件管理器中打开root目录。想当然的双击将获取一个错误信息，如：  

![](https://github-camo.global.ssl.fastly.net/a84dcf35ea5bd2a7a8248b8f66bd8aa6b6f5318b/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676b73752d312e706e67)

但是你安装nautilus gksu插件后，你需要做的是在目录上右击并选择“以管理员身份打开（open as administrator）”选项。

![](https://github-camo.global.ssl.fastly.net/cf210e9f327a4abfcb30f22fa7fa99caad5682e2/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676b73752d322e706e67)

一旦你点击了这个选项，你将被提示输入密码。

![](https://github-camo.global.ssl.fastly.net/2185bccc5bf9e820ea404d8720b6fa1dd162f2d0/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676b73752d332e706e67)

只要输入密码就能做任何你想做的。

**下载/安装**  

正如前面提到的，这些天我的大多数文章用Ubuntu 13.04完成，允许我坦白的讲，通过推荐的方式安装这个插件很困难。

这意味着该命令像：  
	
	sudo apt-get install nautilus-gksu

它没有工作且获得以下错误信息：  

	Reading package lists... Done  
	Building dependency tree  
	Reading state information... Done  
	E: Unable to locate package nautilus-gksu  

我google了一下这个问题，发现我不是唯一遇到这个问题的，但是许多其他Ubuntu 13.04用户也面临一个[类似的问题][2]。不管怎样，我一直在寻找解决方案，直到我发现一个线索指向该[解决方案][3]。我在[AskUbuntu][4]上阅读完帖子并尝试在Ubuntu 12.04上提到的步骤。

这是帖子的一个截图：

![](https://github-camo.global.ssl.fastly.net/1b20b51f49695399fa211d6b254631b8f3450636/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676b73752d342e706e67)

阅读完上面的帖子，我跟着以下步骤：  

- 下载[64位插件][5]。[我的是64位系统]
- 解压下载后的deb文件。
- 执行以下命令：  
  
	sudo cp /home/himanshu/Downloads/nautilus-gksu_2.0.2-5ubuntu2_amd64/usr/lib/nautilus/extensions-2.0/libnautilus-gksu.so /usr/lib/nautilus/extensions-3.0/

在这三步里，插件安装成功。

**优点**  

让你右击使用root权限轻松打开任何文件或目录。

**缺点**  

在Ubuntu 13.04上安装不容易。

**总结**

如果你的工作涉及到使用Nautilus文件管理器管理你的日常文件，那么这个插件是你的首选。虽然在Ubuntu 13.04上安装它并不容易，但是它仍然值得付出努力。

via: <http://mylinuxbook.com/nautilus-gksu/>

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://mylinuxbook.com/sudo-vs-su-in-ubuntu-linux/
[2]:http://askubuntu.com/questions/314267/how-can-i-install-nautilus-gksu
[3]:http://s5407.socode.info/question/5152c20be8432c04268cee15
[4]:http://askubuntu.com/questions/78116/where-is-the-open-as-administrator-option-in-nautilus-gone
[5]:http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/g/gksu/nautilus-gksu_2.0.2-5ubuntu2_amd64.deb

