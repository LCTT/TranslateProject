[#]: subject: (Perform Linux memory forensics with this open source tool)
[#]: via: (https://opensource.com/article/21/4/linux-memory-forensics)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13425-1.html)

使用开源工具进行 Linux 内存取证
======

> 利用 Volatility 找出应用程序、网络连接、内核模块、文件等方面的情况。

![](https://img.linux.net.cn/data/attachment/album/202105/26/111959fzkhzf7q3qwmhh7z.jpg)

计算机的操作系统和应用使用主内存（RAM）来执行不同的任务。这种易失性内存包含大量关于运行应用、网络连接、内核模块、打开的文件以及几乎所有其他的内容信息，但这些信息每次计算机重启的时候都会被清除。

<ruby>内存取证<rt>Memory forensics</rt></ruby>是一种从内存中找到和抽取这些有价值的信息的方式。[Volatility][2] 是一种使用插件来处理这类信息的开源工具。但是，存在一个问题：在你处理这些信息前，必须将物理内存转储到一个文件中，而 Volatility 没有这种能力。

因此，这篇文章分为两部分：

  * 第一部分是处理获取物理内存并将其转储到一个文件中。
  * 第二部分使用 Volatility 从这个内存转储中读取并处理这些信息。

我在本教程中使用了以下测试系统，不过它可以在任何 Linux 发行版上工作：

```
$ cat /etc/redhat-release
Red Hat Enterprise Linux release 8.3 (Ootpa)
$
$ uname -r
4.18.0-240.el8.x86_64
$
```

> **注意事项：** 部分 1 涉及到编译和加载一个内核模块。不要担心：它并不像听起来那么困难。
> 
> 一些指南：
>
>   * 按照以下的步骤。
>   * 不要在生产系统或你的主要计算机上尝试任何这些步骤。
>   * 始终使用测试的虚拟机（VM）来尝试，直到你熟悉使用这些工具并理解它们的工作原理为止。

### 安装需要的包

在开始之前安装必要的工具。如果你经常使用基于 Debian 的发行版，可以使用 `apt-get` 命令。这些包大多数提供了需要的内核信息和工具来编译代码：

```
$ yum install kernel-headers kernel-devel gcc elfutils-libelf-devel make git libdwarf-tools python2-devel.x86_64-y
```

### 部分 1：使用 LiME 获取内存并将其转储到一个文件中

在开始分析内存之前，你需要一个内存转储供你使用。在实际的取证活动中，这可能来自一个被破坏或者被入侵的系统。这些信息通常会被收集和存储来分析入侵是如何发生的及其影响。由于你可能没有可用的内存转储，你可以获取你的测试 VM 的内存转储，并使用它来执行内存取证。

<ruby>Linux 内存提取器<rt>Linux Memory Extractor</rt></ruby>（[LiME][3]）是一个在 Linux 系统上获取内存很常用的工具。使用以下命令获得 LiME：

```
$ git clone https://github.com/504ensicsLabs/LiME.git
$
$ cd LiME/src/
$
$ ls
deflate.c  disk.c  hash.c  lime.h  main.c  Makefile  Makefile.sample  tcp.c
$
```

#### 构建 LiME 内核模块

在 `src` 文件夹下运行 `make` 命令。这会创建一个以 .ko 为扩展名的内核模块。理想情况下，在 `make` 结束时，`lime.ko` 文件会使用格式 `lime-<your-kernel-version>.ko` 被重命名。

```
$ make
make -C /lib/modules/4.18.0-240.el8.x86_64/build M="/root/LiME/src" modules
make[1]: Entering directory '/usr/src/kernels/4.18.0-240.el8.x86_64'

<< 删节 >>

make[1]: Leaving directory '/usr/src/kernels/4.18.0-240.el8.x86_64'
strip --strip-unneeded lime.ko
mv lime.ko lime-4.18.0-240.el8.x86_64.ko
$
$
$ ls -l lime-4.18.0-240.el8.x86_64.ko
-rw-r--r--. 1 root root 25696 Apr 17 14:45 lime-4.18.0-240.el8.x86_64.ko
$
$ file lime-4.18.0-240.el8.x86_64.ko
lime-4.18.0-240.el8.x86_64.ko: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), BuildID[sha1]=1d0b5cf932389000d960a7e6b57c428b8e46c9cf, not stripped
$
```

#### 加载LiME 内核模块

现在是时候加载内核模块来获取系统内存了。`insmod` 命令会帮助加载内核模块；模块一旦被加载，会在你的系统上读取主内存（RAM）并且将内存的内容转储到命令行所提供的 `path` 目录下的文件中。另一个重要的参数是 `format`；保持 `lime` 的格式，如下所示。在插入内核模块之后，使用 `lsmod` 命令验证它是否真的被加载。

```
$ lsmod  | grep lime
$
$ insmod ./lime-4.18.0-240.el8.x86_64.ko "path=../RHEL8.3_64bit.mem format=lime"
$
$ lsmod  | grep lime
lime                   16384  0
$
```

你应该看到给 `path` 命令的文件已经创建好了，而且文件大小与你系统的物理内存（RAM）大小相同（并不奇怪）。一旦你有了内存转储，你就可以使用 `rmmod` 命令删除该内核模块：

```
$
$ ls -l ~/LiME/RHEL8.3_64bit.mem
-r--r--r--. 1 root root 4294544480 Apr 17 14:47 /root/LiME/RHEL8.3_64bit.mem
$
$ du -sh ~/LiME/RHEL8.3_64bit.mem
4.0G    /root/LiME/RHEL8.3_64bit.mem
$
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           3736         220         366           8        3149        3259
Swap:          4059           8        4051
$
$ rmmod lime
$
$ lsmod  | grep lime
$
```

#### 内存转储中是什么？

这个内存转储文件只是原始数据，就像使用 `file` 命令可以看到的一样。你不可能通过手动去理解它；是的，在这里边有一些 ASCII 字符，但是你无法用编辑器打开这个文件并把它读出来。`hexdump` 的输出显示，最初的几个字节是 `EmiL`；这是因为你的请求格式在上面的命令行中是 `lime`：

```
$ file ~/LiME/RHEL8.3_64bit.mem
/root/LiME/RHEL8.3_64bit.mem: data
$

$ hexdump -C ~/LiME/RHEL8.3_64bit.mem | head
00000000  45 4d 69 4c 01 00 00 00  00 10 00 00 00 00 00 00  |EMiL............|
00000010  ff fb 09 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000020  b8 fe 4c cd 21 44 00 32  20 00 00 2a 2a 2a 2a 2a  |..L.!D.2 ..*****|
00000030  2a 2a 2a 2a 2a 2a 2a 2a  2a 2a 2a 2a 2a 2a 2a 2a  |****************|
00000040  2a 2a 2a 2a 2a 2a 2a 2a  2a 2a 2a 2a 2a 20 00 20  |************* . |
00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000080  00 00 00 00 00 00 00 00  00 00 00 00 70 78 65 6c  |............pxel|
00000090  69 6e 75 78 2e 30 00 00  00 00 00 00 00 00 00 00  |inux.0..........|
000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
$
```

### 部分 2：获得 Volatility 并使用它来分析你的内存转储

现在你有了要分析的示例内存转储，使用下面的命令获取 Volatility 软件。Volatility 已经用 Python 3 重写了，但是本教程使用的是用 Python 2 写的原始的 Volatility 包。如果你想用 Volatility 3 进行实验，可以从合适的 Git 仓库下载它，并在以下命令中使用 Python 3 而不是 Python 2：

```
$ git clone https://github.com/volatilityfoundation/volatility.git
$
$ cd volatility/
$
$ ls
AUTHORS.txt    contrib      LEGAL.txt    Makefile     PKG-INFO     pyinstaller.spec  resources  tools       vol.py
CHANGELOG.txt  CREDITS.txt  LICENSE.txt  MANIFEST.in  pyinstaller  README.txt        setup.py   volatility
$
```

Volatility 使用两个 Python 库来实现某些功能，所以使用以下命令来安装它们。否则，在你运行 Volatility 工具时，你可能看到一些导入错误；你可以忽略它们，除非你正在运行的插件需要这些库；这种情况下，工具将会报错：

```
$ pip2 install pycrypto
$ pip2 install distorm3
```

#### 列出 Volatility 的 Linux 配置文件

你将要运行的第一个 Volatility 命令列出了可用的 Linux 配置文件，运行 Volatility 命令的主要入口点是 `vol.py` 脚本。使用 Python 2 解释器调用它并提供 `--info` 选项。为了缩小输出，查找以 Linux 开头的字符串。正如你所看到的，并没有很多 Linux 配置文件被列出：

```
$ python2 vol.py --info  | grep ^Linux
Volatility Foundation Volatility Framework 2.6.1
LinuxAMD64PagedMemory          - Linux-specific AMD 64-bit address space.
$
```

#### 构建你自己的 Linux 配置文件

Linux 发行版是多种多样的，并且是为不同架构而构建的。这就是为什么配置文件是必要的 —— Volatility 在提取信息前必须知道内存转储是从哪个系统和架构获得的。有一些 Volatility 命令可以找到这些信息；但是这个方法很费时。为了加快速度，可以使用以下命令构建一个自定义的 Linux 配置文件：

移动到 Volatility 仓库的 `tools/linux`目录下，运行 `make` 命令：

```
$ cd tools/linux/
$
$ pwd
/root/volatility/tools/linux
$
$ ls
kcore  Makefile  Makefile.enterprise  module.c
$
$ make
make -C //lib/modules/4.18.0-240.el8.x86_64/build CONFIG_DEBUG_INFO=y M="/root/volatility/tools/linux" modules
make[1]: Entering directory '/usr/src/kernels/4.18.0-240.el8.x86_64'
<< 删节 >>
make[1]: Leaving directory '/usr/src/kernels/4.18.0-240.el8.x86_64'
$
```

你应该看到一个新的 `module.dwarf` 文件。你也需要 `/boot` 目录下的 `System.map` 文件，因为它包含了所有与当前运行的内核相关的符号：

```
$ ls
kcore  Makefile  Makefile.enterprise  module.c  module.dwarf
$
$ ls -l module.dwarf
-rw-r--r--. 1 root root 3987904 Apr 17 15:17 module.dwarf
$
$ ls -l /boot/System.map-4.18.0-240.el8.x86_64
-rw-------. 1 root root 4032815 Sep 23  2020 /boot/System.map-4.18.0-240.el8.x86_64
$
$
```

要创建一个自定义配置文件，移动回到 Volatility 目录并且运行下面的命令。第一个参数提供了一个自定义 .zip 文件，文件名是你自己命名的。我经常使用操作系统和内核版本来命名。下一个参数是前边创建的 `module.dwarf` 文件，最后一个参数是 `/boot` 目录下的 `System.map` 文件：

```
$
$ cd volatility/
$
$ zip volatility/plugins/overlays/linux/Redhat8.3_4.18.0-240.zip tools/linux/module.dwarf /boot/System.map-4.18.0-240.el8.x86_64
  adding: tools/linux/module.dwarf (deflated 91%)
  adding: boot/System.map-4.18.0-240.el8.x86_64 (deflated 79%)
$
```

现在自定义配置文件就准备好了，所以在前边给出的位置检查一下 .zip 文件是否被创建好。如果你想知道 Volatility 是否检测到这个自定义配置文件，再一次运行 `--info` 命令。现在，你应该可以在下边的列出的内容中看到新的配置文件：

```
$
$ ls -l volatility/plugins/overlays/linux/Redhat8.3_4.18.0-240.zip
-rw-r--r--. 1 root root 1190360 Apr 17 15:20 volatility/plugins/overlays/linux/Redhat8.3_4.18.0-240.zip
$
$
$ python2 vol.py --info  | grep Redhat
Volatility Foundation Volatility Framework 2.6.1
LinuxRedhat8_3_4_18_0-240x64 - A Profile for Linux Redhat8.3_4.18.0-240 x64
$
$
```

#### 开始使用 Volatility

现在你已经准备好去做一些真正的内存取证了。记住，Volatility 是由自定义的插件组成的，你可以针对内存转储来获得信息。命令的通用格式是：

```
python2 vol.py -f <memory-dump-file-taken-by-Lime> <plugin-name> --profile=<name-of-our-custom-profile>
```

有了这些信息，运行 `linux_banner` 插件来看看你是否可从内存转储中识别正确的发行版信息：

```
$ python2 vol.py -f ~/LiME/RHEL8.3_64bit.mem linux_banner --profile=LinuxRedhat8_3_4_18_0-240x64
Volatility Foundation Volatility Framework 2.6.1
Linux version 4.18.0-240.el8.x86_64 ([mockbuild@vm09.test.com][4]) (gcc version 8.3.1 20191121 (Red Hat 8.3.1-5) (GCC)) #1 SMP Wed Sep 23 05:13:10 EDT 2020
$
```

#### 找到 Linux 插件

到现在都很顺利，所以现在你可能对如何找到所有 Linux 插件的名字比较好奇。有一个简单的技巧：运行 `--info` 命令并抓取 `linux_` 字符串。有各种各样的插件可用于不同的用途。这里列出一部分：

```
$ python2 vol.py --info  | grep linux_
Volatility Foundation Volatility Framework 2.6.1
linux_apihooks             - Checks for userland apihooks
linux_arp                  - Print the ARP table
linux_aslr_shift           - Automatically detect the Linux ASLR shift

<< 删节 >>

linux_banner               - Prints the Linux banner information
linux_vma_cache            - Gather VMAs from the vm_area_struct cache
linux_volshell             - Shell in the memory image
linux_yarascan             - A shell in the Linux memory image
$
```

使用 `linux_psaux` 插件检查内存转储时系统上正在运行哪些进程。注意列表中的最后一个命令：它是你在转储之前运行的 `insmod` 命令。

```
$ python2 vol.py -f ~/LiME/RHEL8.3_64bit.mem linux_psaux --profile=LinuxRedhat8_3_4_18_0-240x64
Volatility Foundation Volatility Framework 2.6.1
Pid    Uid    Gid    Arguments                                                      
1      0      0      /usr/lib/systemd/systemd --switched-root --system --deserialize 18
2      0      0      [kthreadd]                                                      
3      0      0      [rcu_gp]                                                        
4      0      0      [rcu_par_gp]                                                    
861    0      0      /usr/libexec/platform-python -Es /usr/sbin/tuned -l -P          
869    0      0      /usr/bin/rhsmcertd                                              
875    0      0      /usr/libexec/sssd/sssd_be --domain implicit_files --uid 0 --gid 0 --logger=files
878    0      0      /usr/libexec/sssd/sssd_nss --uid 0 --gid 0 --logger=files      

<< 删节 >>

11064  89     89     qmgr -l -t unix -u                                              
227148 0      0      [kworker/0:0]                                                  
227298 0      0      -bash                                                          
227374 0      0      [kworker/u2:1]                                                  
227375 0      0      [kworker/0:2]                                                  
227884 0      0      [kworker/0:3]                                                  
228573 0      0      insmod ./lime-4.18.0-240.el8.x86_64.ko path=../RHEL8.3_64bit.mem format=lime
228576 0      0                                                                      
$
```

想要知道系统的网络状态吗？运行 `linux_netstat` 插件来找到在内存转储期间网络连接的状态：

```
$ python2 vol.py -f ~/LiME/RHEL8.3_64bit.mem linux_netstat --profile=LinuxRedhat8_3_4_18_0-240x64
Volatility Foundation Volatility Framework 2.6.1
UNIX 18113              systemd/1     /run/systemd/private
UNIX 11411              systemd/1     /run/systemd/notify
UNIX 11413              systemd/1     /run/systemd/cgroups-agent
UNIX 11415              systemd/1    
UNIX 11416              systemd/1    

<< 删节 >>
$
```

接下来，使用 `linux_mount` 插件来看在内存转储期间哪些文件系统被挂载：

```
$ python2 vol.py -f ~/LiME/RHEL8.3_64bit.mem linux_mount --profile=LinuxRedhat8_3_4_18_0-240x64
Volatility Foundation Volatility Framework 2.6.1
tmpfs                     /sys/fs/cgroup                      tmpfs        ro,nosuid,nodev,noexec                  
cgroup                    /sys/fs/cgroup/pids                 cgroup       rw,relatime,nosuid,nodev,noexec        
systemd-1                 /proc/sys/fs/binfmt_misc            autofs       rw,relatime                            
sunrpc                    /var/lib/nfs/rpc_pipefs             rpc_pipefs   rw,relatime                            
/dev/mapper/rhel_kvm--03--guest11-root /                                   xfs          rw,relatime                
tmpfs                     /dev/shm                            tmpfs        rw,nosuid,nodev                        
selinuxfs                 /sys/fs/selinux                     selinuxfs    rw,relatime
                                                      
<< 删节 >>

cgroup                    /sys/fs/cgroup/net_cls,net_prio     cgroup       rw,relatime,nosuid,nodev,noexec        
cgroup                    /sys/fs/cgroup/cpu,cpuacct          cgroup       rw,relatime,nosuid,nodev,noexec        
bpf                       /sys/fs/bpf                         bpf          rw,relatime,nosuid,nodev,noexec        
cgroup                    /sys/fs/cgroup/memory               cgroup       ro,relatime,nosuid,nodev,noexec        
cgroup                    /sys/fs/cgroup/cpuset               cgroup       rw,relatime,nosuid,nodev,noexec        
mqueue                    /dev/mqueue                         mqueue       rw,relatime                            
$
```

好奇哪些内核模块被加载了吗？Volatility 也为这个提供了一个插件 `linux_lsmod`：

```
$ python2 vol.py -f ~/LiME/RHEL8.3_64bit.mem linux_lsmod --profile=LinuxRedhat8_3_4_18_0-240x64
Volatility Foundation Volatility Framework 2.6.1
ffffffffc0535040 lime 20480
ffffffffc0530540 binfmt_misc 20480
ffffffffc05e8040 sunrpc 479232
<< 删节 >>
ffffffffc04f9540 nfit 65536
ffffffffc0266280 dm_mirror 28672
ffffffffc025e040 dm_region_hash 20480
ffffffffc0258180 dm_log 20480
ffffffffc024bbc0 dm_mod 151552
$
```

想知道哪些文件被哪些进程打开了吗？使用 `linux_bash` 插件可以列出这些信息：

```
$ python2 vol.py -f ~/LiME/RHEL8.3_64bit.mem linux_bash --profile=LinuxRedhat8_3_4_18_0-240x64 -v
Volatility Foundation Volatility Framework 2.6.1
Pid      Name                 Command Time                   Command
-------- -------------------- ------------------------------ -------
  227221 bash                 2021-04-17 18:38:24 UTC+0000   lsmod
  227221 bash                 2021-04-17 18:38:24 UTC+0000   rm -f .log
  227221 bash                 2021-04-17 18:38:24 UTC+0000   ls -l /etc/zzz
  227221 bash                 2021-04-17 18:38:24 UTC+0000   cat ~/.vimrc
  227221 bash                 2021-04-17 18:38:24 UTC+0000   ls
  227221 bash                 2021-04-17 18:38:24 UTC+0000   cat /proc/817/cwd
  227221 bash                 2021-04-17 18:38:24 UTC+0000   ls -l /proc/817/cwd
  227221 bash                 2021-04-17 18:38:24 UTC+0000   ls /proc/817/
<< 删节 >>
  227298 bash                 2021-04-17 18:40:30 UTC+0000   gcc prt.c
  227298 bash                 2021-04-17 18:40:30 UTC+0000   ls
  227298 bash                 2021-04-17 18:40:30 UTC+0000   ./a.out
  227298 bash                 2021-04-17 18:40:30 UTC+0000   vim prt.c
  227298 bash                 2021-04-17 18:40:30 UTC+0000   gcc prt.c
  227298 bash                 2021-04-17 18:40:30 UTC+0000   ./a.out
  227298 bash                 2021-04-17 18:40:30 UTC+0000   ls
$
```

想知道哪些文件被哪些进程打开了吗？使用 `linux_lsof` 插件可以列出这些信息：

```
$ python2 vol.py -f ~/LiME/RHEL8.3_64bit.mem linux_lsof --profile=LinuxRedhat8_3_4_18_0-240x64
Volatility Foundation Volatility Framework 2.6.1
Offset             Name                           Pid      FD       Path
------------------ ------------------------------ -------- -------- ----
0xffff9c83fb1e9f40 rsyslogd                          71194        0 /dev/null
0xffff9c83fb1e9f40 rsyslogd                          71194        1 /dev/null
0xffff9c83fb1e9f40 rsyslogd                          71194        2 /dev/null
0xffff9c83fb1e9f40 rsyslogd                          71194        3 /dev/urandom
0xffff9c83fb1e9f40 rsyslogd                          71194        4 socket:[83565]
0xffff9c83fb1e9f40 rsyslogd                          71194        5 /var/log/messages
0xffff9c83fb1e9f40 rsyslogd                          71194        6 anon_inode:[9063]
0xffff9c83fb1e9f40 rsyslogd                          71194        7 /var/log/secure

<< 删节 >>

0xffff9c8365761f40 insmod                           228573        0 /dev/pts/0
0xffff9c8365761f40 insmod                           228573        1 /dev/pts/0
0xffff9c8365761f40 insmod                           228573        2 /dev/pts/0
0xffff9c8365761f40 insmod                           228573        3 /root/LiME/src/lime-4.18.0-240.el8.x86_64.ko
$
```

#### 访问 Linux 插件脚本位置

通过读取内存转储和处理这些信息，你可以获得更多的信息。如果你会 Python，并且好奇这些信息是如何被处理的，可以到存储所有插件的目录，选择一个你感兴趣的，并看看 Volatility 是如何获得这些信息的：

```
$ ls volatility/plugins/linux/
apihooks.py              common.py            kernel_opened_files.py   malfind.py          psaux.py
apihooks.pyc             common.pyc           kernel_opened_files.pyc  malfind.pyc         psaux.pyc
arp.py                   cpuinfo.py           keyboard_notifiers.py    mount_cache.py      psenv.py
arp.pyc                  cpuinfo.pyc          keyboard_notifiers.pyc   mount_cache.pyc     psenv.pyc
aslr_shift.py            dentry_cache.py      ld_env.py                mount.py            pslist_cache.py
aslr_shift.pyc           dentry_cache.pyc     ld_env.pyc               mount.pyc           pslist_cache.pyc
<< 删节 >>
check_syscall_arm.py     __init__.py          lsmod.py                 proc_maps.py        tty_check.py
check_syscall_arm.pyc    __init__.pyc         lsmod.pyc                proc_maps.pyc       tty_check.pyc
check_syscall.py         iomem.py             lsof.py                  proc_maps_rb.py     vma_cache.py
check_syscall.pyc        iomem.pyc            lsof.pyc                 proc_maps_rb.pyc    vma_cache.pyc
$
$
```

我喜欢 Volatility 的理由是他提供了许多安全插件。这些信息很难手动获取：

```
linux_hidden_modules       - Carves memory to find hidden kernel modules
linux_malfind              - Looks for suspicious process mappings
linux_truecrypt_passphrase - Recovers cached Truecrypt passphrases
```

Volatility 也允许你在内存转储中打开一个 shell，所以你可以运行 shell 命令来代替上面所有命令，并获得相同的信息：

```
$ python2 vol.py -f ~/LiME/RHEL8.3_64bit.mem linux_volshell --profile=LinuxRedhat8_3_4_18_0-240x64 -v
Volatility Foundation Volatility Framework 2.6.1
Current context: process systemd, pid=1 DTB=0x1042dc000
Welcome to volshell! Current memory image is:
file:///root/LiME/RHEL8.3_64bit.mem
To get help, type 'hh()'
>>>
>>> sc()
Current context: process systemd, pid=1 DTB=0x1042dc000
>>>
```

### 接下来的步骤

内存转储是了解 Linux 内部情况的好方法。试一试 Volatility 的所有插件，并详细研究它们的输出。然后思考这些信息如何能够帮助你识别入侵或安全问题。深入了解这些插件的工作原理，甚至尝试改进它们。如果你没有找到你想做的事情的插件，那就写一个并提交给 Volatility，这样其他人也可以使用它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-memory-forensics

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[RiaXu](https://github.com/ShuyRoy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_computer_solve_fix_tool.png?itok=okq8joti (Brain on a computer screen)
[2]: https://github.com/volatilityfoundation/volatility
[3]: https://github.com/504ensicsLabs/LiME
[4]: mailto:mockbuild@vm09.test.com
