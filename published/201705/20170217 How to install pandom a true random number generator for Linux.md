如何安装 pandom ： 一个针对 Linux 的真随机数生成器
============================================================

本教程只针对 amd64/x86_64 架构 Linux 内核版本大于等于 2.6.9 的系统。本文将解释如何安装 [pandom][46]，这是一个由 ncomputers.org 维护的定时抖动真随机数生成器。

### 简介

在现在的计算机状况下，比如说配置了固态硬盘（SSD）的个人电脑和虚拟专用服务器（VPS）的环境中，Linux 内核内置的真随机数发生器提供的吞吐量很低。

而出于各种不同的加密目的使得对真随机数的需求持续增长，从而使得这个低吞吐量问题在 Linux 实现中变得越来越严重。

在与上述相同的物理或者虚拟环境下，并假设没有其它进程以 root 身份向 `/dev/random` 进行写操作的话，64 [ubits][47]/64 bits 的 pandom 可以以 8 KiB/s 的速率生成随机数。

### 1 pandom 的安装

#### 1.1 获得 root 权限

Pandom 必须以 root 身份来安装，所以在必要的时候请运行如下命令：

```
su -
```

#### 1.2 安装编译所需的依赖

为了下载并安装 pandom，你需要 GNU `as` 汇编器、GNU `make`、GNU `tar` 和 GNU `wget` (最后两个工具通常已被安装)。随后你可以按照你的意愿卸载它们。

**基于 Arch 的系统：**

```
pacman -S binutils make
```

**基于 Debian 的系统：**

```
apt-get install binutils make
```

基于 Red Hat 的系统：

```
dnf install binutils make
yum install binutils make
```

**基于 SUSE 的系统：**

```
zypper install binutils make
```

#### 1.3 下载并析出源码

下面的命令将使用 `wget` 和 `tar` 从 ncomputers.org 下载 pandom 的源代码并将它们解压出来：

```
wget http://ncomputers.org/pandom.tar.gz
tar xf pandom.tar.gz
cd pandom/amd64-linux
```

#### 1.4 在安装前进行测试 (推荐)

这个被推荐的测试将花费大约 8 分钟的时间，它将检查内核支持情况并生成一个名为 `checkme` 的文件（在下一节中将被分析）。

```
make check
```
#### 1.5 确定系统的初始化程序

在安装 pandom 之前，你需要知道你的系统使用的是哪个初始化程序。假如下面命令的输出中包含 `running`，则意味着你的系统使用了 `systemd`，否则你的系统则可能使用了一个 `init.d` 的实现（例如 upstart、sysvinit）。

```
systemctl is-system-running
running
```

#### 1.6 安装 pandom

一旦你知道了你的系统使用何种 Linux 实现，那么你就可以相应地安装 pandom 了。

**使用基于 init.d 作为初始化程序（如： upstart、sysvinit）的系统：**

假如你的系统使用了一个 init.d 的实现（如： upstart、sysvinit），请运行下面的命令来安装 pandom：

```
make install-init.d
```

**以 systemd 作为初始化程序的系统：**

假如你的系统使用 `systemd`，则请运行以下命令来安装 pandom：

```
make install-systemd
```

### 2 checkme 文件的分析

在使用 pandom 进行加密之前，强烈建议分析一下先前在安装过程中生成的 `checkme` 文件。通过分析我们便可以知道用 pandom 生成的数是否真的随机。本节将解释如何使用 ncomputers.org 的 shell 脚本 `entropyarray` 来测试由 pandom 产生的输出的熵及序列相关性。

**注**：整个分析过程也可以在另一台电脑上完成，例如在一个笔记本电脑或台式机上。举个例子：假如你正在一个资源受到限制的 VPS 上安装 pandom 程序，或许你更倾向于将 `checkme` 复制到自己的个人电脑中，然后再进行分析。

#### 2.1 获取 root 权限

`entropyarray` 程序也必须以 root 身份来安装，所以在必要时请运行如下命令：

```
su -
```

#### 2.2 安装编译所需的依赖

为了下载并安装 `entropyarray`， 你需要 GNU g++ 编译器、GNU `make`、GNU `tar` 和 GNU `wget`。在随后你可以任意卸载这些依赖。 

**基于 Arch 的系统：**

```
pacman -S gcc make
```

**基于 Debian 的系统：**

```
apt-get install g++ make
```

**基于 Red Hat 的系统：**

```
dnf install gcc-c++ make
yum install gcc-c++ make
```

**基于 SUSE 的系统：**

```
zypper install gcc-c++ make
```

#### 2.3 下载并析出源码

以下命令将使用 `wget` 和 `tar` 从 ncomputers.org 下载到 entropyarray 的源码并进行解压：

