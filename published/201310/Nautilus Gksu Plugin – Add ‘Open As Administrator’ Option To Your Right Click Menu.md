Nautilus Gksu 插件：在右键菜单中增加“以管理员身份打开”选项
========================================================

以前，我很想要一个用管理员身份打开文件/目录的右键菜单选项（在nautilus文件管理器中）。原因在于，每个需有root权限的操作，我都必须返回命令行终端使用sudo。这并不是说我不习惯命令行，但是我仍希望至少有个能等价于[sudo或su][1]的东西。我四处搜索发现一个nautilus插件-- **Nautilus-Gksu** 。

**NOTE** -- 本文中所有的示例已经在Ubuntu 13.04上测试过。

##Nautilus-Gksu

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-main.png)

###简短教程

Nautilus-Gksu插件在右键菜单中添加了一个有用的选项-- **以管理员身份打开（Open as administrator）** 。这对nautilus文件管理器中处理文件和目录和有用。

例如，假设你想从nautilus文件管理器中打开root目录。想当然的双击将获取一个错误信息，如：  

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-1.png)

但是你安装nautilus gksu插件后，你需要做的是在目录上右击并选择“以管理员身份打开（Open as administrator）”选项。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-2.png)

一旦你点击了这个选项，你将被提示输入密码。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-3.png)

只要输入密码就行了。

###下载/安装

正如前面提到的，这些天我的大多数文章用Ubuntu 13.04完成，允许我坦白的讲，通过之前推荐的方式安装这个插件很困难。

就是说像这样命令：  
	
	sudo apt-get install nautilus-gksu

它不工作且获得以下错误信息：  

	Reading package lists... Done  
	Building dependency tree  
	Reading state information... Done  
	E: Unable to locate package nautilus-gksu  

我google了一下这个问题，发现我不是唯一遇到这个问题的，但是许多其他Ubuntu 13.04用户也面临一个[类似的问题][2]。不管怎样，我一直在寻找解决方案，直到我发现一个线索指向该[解决方案][3]。我在[AskUbuntu][4]上阅读完帖子并尝试在Ubuntu 12.04上提到的步骤。

这是帖子的一个截图：

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-4.png)

阅读完上面的帖子，我使用以下步骤来完成安装：  

- 下载[64位插件][5]。[我的是64位系统]
- 解压下载后的deb文件。
- 执行以下命令（译者注：直接复制插件的.so文件到插件安装目录）：  
  
	sudo cp /home/himanshu/Downloads/nautilus-gksu_2.0.2-5ubuntu2_amd64/usr/lib/nautilus/extensions-2.0/libnautilus-gksu.so /usr/lib/nautilus/extensions-3.0/

这样插件就安装成功了。

###总结

如果你的工作涉及到使用Nautilus文件管理器管理你的日常文件，那么这个插件是你的首选。虽然在Ubuntu 13.04上安装它并不容易，但是它仍然值得付出努力。

**优点**  

让你右击使用root权限轻松打开任何文件或目录。

**缺点**  

在Ubuntu 13.04上安装不容易。

---

via: http://mylinuxbook.com/nautilus-gksu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[wxy]:http://linux.cn/space/wxy

[1]:http://mylinuxbook.com/sudo-vs-su-in-ubuntu-linux/
[2]:http://askubuntu.com/questions/314267/how-can-i-install-nautilus-gksu
[3]:http://s5407.socode.info/question/5152c20be8432c04268cee15
[4]:http://askubuntu.com/questions/78116/where-is-the-open-as-administrator-option-in-nautilus-gone
[5]:http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/g/gksu/nautilus-gksu_2.0.2-5ubuntu2_amd64.deb

