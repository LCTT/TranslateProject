LKU：一套在 Ubuntu/LinuxMint 上编译、安装和更新最新内核的 Shell 脚本
============================================================

以手动方式安装和升级最新的 Linux 内核对于每个人来说都不是一件小事，甚至包括一些有经验的人也是如此。它需要对 Linux 内核有深入的了解。过去我们已经介绍了 UKUU（Ubuntu Kernel Upgrade Utility），它可以从 kernel.ubuntu.com 网站上自动检测最新的主线内核，并弹出一个不错的窗口界面进行安装。

[Linux Kernel Utilities][2] （LKU）提供一组 shell 脚本（三个 Shell 脚本），可以帮助用户从 kernel.org 获取并编译和安装最新的 Linux 内核，也可以从 kernel.ubuntu.com 获取安装最新的预编译的 Ubuntu 内核。甚至可以根据需要选择所需的内核（手动内核选择）。

该脚本还将根据 PGP 签名文件检查下载的归档文件，并且可以选择通用和低延迟版内核。

建议阅读：[ukuu：一种在基于 Ubuntu 的系统上轻松安装升级 Linux 内核的方式][3]

它可以删除或清除所有非活动的内核，并且不会为了安全目的留下备份的内核。强烈建议在执行此脚本之前重新启动一次。

* `compile_linux_kernel.sh` ：用户可以从 kernel.org 编译和安装所需的或最新的内核
* `update_ubuntu_kernel.sh` ：用户可以从 kernel.ubuntu.com 安装并更新所需或最新的预编译 Ubuntu 内核
* `remove_old_kernels.sh` ：这将删除或清除所有非活动内核，并且只保留当前加载的版本

kernel.org 有固定的发布周期（每三个月一次），发布的内核包括了新的功能，改进了硬件和系统性能。由于它具有标准的发布周期，除了滚动发布的版本（如 Arch Linux，openSUSE Tumbleweed 等），大多数发行版都不提供最新的内核。

### 如何安装 Linux Kernel Utilities (LKU)

正如我们在文章的开头所说的，它的 shell 脚本集只是克隆开发人员的 github 仓库并运行相应的 shell 文件来执行这个过程。

```
$ git clone https://github.com/mtompkins/linux-kernel-utilities.git && cd linux-kernel-utilities
```

### 安装指定版本内核

为了测试的目的，我们将安装 Linux v4.4.10-xenial 内核。在安装新内核之前，我们需要通过 `uanme -a` 命令检查当前安装的内核版本，以便我们可以检查新内核是否可以安装。

```
$ uname -a
Linux magi-VirtualBox 4.4.0-21-generic #37-Ubuntu SMP Mon Apr 18 18:33:37 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```

根据上面的输出，我们的系统使用的是 4.4.0-21 通用内核。

只需运行 `update_ubuntu_kernel.sh` shell 脚本。第一次运行脚本时会检查是否满足所有的依赖关系，然后自动安装缺少的依赖项。它会检测系统使用的发行版，并检索 kernel.ubuntu.com 中可用的预编译内核。现在，从列表中选择你需要的内核并输入序号，然后按回车键，它将下载内核映像（linux-headers-4.4.10，linux-headers-4.4.10-xxx-generic　和 linux-image-4.4.10-xxx-generic）。

一旦内核镜像被下载，它将要求输入 `sudo` 密码来启动新内核的安装。

