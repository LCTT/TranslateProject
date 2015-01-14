Windows和Ubuntu双系统，修复UEFI引导的两种办法
=======================================================================
读者在读过我的[安装Ubuntu和Windows 8双系统教程][1]以后，碰到的主要的问题是电脑直接启动到Windows 8而没有出现启动Ubuntu的选项。

这里有两种修复EFI启动引导的方法，使Ubuntu可以正常启动

![](http://0.tqn.com/y/linux/1/L/E/J/1/grub2.JPG) 

*将GRUB2设置为启动引导*

### 1. 启用GRUB引导 ###

在安装时，有些地方可能会出问题。

理论上来说，如果你首先安装Ubuntu，那么你需要[关闭快速启动][2]。

希望你[按照这个指南创建一个UEFI Ubuntu 启动优盘][3]安装正确的UEFI引导程序。

如果你在安装时已经完成了这些事情，那么可能出错的地方就是将GRUB2设置为启动管理器。

可以按照以下几个步骤将GRUB2设置为默认的引导程序：

1. 登录Windows 8
2. 转到桌面
3. 右击开始按钮，选择管理员命令行
4. 输入 mountvol g: /s (这将你的EFI目录结构映射到G盘)
5. 输入 cd g:\EFI
6. 当你输入 dir 列出文件夹内容时，你可以看到一个Ubuntu的文件夹
7. 这里的参数可以是grubx64.efi或者shimx64.efi
8. 运行下列命令将grub64.efi设置为启动引导程序：
bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
9. 重启你的电脑
10. 你将会看到一个包含Ubuntu和Windows选项的GRUB菜单
11. 如果你的电脑仍然直接启动到Windows，重复步骤1到7，但是这次输入：
bcdedit /set {bootmgr} path \EFI\ubuntu\shimx64.efi
12. 重启你的电脑

这里你做的事情就是登录Windows管理员命令行，将EFI引导区映射到磁盘上，来查看Ubuntu的引导程序是否安装成功，然后选择grubx64.efi或者shimx64.efi作为引导程序。

那么[grubx64.efi和shimx64.efi有什么区别呢][4]？在安全启动（serureboot）关闭的情况下，你可以使用grubx64.efi。如果安全启动打开则需要选择shimx64.efi。

在我上面的步骤里面，我建议先试一个，然后再试试另外一个。另外一种方法是选择一个，然后根据你选择的引导程序在BIOS中启用或者禁用安全启动。

### 2.使用rEFInd引导Ubuntu和Windows双系统 ###

![](http://f.tqn.com/y/linux/1/L/F/J/1/refind.png) 

[rEFInd引导程序][5]会以图标的方式列出你所有的操作系统。因此，你可以通过点击相应的图标来启动Windows、Ubuntu或者优盘中的操作系统。

[点击这里][6]下载rEFInd for Windows 8。

下载和解压以后，按照以下的步骤安装rEFInd。

1. 返回桌面
2. 右击开始按钮，选择管理员命令行
3. 输入 mountvol g: /s (这将你的EFI目录结构映射到G盘)
4. 进入解压的rEFInd目录。例如：
cd c:\users\gary\downloads\refind-bin-0.8.4\refind-bin-0.8.4 。
当你输入 dir 命令，你可以看到一个refind目录
5. 输入如下命令将refind拷贝到EFI引导区
xcopy /E refind g:\EFI\refind\
6. 输入如下命令进入refind文件夹
cd g:\EFI\refind
7. 重命名示例配置文件
rename refind.conf-sample refind.conf
8. 运行如下命令将rEFind设置为引导程序
bcdedit /set {bootmgr} path \EFI\refind\refind_x64.efi
9. 重启你的电脑
10. 你将会看到一个包含Ubuntu和Windows的图形菜单

这个过程和选择GRUB引导程序十分相似。

简单的说，主要是下载rEFind，解压文件。拷贝文件到EFI引导区，重命名配置文件，然后将rEFind设置为引导程序。

### 概要 ###

希望这篇文章可以解决有些人在安装Ubuntu和Windows 8.1双系统时出现的问题。如果你仍然有问题，可以通过上面的电邮和我进行交流。

---
via: http://linux.about.com/od/LinuxNewbieDesktopGuide/tp/3-Ways-To-Fix-The-UEFI-Bootloader-When-Dual-Booting-Windows-And-Ubuntu.htm


作者：[Gary Newell][a]
译者：[zhouj-sh](https://github.com/zhouj-sh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linux.about.com/bio/Gary-Newell-132058.htm
[1]:http://linux.cn/article-3178-1.html
[2]:http://linux.cn/article-3178-1.html#4_3289
[3]:http://linux.cn/article-3178-1.html#4_1717
[4]:https://wiki.ubuntu.com/SecurityTeam/SecureBoot
[5]:http://www.rodsbooks.com/refind/installing.html#windows
[6]:http://sourceforge.net/projects/refind/files/0.8.4/refind-bin-0.8.4.zip/download