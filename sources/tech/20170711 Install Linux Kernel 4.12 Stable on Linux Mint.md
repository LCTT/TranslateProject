Linux Mint安装Linux Kernel 4.12(稳定版)
============================================================

![Linux Mint安装Linux Kernel 4.12(稳定版)](https://mintguide.org/uploads/tux_system.jpg)

**Linus Torvalds** 推荐的 **[Linux][5] [内核][6] 4.12**. 从 **[这里][7]** 可以直接下载相关的 **deb** 包来安装. 或者, 继续阅读本文,按下面的步骤安装新kernel.

 _**警告. [Linux][1] [内核][2] 是系统的关键组成. 在硬件设备不正常工作时,可以尝试执行升级，新的内核可能会解决此问题。 但同样的, 非必须地更新一个新的内核也会导致不必要的回滚, 例如, 无网络连接, 没有声音, 甚至是无法正常启动系统, 所以安装一个新的内核,请正确认识风险.**_ 

最简单的安装任意内核方法 - 在**[Linux Mint][9]** 使用 [UKUU][8] 项目.

```
TerminalShekin@mylinuxmintpc~$sudo apt-add-repository -y ppa:teejee2008/ppa 
sudo apt-get update
sudo apt-get install ukuu
```

**提醒  _所有[Nvidia][3]/AMD电脑用户, 在安装内核之前, 建议切换到可用的驱动._** 


**如果决定删除内核4.12，**

1.首先, 重启计算机，选择[GRUB][12]菜单中的旧内核启动.引导系统结束，通过以下命令删除新的内核

2.然后, 使用 [UKUU][13] 项目,或者命令:
```
TerminalShekin@mylinuxmintpc~$sudo apt purge linux-image-4.12-*
```
3.最后, 更新 **GRUB**或者**[BURG][10]**
```
TerminalShekin@mylinuxmintpc~$sudo update-grub
```
为了回到之前的内核, 在启动**Grub**的时候,选择**以前的Linux版本**

Good Luck!!!

[kernel.org][14]

--------------------------------------------------------------------------------

via: https://mintguide.org/system/798-install-linux-kernel-4-12-stable-on-linux-mint.html

作者：[Shekin ][a]
译者：[VicYu](https://vicyu.com)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://mintguide.org/user/Shekin/
[1]:https://mintguide.org/
[2]:https://mintguide.org/tags/kernel/
[3]:https://mintguide.org/tags/nvidia/
[4]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cDovL2tlcm5lbC51YnVudHUuY29tL35rZXJuZWwtcHBhL21haW5saW5lL3Y0LjEyLw%3D%3D
[5]:https://mintguide.org/
[6]:https://mintguide.org/tags/kernel/
[7]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cDovL2tlcm5lbC51YnVudHUuY29tL35rZXJuZWwtcHBhL21haW5saW5lL3Y0LjEyLw%3D%3D
[8]:https://mintguide.org/tools/691-ukuu-ubuntu-kernel-upgrade-utility.html
[9]:https://mintguide.org/
[10]:https://mintguide.org/effects/716-burg-graphical-bootloader-install-to-linux-mint.html
[11]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cHM6Ly93d3cua2VybmVsLm9yZy8%3D
[12]:https://mintguide.org/tools/37-restore-grub-boot-loader-in-linux-mint-after-installation-reinstallation-windows.html
[13]:https://mintguide.org/tools/691-ukuu-ubuntu-kernel-upgrade-utility.html
[14]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cHM6Ly93d3cua2VybmVsLm9yZy8%3D
[15]:https://mintguide.org/system/
