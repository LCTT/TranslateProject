Boot Repair Tool： 可以修复与启动相关的大部分问题
=========

 [![boot repair tool repair the most boot related problems ](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/boot-repair-tool-repair-the-most-boot-related-problems_orig.jpg)][1] 
 
 ​我们都碰到过启动相关的问题，并且大部分时候都是简单的 **GRUB** 上的问题。 有时候很多人会觉得、输入一段很长的命令或在论坛中搜索来找到解决方法太麻烦了。今天我要告诉你如何使用一个简单而轻巧的软件来解决大部分的启动相关的问题。这个工具就是著名的 **Boot Repair Tool** 。好了，话不多说，让我们开始吧。

### 如何在 Linux 中安装和使用启动修复工具

你需要一个你所安装的操作系统的现场版的 USB 棒或 DVD，这是安装这个应用并使用它的前提条件。 引导到操作系统[17] 并打开终端并输入以下命令 

```
sudo add-apt-repository -y ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair && boot-repair
```

 [![install boot repair tool in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-boot-repair-tool-in-linux.jpg?1498051049)][2]  

在安装结束以后，你可以从应用菜单或或其它你在系统上启动应用的地方启动你的修复工具。

 [![run boot-repair from apps menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/run-boot-repair-from-apps-menu.jpg?1498051112)][3]  
 
你可以在菜单栏中看到 Boot Repair。
 
 [![Picture](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/scan-boot-issues-with-boot-repair.jpg?1498051197)][4]
   
​启动它，它就会开始进行一些扫描操作，我们只要等它自己结束就好了。
​
 [![boot repair app menu to repair system](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/boot-repair-app-menu-to-repair-system.jpg?1498051265)][5]  

现在你会看到这个界面，这是基于之前扫描的建议修复。 在底部还可以有一个高级选项，你可以在高级选项里进行各方面的设置。 我建议没有经验的用户使用推荐维修，因为它很简单，在大多数情况下我们都可以这样做。

[![apply recommended fixes to fix grub issues](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/apply-recommended-fixes-to-fix-grub-issues.jpg?1498051332)][6]  

选择推荐的更新后，它将开始修复。 等待进一步的处理。

 [![fix the grub menu using boot repair](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/fix-the-grub-menu-using-boot-repair.jpg?1498051422)][7]  
 
你现在会看到一个指令界面。 现在是轮到我们操作的时候了。打开终端，逐个复制并粘贴其中高亮的命令到终端中。

[![download and install grub using the given commands](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/confirm-grub-packages-installation.jpg?1498051588)][8]  

命令完成后，你会看到一个上面提及的要求确认的界面。 使用箭头键或 Tab 键选择“Yes”，然后按回车键。 现在在 **启动修复工具** 界面中点击 “forward”。  

 [![install grub menu and kernel to fix boot menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-grub-menu-and-kernel-to-fix-boot-menu.jpg?1498055715)][9] 

现在你会看到这个界面。 复制在那里提到的命令，并将其粘贴到终端中，然后按回车并让其执行此操作。 需要一段时间所以请耐心等待，它将下载GRUB、内核或任何修复您的引导所需的内容。

 [![install grub](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-grub.jpg?1498055780)][10] 
 
现在你可能会看到一些选项用于配置安装 GRUB 的位置。 选择“yes”，然后按回车，你会看到上面的界面。使用空格键选择选项和按 TAB 以浏览选项。 选择并安装 GRUB 后，可以关闭终端。 现在在启动修复工具屏幕中选择 “forward” 选项。

[![scan for the boot issues](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/scan-for-the-boot-issues.jpg?1498055908)][11]  

现在它会做一些扫描操作，并且会询问你一些需要确认的一些选项。 每个选项都选择是即可。

[![fixed boot issues with boot rescue](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/fixed-boot-issues-with-boot-rescue.jpg?1498056040)][12]  

它会显示一个成功的确认消息。 如果没有，并且显示失败的消息，则将生成链接。 转到该链接获取更多帮助。

成功后，重启你的电脑。 当你重新启动时，你会看到 GRUB。 现在已成功维修您的电脑。 一切顺利。

### 引导修复的高级技巧

当我的电脑出现双引导启动画面时，我发现在修复时，它无法识别 [安装在另一个分区上的 Windows 7][19]。 这里有一个简单的提示来帮你解决这个问题。

打开终端并安装 os-prober。 它很简单，可以在软件中心或通过终端找到。

os-prober 可以帮助您识别安装在 PC 上的其他操作系统。

[![install os-prober](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-os-prober_orig.jpg)][13] 

os-prober 安装完成后，通过输入 `os-prober` 在终端运行它。 如果失败了那么试着用 root 账号运行它。 之后运行`update-grub` 命令。 这就是你可以用于从 GRUB 中启动 Windows 的所需要做的全部。

 [![upgrade-grub in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/upgrade-grub-in-linux.jpg?1498056179)][14] 

### 总结

​以上就是全部的内容。现在你已经成功地修复了你的 PC。

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems

作者：[linuxandubuntu][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems
[1]:http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-boot-repair-tool-in-linux_orig.jpg
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/run-boot-repair-from-apps-menu_orig.jpg
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-boot-issues-with-boot-repair_orig.jpg
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/boot-repair-app-menu-to-repair-system_orig.jpg
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/apply-recommended-fixes-to-fix-grub-issues_orig.jpg
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/fix-the-grub-menu-using-boot-repair_orig.jpg
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/confirm-grub-packages-installation_orig.jpg
[9]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-grub-menu-and-kernel-to-fix-boot-menu_orig.jpg
[10]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-grub_orig.jpg
[11]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-for-the-boot-issues_orig.jpg
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/fixed-boot-issues-with-boot-rescue_orig.jpg
[13]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-os-prober_orig.jpg
[14]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/upgrade-grub-in-linux_orig.jpg
[15]:http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems
[16]:http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems#comments
[17]:http://www.linuxandubuntu.com/home/category/distros
[18]:http://www.linuxandubuntu.com/home/linux-kernel-40-codenamed-hurr-durr-im-a-sheep-released-installupgrade-in-ubuntulinux-mint
[19]:http://www.linuxandubuntu.com/home/how-to-dual-boot-windows-7-and-ubuntu