```
$ ./update_ubuntu_kernel.sh

[+] Checking Distro
 \_ Distro identified as LinuxMint.

[+] Checking Dependencies
	curl                    Found
	dkms                    Found
	git                     Found
	sudo                    Found
	wget                    Found
	whiptail                Found
	lynx                    Not Found

-- Installing Dependencies --

[!] The first time this script is run missing dependencies will be installed.
    For compiling a kernel this may take a bit of time. Feedback will be provided.

[+] Dependencies
 \_Elevating permissions as necessary . . .
[%] Elevated

[+] Testing for previous held packages and trying to correct any found.
 \_Passed

[+] Updating package cache . . .
 \_Complete

[+] Installing dependencies . . .
 \_Complete

	curl                    Found
	dkms                    Found
	git                     Found
	sudo                    Found
	wget                    Found
	whiptail                Found
	lynx                    Found

[+] Changing to temporary directory to work in . . .
 \_ Temporary directory access granted:	/tmp/tmp.97eHDsmg2K

[+] Removing any conflicting remnants . . .
 \_ Done

[+] Retrieving available kernel choices . . .
 \_ Precompiled kernels available from kernel.ubuntu.com:

 1)  Linux v4.11                2)  Linux v4.11.3              3)  Linux v4.11.2              4)  Linux v4.11.1             
 5)  Linux v4.10                6)  Linux v4.10.17             7)  Linux v4.10.16             8)  Linux v4.10.15            
 9)  Linux v4.10.14             10) Linux v4.10.13             11) Linux v4.10.12             12) Linux v4.10.11            
 13) Linux v4.10.10             14) Linux v4.10.9              15) Linux v4.10.8              16) Linux v4.10.7             
 17) Linux v4.10.6              18) Linux v4.10.5              19) Linux v4.10.4              20) Linux v4.10.3             
 21) Linux v4.10.2              22) Linux v4.10.1              23) Linux v4.9                 24) Linux v4.9.30             
 25) Linux v4.9.29              26) Linux v4.9.28              27) Linux v4.9.27              28) Linux v4.9.26             
 29) Linux v4.9.25              30) Linux v4.9.24              31) Linux v4.9.23              32) Linux v4.9.22             
 33) Linux v4.9.21              34) Linux v4.9.20              35) Linux v4.9.19              36) Linux v4.9.18             
 37) Linux v4.9.17              38) Linux v4.9.16              39) Linux v4.9.15              40) Linux v4.9.14             
 41) Linux v4.9.13              42) Linux v4.9.12              43) Linux v4.9.11              44) Linux v4.9.10             
 45) Linux v4.9.9               46) Linux v4.9.8               47) Linux v4.9.7               48) Linux v4.9.6              
 49) Linux v4.9.5               50) Linux v4.9.4               51) Linux v4.9.3               52) Linux v4.9.2              
 53) Linux v4.9.1               54) Linux v4.8                 55) Linux v4.8.17              56) Linux v4.8.16             
 57) Linux v4.8.15              58) Linux v4.8.14              59) Linux v4.8.13              60) Linux v4.8.12             
 61) Linux v4.8.11              62) Linux v4.8.10              63) Linux v4.8.9               64) Linux v4.8.8              
 65) Linux v4.8.7               66) Linux v4.8.6               67) Linux v4.8.5               68) Linux v4.8.4              
 69) Linux v4.8.3               70) Linux v4.8.2               71) Linux v4.8.1               72) Linux v4.7                
 73) Linux v4.7.10              74) Linux v4.7.9               75) Linux v4.7.8               76) Linux v4.7.7              
 77) Linux v4.7.6               78) Linux v4.7.5               79) Linux v4.7.4               80) Linux v4.7.3              
 81) Linux v4.7.2               82) Linux v4.7.1               83) Linux v4.6.7               84) Linux v4.6.6              
 85) Linux v4.6.5               86) Linux v4.6.4               87) Linux v4.6.3-yakkety       88) Linux v4.6.2-yakkety      
 89) Linux v4.6.1-yakkety       90) Linux v4.6-yakkety         91) Linux v4.5.7-yakkety       92) Linux v4.5.6-yakkety      
 93) Linux v4.5.5-yakkety       94) Linux v4.5.4-yakkety       95) Linux v4.5.3-wily          96) Linux v4.5.2-wily         
 97) Linux v4.5.1-wily          98) Linux v4.5-wily            99) Linux v4.4.70              100) Linux v4.4.69             
 101) Linux v4.4.68              102) Linux v4.4.67              103) Linux v4.4.66              104) Linux v4.4.65             
 105) Linux v4.4.64              106) Linux v4.4.63              107) Linux v4.4.62              108) Linux v4.4.61             
 109) Linux v4.4.60              110) Linux v4.4.59              111) Linux v4.4.58              112) Linux v4.4.57             
 113) Linux v4.4.56              114) Linux v4.4.55              115) Linux v4.4.54              116) Linux v4.4.53             
 117) Linux v4.4.52              118) Linux v4.4.51              119) Linux v4.4.50              120) Linux v4.4.49             
 121) Linux v4.4.48              122) Linux v4.4.47              123) Linux v4.4.46              124) Linux v4.4.45             
 125) Linux v4.4.44              126) Linux v4.4.43              127) Linux v4.4.42              128) Linux v4.4.41             
 129) Linux v4.4.40              130) Linux v4.4.39              131) Linux v4.4.38              132) Linux v4.4.37             
 133) Linux v4.4.36              134) Linux v4.4.35              135) Linux v4.4.34              136) Linux v4.4.33             
 137) Linux v4.4.32              138) Linux v4.4.31              139) Linux v4.4.30              140) Linux v4.4.29             
 141) Linux v4.4.28              142) Linux v4.4.27              143) Linux v4.4.26              144) Linux v4.4.25             
 145) Linux v4.4.24              146) Linux v4.4.23              147) Linux v4.4.22              148) Linux v4.4.21             
 149) Linux v4.4.20              150) Linux v4.4.19              151) Linux v4.4.17              152) Linux v4.4.16             
 153) Linux v4.4.15              154) Linux v4.4.14-xenial       155) Linux v4.4.13-xenial       156) Linux v4.4.12-xenial      
 157) Linux v4.4.11-xenial       158) Linux v4.4.10-xenial       159) Linux v4.4.9-xenial        160) Linux v4.4.8-wily         
 161) Linux v4.4.7-wily          162) Linux v4.4.6-wily          163) Linux v4.4.5-wily          164) Linux v4.4.4-wily         
 165) Linux v4.4.3-wily          166) Linux v4.4.2-wily          167) Linux v4.4.1-wily          168) Linux v4.4-wily           
 169) Linux v4.3.6-wily          170) Linux v4.3.5-wily          171) Linux v4.3.4-wily          172) Linux v4.3.3-wily         
 173) Linux v4.3.2-wily          174) Linux v4.3.1-wily          175) Linux v4.3-wily            176) Linux v4.3-unstable       
 177) Linux v4.2.8-wily          178) Linux v4.2.8-ckt13         179) Linux v4.2.8-ckt12-wily    180) Linux v4.2.8-ckt10-yakkety
 181) Linux v4.2.8-ckt9-wily     182) Linux v4.2.8-ckt8-wily     183) Linux v4.2.8-ckt7-wily     184) Linux v4.2.8-ckt6-wily    
 185) Linux v4.2.8-ckt5-wily     186) Linux v4.2.8-ckt4-wily     187) Linux v4.2.8-ckt3-wily     188) Linux v4.2.8-ckt2-wily    
 189) Linux v4.2.8-ckt1-wily     190) Linux v4.2.7-wily          191) Linux v4.2.6-wily          192) Linux v4.2.5-wily         
 193) Linux v4.2.4-wily          194) Linux v4.2.4-unstable      195) Linux v4.2.3-unstable      196) Linux v4.2.2-unstable     
 197) Linux v4.2.1-unstable      198) Linux v4.2-wily            199) Linux v4.2-unstable        200) Linux v4.1.40             
 201) Linux v4.1.39              202) Linux v4.1.38              203) Linux v4.1.37              204) Linux v4.1.36             
 205) Linux v4.1.35              206) Linux v4.1.34              207) Linux v4.1.33              208) Linux v4.1.32             
 209) Linux v4.1.31              210) Linux v4.1.30              211) Linux v4.1.29              212) Linux v4.1.28             
 213) Linux v4.1.27-wily         214) Linux v4.1.26-wily         215) Linux v4.1.25-wily         216) Linux v4.1.24-wily        
 217) Linux v4.1.23-wily         218) Linux v4.1.22-wily         219) Linux v4.1.21-wily         220) Linux v4.1.20-wily        
 221) Linux v4.1.19-wily         222) Linux v4.1.18-wily         223) Linux v4.1.17-wily         224) Linux v4.1.16-wily        
 225) Linux v4.1.15-wily         226) Linux v4.1.14-wily         227) Linux v4.1.13-wily         228) Linux v4.1.12-wily        
 229) Linux v4.1.11-wily         230) Linux v4.1.11-unstable     231) Linux v4.1.10-unstable     232) Linux v4.1.9-unstable     
 233) Linux v4.1.8-unstable      234) Linux v4.1.7-unstable      235) Linux v4.1.6-unstable      236) Linux v4.1.5-unstable     
 237) Linux v4.1.4-unstable      238) Linux v4.1.3-unstable      239) Linux v4.1.2-unstable      240) Linux v4.1.1-unstable     
 241) Linux v4.1-wily            242) Linux v4.1-unstable        243) Linux v4.0.9-wily          244) Linux v4.0.8-wily         
 245) Linux v4.0.7-wily          246) Linux v4.0.6-wily          247) Linux v4.0.5-wily          248) Linux v4.0.4-wily         
 249) Linux v4.0.3-wily          250) Linux v4.0.2-wily          251) Linux v4.0.1-wily          252) Linux v4.0-vivid          

Select your desired kernel: 158

Do you want the lowlatency kernel? (y/[n]):

[+] Processing selection
 \_ Determining CPU type: amd64
 \_ Locating source of v4.4.10-xenial generic kernel packages.
 \_ Done

[+] Checking AntiVirus flag and disabling if necessary
[+] Installing kernel . . .
[sudo] password for magi:
Selecting previously unselected package linux-headers-4.4.10-040410.
(Reading database ... 230647 files and directories currently installed.)
Preparing to unpack linux-headers-4.4.10-040410_4.4.10-040410.201605110631_all.deb ...
Unpacking linux-headers-4.4.10-040410 (4.4.10-040410.201605110631) ...
Selecting previously unselected package linux-headers-4.4.10-040410-generic.
Preparing to unpack linux-headers-4.4.10-040410-generic_4.4.10-040410.201605110631_amd64.deb ...
Unpacking linux-headers-4.4.10-040410-generic (4.4.10-040410.201605110631) ...
Selecting previously unselected package linux-image-4.4.10-040410-generic.
Preparing to unpack linux-image-4.4.10-040410-generic_4.4.10-040410.201605110631_amd64.deb ...
Done.
Unpacking linux-image-4.4.10-040410-generic (4.4.10-040410.201605110631) ...
Setting up linux-headers-4.4.10-040410 (4.4.10-040410.201605110631) ...
Setting up linux-headers-4.4.10-040410-generic (4.4.10-040410.201605110631) ...
Examining /etc/kernel/header_postinst.d.
run-parts: executing /etc/kernel/header_postinst.d/dkms 4.4.10-040410-generic /boot/vmlinuz-4.4.10-040410-generic
Setting up linux-image-4.4.10-040410-generic (4.4.10-040410.201605110631) ...
Running depmod.
update-initramfs: deferring update (hook will be called later)
Examining /etc/kernel/postinst.d.
run-parts: executing /etc/kernel/postinst.d/apt-auto-removal 4.4.10-040410-generic /boot/vmlinuz-4.4.10-040410-generic
run-parts: executing /etc/kernel/postinst.d/dkms 4.4.10-040410-generic /boot/vmlinuz-4.4.10-040410-generic
run-parts: executing /etc/kernel/postinst.d/initramfs-tools 4.4.10-040410-generic /boot/vmlinuz-4.4.10-040410-generic
update-initramfs: Generating /boot/initrd.img-4.4.10-040410-generic
Warning: No support for locale: en_IN
run-parts: executing /etc/kernel/postinst.d/pm-utils 4.4.10-040410-generic /boot/vmlinuz-4.4.10-040410-generic
run-parts: executing /etc/kernel/postinst.d/unattended-upgrades 4.4.10-040410-generic /boot/vmlinuz-4.4.10-040410-generic
run-parts: executing /etc/kernel/postinst.d/zz-update-grub 4.4.10-040410-generic /boot/vmlinuz-4.4.10-040410-generic
Generating grub configuration file ...
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.4.10-040410-generic
Found initrd image: /boot/initrd.img-4.4.10-040410-generic
Found linux image: /boot/vmlinuz-4.4.9-040409-lowlatency
Found initrd image: /boot/initrd.img-4.4.9-040409-lowlatency
Found linux image: /boot/vmlinuz-4.4.0-21-generic
Found initrd image: /boot/initrd.img-4.4.0-21-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
done
 \_ Done
```

