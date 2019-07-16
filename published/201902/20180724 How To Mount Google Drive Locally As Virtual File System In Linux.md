
如何把 Google 云端硬盘当做虚拟磁盘一样挂载到 Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/07/Google-Drive-720x340.png)

[Google 云端硬盘][1] 是全球比较受欢迎的云存储平台. 直到 2017 年, 全球有超过 8 亿的活跃用户在使用它。即使用户数在持续增长，但直到现在 Google 还是没有发布一款可以在 Linux 平台使用的客户端。但这难不倒 Linux 社区。不时就有一些开发者给 Linux 操作系统带来一些客户端。下面我将会介绍三个用于 Linux 系统非官方开发的 Google 云端硬盘客户端。使用这些客户端，你能把 Google 云端硬盘像虚拟磁盘一样挂载到 Linux 系统。请继续阅读。

### 1、Google-drive-ocamlfuse

google-drive-ocamlfuse 把 Google 云端硬盘当做是一个 FUSE 类型的文件系统，它是用 OCam 语言写的。FUSE 意即<ruby>用户态文件系统<rt>Filesystem in Userspace</rt></ruby>，此项目允许非管理员用户在用户空间创建虚拟文件系统。google-drive-ocamlfuse 可以让你把 Google 云端硬盘当做磁盘一样挂载到 Linux 系统。支持对普通文件和目录的读写操作，支持对 Google dock、表单和演示稿的只读操作，支持多个 Googe 云端硬盘用户，重复文件处理，支持访问回收站等等。

#### 安装 google-drive-ocamlfuse

google-drive-ocamlfuse 能在 Arch 系统的 [AUR][2] 上直接找到，所以你可以使用 AUR 助手程序，如 [Yay][3] 来安装。

```
$ yay -S google-drive-ocamlfuse
```

在 Ubuntu 系统：

```
$ sudo add-apt-repository ppa:alessandro-strada/ppa
$ sudo apt-get update
$ sudo apt-get install google-drive-ocamlfuse
```

安装最新的测试版本：

```
$ sudo add-apt-repository ppa:alessandro-strada/google-drive-ocamlfuse-beta
$ sudo apt-get update
$ sudo apt-get install google-drive-ocamlfuse
```

#### 使用方法

安装完成后，直接在终端里面输入如下命令，就可以启动 google-drive-ocamlfuse 程序了：

```
$ google-drive-ocamlfuse
```

当你第一次运行该命令，程序会直接打开你的浏览器并要求你确认是否对 Google 云端硬盘的文件的操作进行授权。当你确认授权后，挂载 Google 云端硬盘所需要的配置文件和目录都会自动进行创建。

![][5]

当成功授权后，你会在终端里面看到如下的信息。

```
Access token retrieved correctly.
```

好了，我们可以进行下一步操作了。关闭浏览器并为我们的 Google 云端硬盘创建一个挂载点吧。

```
$ mkdir ~/mygoogledrive

```

最后操作，使用如下命令挂载 Google 云端硬盘：

```
$ google-drive-ocamlfuse ~/mygoogledrive
```

恭喜你了！你可以使用终端或文件管理器来访问 Google 云端硬盘里面的文件了。

使用终端：

```
$ ls ~/mygoogledrive
```

使用文件管理器：

![][6]

如何你有不止一个账户，可以使用 `label` 命令对其进行区分不同的账户，就像下面一样：

```
$ google-drive-ocamlfuse -label label [mountpoint]
```

当操作完成后，你可以使用如下的命令卸载 Google 云端硬盘：

```
$ fusermount -u ~/mygoogledrive
```

获取更多信息，你可以参考 man 手册。

```
$ google-drive-ocamlfuse --help
```

当然你也可以看看[官方文档][7]和该项目的 [GitHub 项目][8]以获取更多内容。

### 2. GCSF

GCSF 是基于 Google 云端硬盘的 FUSE 文件系统，使用 Rust 语言编写。GCSF 得名于罗马尼亚语中的“ **G** oogle **C** onduce **S** istem de **F** ișiere”，翻译成英文就是“Google Drive Filesystem”（即 Google 云端硬盘文件系统）。使用 GCSF，你可以把 Google 云端硬盘当做虚拟磁盘一样挂载到 Linux 系统，可以通过终端和文件管理器对其进行操作。你肯定会很好奇，这到底与其它的 Google 云端硬盘 FUSE 项目有什么不同，比如 google-drive-ocamlfuse。GCSF 的开发者回应 [Reddit 上的类似评论][9]：“GCSF 意在某些方面更快（递归列举文件、从 Google 云端硬盘中读取大文件）。当文件被缓存后，在消耗更多的内存后，其缓存策略也能让读取速度更快（相对于 google-drive-ocamlfuse 4-7 倍的提升）”。

#### 安装 GCSF

GCSF 能在 [AUR][10] 上面找到，对于 Arch 用户来说直接使用 AUR 助手来安装就行了，例如[Yay][3]。

```
$ yay -S gcsf-git
```

对于其它的发行版，需要进行如下的操作来进行安装。

首先，你得确认系统中是否安装了Rust语言。