```
wget http://ncomputers.org/rearray.tar.gz
wget http://ncomputers.org/entropy.tar.gz
wget http://ncomputers.org/entropyarray.tar.gz
    
tar xf entropy.tar.gz
tar xf rearray.tar.gz
tar xf entropyarray.tar.gz
```

#### 2.4 安装 entropyarray

**注**：如果在编译过程中报有关 `-std=c++11` 的错误，则说明当前系统安装的 GNU g++ 版本不支持 ISO C++ 2011 标准，那么你可能需要在另一个支持该标准的系统中编译 ncomputers.org/entropy 和 ncomputers.org/rearray （例如在一个你喜爱的较新的 Linux 发行版本中来编译）。接着使用 `make install` 来安装编译好的二进制文件，再接着你可能想继续运行 `entropyarray` 程序，或者跳过运行该程序这一步骤，然而我还是建议在使用 pandom 来达到加密目地之前先分析一下 `checkme` 文件。

```
cd rearray; make install; cd ..
cd entropy; make install; cd ..
cd entropyarray; make install; cd ..
```

#### 2.5 分析 checkme 文件

**注**：64 [ubits][53] / 64 bits 的 pandom 实现所生成的结果中熵应该高于 `15.977` 且 `max` 字段低于 `70`。假如你的结果与之相差巨大，或许你应该按照下面第 5 节介绍的那样增加你的 pandom 实现的不可预测性。假如你跳过了生成 `checkme` 文件的那一步，你也可以使用其他的工具来进行测试，例如 [伪随机数序列测试][54]。

```
entropyarray checkme

entropyarray in /tmp/tmp.mbCopmzqsg
15.977339
min:12
med:32
max:56
15.977368
min:11
med:32
max:58
15.977489
min:11
med:32
max:59
15.977077
min:12
med:32
max:60
15.977439
min:8
med:32
max:59
15.977374
min:13
med:32
max:60
15.977312
min:12
med:32
max:67
```

#### 2.6 卸载 entropyarray (可选)

假如你打算不再使用 `entropyarray`，那么你可以按照你自己的需求卸载它：


```
cd entropyarray; make uninstall; cd ..
cd entropy; make uninstall; cd ..
cd rearray; make uninstall; cd ..
```

### 3 使用 debian 的软件仓库来进行安装

假如你想在你基于 debian 的系统中让 pandom 保持更新，则你可以使用 ncomputers.org 的 debian 软件仓库来安装或者重新安装它。

#### 3.1 获取 root 权限

以下的 debian 软件包必须以 root 身份来安装，所以在必要时请运行下面这个命令：

```
su -
```

#### 3.2 安装密钥

下面的 debian 软件包中包含 ncomputers.org debian 软件仓库的公匙密钥：

```
wget http://ncomputers.org/debian/keyring.deb
dpkg -i keyring.deb
rm keyring.deb
```

#### 3.3 安装软件源列表

下面这些 debian 软件包含有 ncomputers.org debian 软件仓库的软件源列表，这些软件源列表对应最新的 debian 发行版本(截至 2017 年)。

**注**：你也可以将下面的以 `#` 注释的行加入 `/etc/apt/sources.list` 文件中，而不是为你的 debian 发行版本安装对应的 debian 软件包。但假如这些源在将来改变了，你就需要手动更新它们。

**Wheezy：**

```
#deb http://ncomputers.org/debian wheezy main
wget http://ncomputers.org/debian/wheezy.deb
dpkg -i wheezy.deb
rm wheezy.deb
```

Jessie：

```
#deb http://ncomputers.org/debian jessie main
wget http://ncomputers.org/debian/jessie.deb
dpkg -i jessie.deb
rm jessie.deb
```

**Stretch：**

```
#deb http://ncomputers.org/debian stretch main
wget http://ncomputers.org/debian/stretch.deb
dpkg -i stretch.deb
rm stretch.deb
```

#### 3.4 升级软件源列表

一旦密钥和软件源列表安装完成，则可以使用下面的命令来更新：

```
apt-get update
```

#### 3.5 测试 pandom

测试完毕后，你可以随意卸载下面的软件包。

**注**：假如你已经在你的 Linux 中测试了 pandom ， 则你可以跳过这一步。

```
apt-get install pandom-test
pandom-test

generating checkme file, please wait around 8 minutes ...
entropyarray in /tmp/tmp.5SkiYsYG3h
15.977366
min:12
med:32
max:57
15.977367
min:13
med:32
max:57
15.977328
min:12
med:32
max:61
15.977431
min:12
med:32
max:59
15.977437
min:11
med:32
max:57
15.977298
min:11
med:32
max:59
15.977196
min:10
med:32
max:57
```