安装后需要重新启动以使用新安装的内核。

```
$ sudo reboot now
```

现在，你正在使用的就是新安装的 4.4.10-040410-generic 版本内核。

```
$ uname -a
Linux magi-VirtualBox 4.4.10-040410-generic #201605110631 SMP Wed May 11 10:33:23 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```

### 安装最新版本内核

过程与上述相同，它将自动安装最新版本的内核。

```
$ ./update_ubuntu_kernel.sh --latest

[+] Checking Distro
 \_ Distro identified as LinuxMint.

[+] Checking Dependencies
	curl                    Found
	dkms                    Found
	git                     Found
	sudo                    Found
	wget                    Found
	whiptail                Found
	lynx                    Found

[+] Changing to temporary directory to work in . . .
 \_ Temporary directory access granted:	/tmp/tmp.pLPYmCze6S

[+] Removing any conflicting remnants . . .
 \_ Done

[+] Retrieving available kernel choices . . .
 \_ Precompiled kernels available from kernel.ubuntu.com:
.
.
.
.
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.11.3-041103-generic
Found initrd image: /boot/initrd.img-4.11.3-041103-generic
Found linux image: /boot/vmlinuz-4.4.10-040410-generic
Found initrd image: /boot/initrd.img-4.4.10-040410-generic
Found linux image: /boot/vmlinuz-4.4.9-040409-lowlatency
Found initrd image: /boot/initrd.img-4.4.9-040409-lowlatency
Found linux image: /boot/vmlinuz-4.4.0-21-generic
Found initrd image: /boot/initrd.img-4.4.0-21-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
done
 \_ Done
```

