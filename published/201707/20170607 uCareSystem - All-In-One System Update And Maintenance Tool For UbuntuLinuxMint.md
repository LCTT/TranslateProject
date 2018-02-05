uCareSystem：Ubuntu/Linux Mint 的一体化系统更新和维护工具
============================================================

[uCareSystem Core][2] 是一种能够自动执行基本的系统维护活动的轻型实用程序，另一方面它可以通过多种方式减少系统管理员的任务，节省大量时间。它没有任何 GUI，并提供纯粹的命令行界面来执行活动。

Ubuntu 中有几种实用程序来执行系统维护活动。每种工具有它们相应的独特功能和设计。你可以添加一个 cron 任务来自动化这些任务。

uCareSystem Core 会自动刷新发行版仓库、更新可用包列表、卸载包（过期包、孤儿包和旧的 Linux 内核）以及清理取回的包来节省系统磁盘空间。

- 建议阅读：[Stacer - Linux 系统优化器及监控工具][3]
- 建议阅读：[BleachBit – 快速及最佳的方式清理你的 Linux 系统][4]
- 建议阅读：[用 Ubuntu Cleaner 在 Ubuntu/LinuxMint 中释放一些空间][5]

### uCareSystem Core 功能

*   更新包列表（它将刷新包索引）
*   下载及安装更新
*   更新包及系统库到最新版本
*   移除不需要的、过期的和孤儿包。
*   移除旧内核（它为了安全保留当前和之前一个内核）
*   移除不需要的配置文件
*   清理已下载的临时包

### 在 Ubuntu/LinuxMint 中安装 uCareSystem Core

因为开发者提供了自己的 PPA，因此我们可以轻易地通过 PPA 在 Ubuntu/LinuxMint 中安装 uCareSystem Core。

```
$ sudo add-apt-repository ppa:utappia/stable
$ sudo apt update
$ sudo apt install ucaresystem-core
```

我们已经成功安装了 `uCareSystem Core` 包，并且在执行 CareSystem Core 命令之前要了解它是否会节省磁盘空间，使用 `df -h` 命令检查当前磁盘利用率。

```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            979M     0  979M   0% /dev
tmpfs           200M  6.4M  194M   4% /run
/dev/sda1        38G   19G   17G  54% /
tmpfs           999M  216K  999M   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           999M     0  999M   0% /sys/fs/cgroup
tmpfs           200M  112K  200M   1% /run/user/1000
```

只需在终端中运行 `ucaresystem-core` 命令，在结束之前它会自动执行而不需要人类交互。

```
$ sudo ucaresystem-core

_______________________________________________________

            uCareSystem Core v3.0                      
                 ~  ''  ~                              

 Welcome to all-in-one System Update and maintenance   
 assistant app.                                        

 This simple script will automatically         	     
 refresh your packagelist, download and                
 install updates (if there are any), remove any old    
 kernels, obsolete packages and configuration files    
 to free up disk space, without any need of user       
 interference.                    				     
_______________________________________________________

 uCareSystem Core will start in 5 seconds... 
#########################
          Started
#########################

Ign:1 https://wire-app.wire.com/linux/debian stable InRelease
Hit:2 https://wire-app.wire.com/linux/debian stable Release
Hit:4 https://deb.nodesource.com/node_6.x yakkety InRelease
Hit:5 https://repo.skype.com/deb stable InRelease
Hit:6 http://in.archive.ubuntu.com/ubuntu yakkety InRelease
Hit:7 http://archive.canonical.com/ubuntu yakkety InRelease
.
.
.
Removing linux-image-extra-4.8.0-34-generic (4.8.0-34.36) ...
Purging configuration files for linux-image-extra-4.8.0-34-generic (4.8.0-34.36) ...
Removing linux-image-extra-4.8.0-32-generic (4.8.0-32.34) ...
Purging configuration files for linux-image-extra-4.8.0-32-generic (4.8.0-32.34) ...

#####################################
Finished removing unused config files
#####################################

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Del tilix 1.5.6-1~webupd8~yakkety1 [449 kB]
Del tilix-common 1.5.6-1~webupd8~yakkety1 [174 kB]
Del libfreetype6 2.6.3-3ubuntu1.2 [336 kB]
Del terminix 1.5.6-1~webupd8~yakkety1 [13.7 kB]

######################################
 Cleaned downloaded temporary packages
######################################

#########################
          Done
#########################
```

我可以看见它如预期那样工作。同样也可以发现大概在`/` 分区节省了 `2GB`。   

```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            979M     0  979M   0% /dev
tmpfs           200M  6.4M  194M   4% /run
/dev/sda1        38G   18G   19G  49% /
tmpfs           999M  216K  999M   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           999M     0  999M   0% /sys/fs/cgroup
tmpfs           200M  112K  200M   1% /run/user/1000
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/ucaresystem-system-update-and-maintenance-tool-for-ubuntu-linuxmint/

作者：[2DAYGEEK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/author/2daygeek/
[2]:https://github.com/cerebrux/uCareSystem
[3]:http://www.2daygeek.com/stacer-linux-system-optimizer-and-monitoring-tool/
[4]:http://www.2daygeek.com/bleachbit-system-cleaner-on-ubuntu-debian-fedora-opensuse-arch-linux-mint/
[5]:https://linux.cn/article-8642-1.html