#### 3.6 安装 pandom

```
apt-get install pandom
```

### 4 管理 pandom

在 pandom 安装完成后，你可能想对它进行管理。

#### 4.1 性能测试

pandom 提供大约 8 kB/s 的随机数生成速率，但它的性能可能根据环境而有所差异。

```
dd if=/dev/random of=/dev/null bs=8 count=512

512+0 records in
512+0 records out
4096 bytes (4.1 kB, 4.0 KiB) copied, 0.451253 s, 9.1 kB/s
```

#### 4.2 熵和序列相关性检验

除了 ncomputers.org/entropyarray，还存在更多的测试，例如 [Ilja Gerhardt 的 NIST 测试套件][62]。

```
entropyarray /dev/random 1M
```

#### 4.3 系统服务

pandom 还可以以系统服务的形式运行。

**基于 init.d 的初始化系统（如 upstart、sysvinit）：**

```
/etc/init.d/random status
/etc/init.d/random start
/etc/init.d/random stop
/etc/init.d/random restart
```
**以 systemd 作为初始化程序的系统：**

```
systemctl status random
systemctl start random
systemctl stop random
systemctl restart random
```

### 5 增强不可预测性或者性能

假如你想增加你编译的 pandom 程序的不可预测性或者性能，你可以尝试增加或删减 CPU 时间测量选项。 

#### 5.1 编辑源文件

请按照自己的意愿，在源文件 `test.s` 和 `tRNG.s` 中增加或者移除 `measurement blocks` 字段。

```
#measurement block
mov $35,%rax
syscall
rdtsc
[...]

#measurement block
mov $35,%rax
syscall
rdtsc
[...]
```

#### 5.2 测试不可预测性

我们总是建议在使用个人定制的 pandom 实现来用于加密目地之前，先进行一些测试。

```
make check
```

#### 5.3 安装定制的 pandom

假如你对测试的结果很满意，你就可以使用下面的命令来安装你的 pandom 实现。

```
make install
```

更多额外信息及更新详见 [http://ncomputers.org/pandom][63]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/

作者：[Oliver][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/
[1]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-gain-root-access
[2]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-build-dependencies
[3]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#arch-based-systems
[4]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#debian-based-systems
[5]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#red-hat-based-systems
[6]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#suse-based-systems
[7]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-download-and-extract-sources
[8]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-test-before-installing-recommended
[9]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-determine-init-system
[10]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-pandom
[11]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#initd-based-init-system-eg-upstart-sysvinit
[12]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#systemd-as-init-system
[13]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-gain-root-access-2
[14]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-build-dependencies-2
[15]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#arch-based-systems-2
[16]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#debian-based-systems-2
[17]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#red-hat-based-systems-2
[18]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#suse-based-systems-2
[19]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-download-and-extract-sources-2
[20]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-entropyarray
[21]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-analyze-checkme-file
[22]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-uninstall-entropyarray-optional
[23]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-gain-root-access-3
[24]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-keyring
[25]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-sources-list
[26]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#wheezy
[27]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#jessie
[28]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#stretch
[29]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-update-sources-list
[30]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-test-pandom
[31]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-pandom-2
[32]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-performance-test
[33]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-entropy-and-serial-correlation-test
[34]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-system-service
[35]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#initd-based-init-system-eg-upstart-sysvinit-2
[36]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#systemd-as-init-system-2
[37]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-edit-source-files
[38]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-test-the-unpredictability
[39]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-personalized-pandom
[40]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#introduction
[41]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-installation-of-pandom
[42]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-analysis-of-checkme-file
[43]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-installation-using-debian-repository
[44]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-managing-pandom
[45]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-increasing-unpredictability-or-performance
[46]:http://ncomputers.org/pandom
[47]:http://ncomputers.org/ubit
[48]:http://ncomputers.org/pandom.tar.gz
[49]:http://unix.stackexchange.com/a/18210/94448
[50]:http://ncomputers.org/rearray.tar.gz
[51]:http://ncomputers.org/entropy.tar.gz
[52]:http://ncomputers.org/entropyarray.tar.gz
[53]:http://ncomputers.org/ubit
[54]:http://www.fourmilab.ch/random/
[55]:http://ncomputers.org/debian/keyring.deb
[56]:http://ncomputers.org/debian
[57]:http://ncomputers.org/debian/wheezy.deb
[58]:http://ncomputers.org/debian
[59]:http://ncomputers.org/debian/jessie.deb
[60]:http://ncomputers.org/debian
[61]:http://ncomputers.org/debian/stretch.deb
[62]:https://gerhardt.ch/random.php
[63]:http://ncomputers.org/pandom
