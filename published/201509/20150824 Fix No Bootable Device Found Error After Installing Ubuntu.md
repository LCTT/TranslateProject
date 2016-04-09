修复安装完 Ubuntu 后无可引导设备的错误
================================================================================

通常情况下，我会安装启动 Ubuntu 和 Windows 的双系统，但是这次我决定完全消除 Windows 纯净安装 Ubuntu。纯净安装 Ubuntu 完成后，结束时屏幕输出 **无可引导设备(no bootable device found)** 而不是进入 GRUB 界面。显然，安装搞砸了 UEFI 引导设置。

![安装完 Ubuntu 后无可引导设备](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/No_Bootable_Device_Found_1.jpg)

我会告诉你我是如何修复**在宏碁笔记本上安装 Ubuntu 后出现无可引导设备错误**的。我声明了我使用的是宏碁灵越 R13，这很重要，因为我们需要更改固件设置，而这些设置可能因制造商和设备有所不同。

因此在你开始这里介绍的步骤之前，先看一下发生这个错误时我计算机的状态：

- 我的宏碁灵越 R13 预装了 Windows 8.1 和 UEFI 引导管理器
- 安全引导（ Secure boot）没有关闭，（我的笔记本刚维修过，维修人员又启用了它，直到出现了问题我才发现）。你可以阅读这篇博文了解[如何在宏碁笔记本中关闭安全引导（secure boot）][1]
- 我选择了清除所有东西安装 Ubuntu，例如现有的 Windows 8.1，各种分区等
- 安装完 Ubuntu 之后，从硬盘启动时我看到无可引导设备错误。但能从 USB 设备正常启动

在我看来，没有禁用安全引导（secure boot）可能是这个错误的原因。但是，我没有数据支撑我的观点。这仅仅是预感。有趣的是，双系统启动 Windows 和 Linux 经常会出现这两个 Grub  问题：

- [错误：没有 grub 救援分区][2]
- [支持最小化 BASH 式的行编辑][3]

如果你遇到类似的情况，你可以试试我的修复方法。

### 修复安装完 Ubuntu 后无可引导设备错误 ###

请原谅我的图片质量很差。我的一加相机不能很好地拍摄笔记本屏幕。

#### 第一步 ####

关闭电源并进入引导设置。我需要在宏碁灵越 R13 上快速地按下 Fn+F2。如果你使用固态硬盘的话要按的非常快，因为固态硬盘启动速度很快。这取决于你的制造商，你可能要用 Del 或 F10 或者 F12。

#### 第二步 ####

在引导设置中，确保启用了 Secure Boot。它在 Boot 标签里。

#### 第三步 ####

进入到 Security 标签，找到 “选择一个用于执行的可信任 UEFI 文件（Select an UEFI file as trusted for executing）” 并敲击回车。

![修复无可引导设备错误](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/No_Bootable_Device_Found_2.jpg)

特意说明，我们这一步是要在你的设备中添加 UEFI 设置文件（安装 Ubuntu 的时候生成）到可信 UEFI 启动中。如果你记得的话，UEFI 启动的主要目的是提供安全性，由于（可能）没有禁用安全引导（Secure Boot），设备不会试图从新安装的操作系统中启动。添加它到类似白名单的可信列表，会使设备从 Ubuntu UEFI 文件启动。

#### 第四步 ####

在这里你可以看到你的硬盘，例如 HDD0。如果你有多块硬盘，我希望你记住你安装 Ubuntu 的那块。同样敲击回车。

![在 Boot 设置中修复无可引导设备错误](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/No_Bootable_Device_Found_3.jpg)

#### 第五步 ####

你应该可以看到 \<EFI> 了，敲击回车。

![在 UEFI 中修复设置](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/No_Bootable_Device_Found_4.jpg)

#### 第六步 ####

在下一个屏幕中你会看到 \<Ubuntu>。耐心点，马上就好了。 

![安装完 Ubuntu 后修复启动错误](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/No_Bootable_Device_Found_5.jpg)

#### 第七步 ####

你可以看到 shimx64.efi，grubx64.efi 和 MokManager.efi 文件。重要的是 shimx64.efi。选中它并敲击回车。


![修复无可引导设备](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/No_Bootable_Device_Found_6.jpg)

在下一个屏幕中，输入 Yes 并敲击回车。

![无可引导设备_7](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/No_Bootable_Device_Found_7.jpg)

#### 第八步 ####

当我们添加它到可信 EFI 文件并执行后，按 F10 保存并退出。

![保存并退出固件设置](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/No_Bootable_Device_Found_8.jpg)

重启你的系统，这时你就可以看到熟悉的 GRUB 界面了。就算你没有看到 Grub 界面，起码也再也不会看到“无可引导设备”。你应该可以进入 Ubuntu 了。

如果修复后搞乱了你的 Grub 界面，但你确实能登录系统，你可以重装 Grub 并进入到 Ubuntu 熟悉的紫色 Grub 界面。

我希望这篇指南能帮助你修复无可引导设备错误。欢迎提出任何疑问、建议或者感谢。

--------------------------------------------------------------------------------

via: http://itsfoss.com/no-bootable-device-found-ubuntu/

作者：[Abhishek][a]
译者：[ictlyh](http://www.mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/disable-secure-boot-in-acer/
[2]:http://itsfoss.com/solve-error-partition-grub-rescue-ubuntu-linux/
[3]:http://itsfoss.com/fix-minimal-bash-line-editing-supported-grub-error-linux/