安装后需要重新启动以使用新安装的内核。

```
$ sudo reboot now
```

现在，你正在使用的就是最新版本 4.11.3-041103-generic 的内核。

```
$ uname -a
Linux magi-VirtualBox 4.11.3-041103-generic #201705251233 SMP Thu May 25 16:34:52 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
```

### 删除或清除旧内核

只需要运行 `remove_old_kernels.sh` shell 脚本即可删除或清除所有非活动状态的内核。

```
$ ./remove_old_kernels.sh

		++++++++++++++++++++++++++++++++
		+++       W A R N I N G      +++
		++++++++++++++++++++++++++++++++

A reboot is recommended before running this script to ensure the current kernel tagged
as the boot kernel is indeed registered and old kernels properly marked for removal.
If you have just installed or modified your existing kernel and do not reboot before
running this script it may render you system INOPERABLE and that would indeed suck.

You have been warned.
~the Mgmt

[?]Continue to automagically remove ALL old kernels? (y/N)y
\_ Removing ALL old kernels . . .
[sudo] password for magi:
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  linux-headers-4.4.0-21* linux-headers-4.4.0-21-generic* linux-headers-4.4.10-040410*
  linux-headers-4.4.10-040410-generic* linux-headers-4.4.9-040409* linux-headers-4.4.9-040409-lowlatency*
  linux-image-4.4.0-21-generic* linux-image-4.4.10-040410-generic* linux-image-4.4.9-040409-lowlatency*
  linux-image-extra-4.4.0-21-generic* linux-kernel-generic*
0 upgraded, 0 newly installed, 11 to remove and 547 not upgraded.
After this operation, 864 MB disk space will be freed.
(Reading database ... 296860 files and directories currently installed.)
Removing linux-kernel-generic (4.4.0-21) ...
Removing linux-headers-4.4.0-21-generic (4.4.0-21.37) ...
Removing linux-headers-4.4.0-21 (4.4.0-21.37) ...
Removing linux-headers-4.4.10-040410-generic (4.4.10-040410.201605110631) ...
Removing linux-headers-4.4.10-040410 (4.4.10-040410.201605110631) ...
Removing linux-headers-4.4.9-040409-lowlatency (4.4.9-040409.201605041832) ...
Removing linux-headers-4.4.9-040409 (4.4.9-040409.201605041832) ...
Removing linux-image-extra-4.4.0-21-generic (4.4.0-21.37) ...
.
.
.
done
Purging configuration files for linux-image-4.4.9-040409-lowlatency (4.4.9-040409.201605041832) ...
Examining /etc/kernel/postrm.d .
run-parts: executing /etc/kernel/postrm.d/initramfs-tools 4.4.9-040409-lowlatency /boot/vmlinuz-4.4.9-040409-lowlatency
run-parts: executing /etc/kernel/postrm.d/zz-update-grub 4.4.9-040409-lowlatency /boot/vmlinuz-4.4.9-040409-lowlatency
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/lku-linux-kernel-utilities-compile-install-update-latest-kernel-in-linux-mint-ubuntu/

作者：[2DAYGEEK][a]
译者：[firmianay](https://github.com/firmianay)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/author/2daygeek/
[2]:https://github.com/mtompkins/linux-kernel-utilities
[3]:http://www.2daygeek.com/ukuu-install-upgrade-linux-kernel-in-linux-mint-ubuntu-debian-elementary-os/
