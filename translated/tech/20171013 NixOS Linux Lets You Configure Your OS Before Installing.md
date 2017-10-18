NixOS Linux： 先配置后安装的 Linux 
============================================================

![NixOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/configuration.jpg?itok=IjKuFz05 "NixOS")

配置是成功安装 NixOS 的关键。

我用 Linux 有些年头了。在这些年里我很有幸见证了开源的发展。各色各样的发行版在安装方面的努力，也是其中的一个比较独特的部分。以前，安装 Linux 是个最好让有技术的人来干的任务。现在，只要你会装软件，你就会安装 Linux。简单，并且，不是我吹，在吸引新用户方面效果拔群。事实上安装整个 Linux 操作系统都要比 Windows 用户安装个更新看起来要快一点。

但每一次，我都喜欢看到一些不同的东西——那些可以让我体验新鲜的东西。[NixOS][9] 在这方面就做的别具一格。讲真，我原来也就把它当作另一个提供标准特性和 KDE Plasma 5 界面的 Linux 发行版。

好像也没什么不对。

[下载 ISO 映像][10]后，我启动了 [VirtualBox][11] 并用下载的镜像创建了个新的虚拟机。VM 启动后，出来的是 Bash 的登录界面，界面上指导我用空密码去登录 root 账号，以及我该如何启动 GUI 显示管理器（图 1）。

![First contact](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/nixos_1.jpg?itok=VkGTO2Tg "First contact")

*图 1： 与 NixOS 的初次接触可能不是太和谐。*

“好吧”我这样想着，“打开看看吧！”

GUI 启动和运行时（KDE Plasma 5），我没找到喜闻乐见的“安装”按钮。原来，NixOS 是一个在安装前需要你配置的发行版，真有趣。那就让我们瞧瞧它是如何做到的吧！

### 安装前配置

你需要做的第一件事是建分区。由于 NixOS 安装程序不包含分区工具，你得用自带的 GParted （图 2）来创建一个 EXT4 分区。

![Partitioning](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/nixos_2.jpg?itok=nta-bl-S "Partitioning")

*图 2： 安装前对磁盘分区。*

创建好分区，然后用命令 `mount /dev/sdX /mnt` 挂载。（请自行替换 `sdX` 为你新创建的分区）。

你现在需要创建一个配置文件。命令如下：

```
nixos-generate-config --root /mnt
```

上面的命令会创建两个文件（存放在目录  `/mnt/etc/nixos` 中）：

*   `configuration.nix` — 默认配置文件。
*   `hardware-configuration.nix` — 硬件配置（无法编辑）

通过命令 `nano /mnt/etc/nixos/configuration.nix`  打开文件。其中有一些需要编辑的地方得注意。第一个改动便是设置启动选项。找到行：

```
# boot.loader.grub.device = "/dev/sda"; # 或 efi 时用 "nodev"
```

删除行首的 `#` 使该选项生效（确保 `/dev/sda` 与你新建的分区）。

通过配置文件，你可以设置时区和追加要安装的软件包。来看一个被注释掉的安装包的示例：

```
# List packages installed in system profile. To search by name, run:
# nix-env -aqP | grep wget
# environment.systemPackages = with pkgs; [
#     wget vim
# ];
```

如果你想要添加软件包，并在安装时安装它们，那就取消掉这段注释，并添加你需要的软件包。举个例子，比方说你要把 LibreOffice 加进去。示例详见下方：

```
# List packages installed in system profile. To search by name, run:
nix-env -aqP | grep wget
environment.systemPackages = with pkgs; [
    libreoffice wget vim
];
```

你可以通过输入命令 `nix-env -aqP | grep PACKAGENAME`  来寻找确切的包名（`PACKAGENAME` 为你想要找的软件包）。如果你不想输命令，你也可以检索 [NixOS 的软件包数据库][12]。

在你把所有的软件包都添加完后，你还有件事儿需要做（如果你想要登录到桌面的话，我觉得你还得折腾下 KDE Plasma 5 桌面）。翻到配置文件的末尾并在最后的 `}` 符号前，追加如下内容：

```
services.xserver = {
 enable = true;
 displayManager.sddm.enable = true;
 desktopManager.plasma5.enable = true;
};
```

在 [NixOS 官方文件][13] 中，你能找到配置文件中更多的选项。保存并关掉配置文件。

### 安装

在你按照自己的需求完善好配置之后，使用命令（需要 root 权限） `nixos-install`。完成安装所需要的时间，会随着你加入的软件包多少有所区别。安装结束后，你可以使用命令重启系统，（重启之后）迎接你的就是 KDE Plasma 5 的登录管理界面了（图 3）。

![KDE Plasma 5](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/nixos_3.jpg?itok=DdsB5opR "KDE Plasma 5")

*图 3： KDE Plasma 5 登录管理界面*

### 安装后

你要首先要做的两件事之一便是给 root 用户设个密码（通过输入命令 `passwd` 来修改默认的密码），以及添加一个标准用户。做法和其它的 Linux 发行版无二。用 root 用户登录，然后在终端输入命令：

```
useradd -m USER
```

将 `USER` 替换成你想要添加的用户名。然后通过下面的命令给用户设上密码：

```
passwd USER
```

同样的将 `USER` 替换成你添加的用户。

然后会有提示引导你填写并验证新密码。然后，你就能用标准用户登录 NixOS 啦。

NixOS 在你安装并运行后，你可以为系统添加新的软件包，但并非通过寻常的方式。如果你发现你需要安装些新东西，你得回到配置文件（位置就是  `/etc/nixos/` ），找到之前安装时添加软件包的位置，运行以下命令（需要 root 权限）：

```
nixos-rebuild switch
```

命令执行结束后，你就能使用新安装的软件包了。

### Enjoy NixOS

现在，NixOS 已经带着所有你想安装的软件和 KDE Plasma 5 桌面运行起来了。要知道，你所做的不仅仅只是安装了个 Linux 发行版，关键是你自定义出来的发行版非常符合你的需求。所以好好享受你的 NixOS 吧！

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/10/nixos-linux-lets-you-configure-your-os-installing

作者：[JACK WALLEN][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/creative-commons-zero
[5]:https://www.linux.com/files/images/nixos1jpg
[6]:https://www.linux.com/files/images/nixos2jpg
[7]:https://www.linux.com/files/images/nixos3jpg
[8]:https://www.linux.com/files/images/configurationjpg
[9]:https://nixos.org/
[10]:https://nixos.org/nixos/download.html
[11]:https://www.virtualbox.org/wiki/Downloads
[12]:https://nixos.org/nixos/packages.html
[13]:https://nixos.org/nixos/manual/index.html#ch-configuration