- [在 Linux 上安装 Rust](https://www.ostechnix.com/install-rust-programming-language-in-linux/)

确保 `pkg-config` 和 `fuse` 软件包是否安装了。它们在绝大多数的 Linux 发行版的默认仓库中都能找到。例如，在 Ubuntu 及其衍生版本中，你可以使用如下的命令进行安装：

```
$ sudo apt-get install -y libfuse-dev pkg-config
```

当所有的依赖软件安装完成后，你可以使用如下的命令来安装 GCSF：

```
$ cargo install gcsf
```

#### 使用方法

首先，我们需要对 Google 云端硬盘的操作进行授权，简单输入如下命令：

```
$ gcsf login ostechnix
```

你必须指定一个会话名称。请使用自己的会话名称来代 `ostechnix`。你会看到像下图的提示信息和Google 云端硬盘账户的授权验证连接。

![][11]

直接复制并用浏览器打开上述 URL，并点击 “allow” 来授权访问你的 Google 云端硬盘账户。当完成授权后，你的终端会显示如下的信息。

```
Successfully logged in. Credentials saved to "/home/sk/.config/gcsf/ostechnix".
```

GCSF 会把配置保存文件在 `$XDG_CONFIG_HOME/gcsf/gcsf.toml`，通常位于 `$HOME/.config/gcsf/gcsf.toml`。授权凭证也会保存在此目录当中。

下一步，创建一个用来挂载 Google 云端硬盘的目录。

```
$ mkdir ~/mygoogledrive
```

之后，修改 `/etc/fuse.conf` 文件：

```
$ sudo vi /etc/fuse.conf
```

注释掉以下的行，以允许非管理员用 `allow_other` 或 `allow_root` 挂载选项来挂载。

```
user_allow_other
```

保存并关闭文件。

最后一步，使用如下命令挂载 Google 云端硬盘：

```
$ gcsf mount ~/mygoogledrive -s ostechnix
```

示例输出：

```
INFO gcsf > Creating and populating file system...
INFO gcsf > File sytem created.
INFO gcsf > Mounting to /home/sk/mygoogledrive
INFO gcsf > Mounted to /home/sk/mygoogledrive
INFO gcsf::gcsf::file_manager > Checking for changes and possibly applying them.
INFO gcsf::gcsf::file_manager > Checking for changes and possibly applying them.
```

重复一次，使用自己的会话名来更换 `ostechnix`。你可以使用如下的命令来查看已经存在的会话：

```
$ gcsf list
Sessions:
- ostechnix
```

你现在可以使用终端和文件管理器对 Google 云端硬盘进行操作了。

使用终端：

```
$ ls ~/mygoogledrive
```

使用文件管理器：

![][12]

如果你不知道自己把 Google 云端硬盘挂载到哪个目录了，可以使用 `df` 或者 `mount` 命令，就像下面一样。

```
$ df -h
Filesystem Size Used Avail Use% Mounted on
udev 968M 0 968M 0% /dev
tmpfs 200M 1.6M 198M 1% /run
/dev/sda1 20G 7.5G 12G 41% /
tmpfs 997M 0 997M 0% /dev/shm
tmpfs 5.0M 4.0K 5.0M 1% /run/lock
tmpfs 997M 0 997M 0% /sys/fs/cgroup
tmpfs 200M 40K 200M 1% /run/user/1000
GCSF 15G 857M 15G 6% /home/sk/mygoogledrive

$ mount | grep GCSF
GCSF on /home/sk/mygoogledrive type fuse (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000,allow_other)
```

当操作完成后，你可以使用如下命令来卸载 Google 云端硬盘：

```
$ fusermount -u ~/mygoogledrive
```

浏览[GCSF GitHub 项目][13]以获取更多内容。

### 3、Tuxdrive

Tuxdrive 也是一个非官方 Linux Google 云端硬盘客户端。我们之前有写过一篇关于 Tuxdrive 比较详细的使用方法。可以查看如下链接：

- [Tuxdrive： 一个 Linux 下的 Google 云端硬盘客户端](https://www.ostechnix.com/tuxdrive-commandline-google-drive-client-linux/)

当然，之前还有过其它的非官方 Google 云端硬盘客户端，例如 Grive2、Syncdrive。但它们好像都已经停止开发了。当有更受欢迎的 Google 云端硬盘客户端出现，我会对这个列表进行持续的跟进。

谢谢你的阅读。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-mount-google-drive-locally-as-virtual-file-system-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[sndnvaps](https://github.com/sndnvaps)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.google.com/drive/
[2]:https://aur.archlinux.org/packages/google-drive-ocamlfuse/
[3]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]:http://www.ostechnix.com/wp-content/uploads/2018/07/google-drive.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/07/google-drive-2.png
[7]:https://github.com/astrada/google-drive-ocamlfuse/wiki/Configuration
[8]:https://github.com/astrada/google-drive-ocamlfuse
[9]:https://www.reddit.com/r/DataHoarder/comments/8vlb2v/google_drive_as_a_file_system/e1oh9q9/
[10]:https://aur.archlinux.org/packages/gcsf-git/
[11]:http://www.ostechnix.com/wp-content/uploads/2018/07/google-drive-3.png
[12]:http://www.ostechnix.com/wp-content/uploads/2018/07/google-drive-4.png
[13]:https://github.com/harababurel/gcsf
