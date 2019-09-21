如何在 Anbox 上安装 Google Play 商店及启用 ARM 支持
======

![](https://4.bp.blogspot.com/-xBysI_ar5UU/W0NxTe42FkI/AAAAAAAAA2c/KTRtA4C2yYYN9aaMwwAwTXe8deXF4LdNgCLcBGAs/s1600/anbox-google-play-store.png)

[Anbox][1] （Anroid in a Box）是一个自由开源工具，它允许你在 Linux 上运行 Android 应用程序。它的工作原理是在 LXC 容器中运行 Android 运行时环境，重新创建 Android 的目录结构作为可挂载的 loop 镜像，同时使用本机 Linux 内核来执行应用。

据其网站所述，它的主要特性是安全性、性能、集成和趋同（不同外形尺寸缩放）。

使用 Anbox，每个 Android 应用或游戏就像系统应用一样都在一个单独的窗口中启动，它们的行为或多或少类似于常规窗口，显示在启动器中，可以平铺等等。

默认情况下，Anbox 没有 Google Play 商店或 ARM 应用支持。要安装应用，你必须下载每个应用的 APK 并使用 `adb` 手动安装。此外，默认情况下不能使用 Anbox 安装 ARM 应用或游戏 —— 尝试安装 ARM 应用会显示以下错误：

```
Failed to install PACKAGE.NAME.apk: Failure [INSTALL_FAILED_NO_MATCHING_ABIS: Failed to extract native libraries, res=-113]

```

你可以在 Anbox 中手动设置 Google Play 商店和 ARM 应用支持（通过 libhoudini），但这是一个非常复杂的过程。为了更容易地在 Anbox 上安装 Google Play 商店和 Google Play 服务，并让它支持 ARM 应用程序和游戏（使用 libhoudini），[geeks-r-us.de][2]（文章是德语）上的人创建了一个自动执行这些任务的脚本。

在使用之前，我想明确指出，即使在集成 libhoudini 来支持 ARM 后，也并非所有 Android 应用和游戏都能在 Anbox 中运行。某些 Android 应用和游戏可能根本不会出现在 Google Play 商店中，而一些应用和游戏可能可以安装但无法使用。此外，某些应用可能无法使用某些功能。

### 安装 Google Play 商店并在 Anbox 上启用 ARM 应用/游戏支持

如果你的 Linux 桌面上尚未安装 Anbox，这些说明显然不起作用。如果你还没有，请按照[此处][7]的安装说明安装 Anbox。此外，请确保在安装 Anbox 之后，使用此脚本之前至少运行一次 `anbox.appmgr`，以避免遇到问题。另外，确保在执行下面的脚本时 Anbox 没有运行（我怀疑这是导致评论中提到的这个[问题][8]的原因）。

1、 安装所需的依赖项（wget、lzip、unzip 和 squashfs-tools）。

在 Debian、Ubuntu 或 Linux Mint 中，使用此命令安装所需的依赖项：

```
sudo apt install wget lzip unzip squashfs-tools
```

2、 下载并运行脚本，在 Anbox 上自动下载并安装 Google Play 商店（和 Google Play 服务）和 libhoudini（用于 ARM 应用/游戏支持）。

**警告：永远不要在不知道它做什么的情况下运行不是你写的脚本。在运行此脚本之前，请查看其[代码][4]。**

要下载脚本，使其可执行并在 Linux 桌面上运行，请在终端中使用以下命令：

```
wget https://raw.githubusercontent.com/geeks-r-us/anbox-playstore-installer/master/install-playstore.sh
chmod +x install-playstore.sh
sudo ./install-playstore.sh
```

3、要让 Google Play 商店在 Anbox 中运行，你需要启用 Google Play 商店和 Google Play 服务的所有权限

为此，请运行Anbox：

```
anbox.appmgr
```

然后进入“设置 > 应用 > Google Play 服务 > 权限”并启用所有可用权限。对 Google Play 商店也一样！

![](https://4.bp.blogspot.com/-_eNBaOz1RFs/W0NySoRZ5qI/AAAAAAAAA2s/tJseV74r-3Y3M6dnUBmMo9mDfQLqNK7YwCLcBGAs/s1600/anbox-google-play-services-permissions.png)

你现在应该可以使用 Google 帐户登录 Google Play 商店了。

如果未启用 Google Play 商店和 Google Play 服务的所有权限，你可能会在尝试登录 Google 帐户时可能会遇到问题，并显示以下错误消息：“Couldn't sign in. There was a problem communicating with Google servers. Try again later“，如你在下面的截图中看到的那样：

![](https://4.bp.blogspot.com/-00ffP4iLTT4/W0NyBGECDLI/AAAAAAAAA2k/re7YRgzeU6M6ccVnODlYGak0UsdImrJ_ACLcBGAs/s1600/anbox-google-play-error-login-problem-google-servers.png)

登录后，你可以停用部分 Google Play 商店/Google Play 服务权限。

**如果你在 Anbox 上登录 Google 帐户时遇到一些连接问题**，请确保 `anbox-bride.sh` 正在运行：

启动它：

```
sudo /snap/anbox/current/bin/anbox-bridge.sh start
```
重启它：

```
sudo /snap/anbox/current/bin/anbox-bridge.sh restart
```

根据[此用户][9]的说法，如果 Anbox 仍然存在连接问题，你可能还需要安装 dnsmasq 包。但是在我的 Ubuntu 18.04 桌面上不需要这样做。


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/07/anbox-how-to-install-google-play-store.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://anbox.io/
[2]:https://geeks-r-us.de/2017/08/26/android-apps-auf-dem-linux-desktop/
[3]:https://github.com/geeks-r-us/anbox-playstore-installer/
[4]:https://github.com/geeks-r-us/anbox-playstore-installer/blob/master/install-playstore.sh
[5]:https://docs.anbox.io/userguide/install.html
[6]:https://github.com/anbox/anbox/issues/118#issuecomment-295270113
[7]:https://github.com/anbox/anbox/blob/master/docs/install.md
[8]:https://www.linuxuprising.com/2018/07/anbox-how-to-install-google-play-store.html?showComment=1533506821283#c4415289781078860898
[9]:https://github.com/anbox/anbox/issues/118#issuecomment-295270113
