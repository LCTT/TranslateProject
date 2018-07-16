Ubuntu Touch 和 Android 双系统安装官方指南
======================================

（译注：本文译自[Ubuntu官方维基][0]）

Ubuntu 双系统安装器是作为技术预览版本发布给开发者的，可以使得开发者同时在一台手机上安装 Ubuntu 系统和 Android 系统。该软件现阶段或最终的目标用户并非普通用户。开发者应该熟悉 Ubuntu 和 Android 系统的分区布局并且在出现问题的时候有能力手动刷回分区。

Ubuntu 双系统安装器是一些工程师花了一点时间内做出的一个内部臭鼬项目(译注：管理层不知的研究项目)。由于项目进展良好，所以决定向开发者社区发布预览版以供大家测试、学习或者完善。

双系统启动不是常规 Ubuntu 发布版本中的一部分。

## 安装后可实现以下功能

- 一台可以在全功能的 Android 和 Ubuntu 系统之间切换的手机
- Android 系统上：一个 Ubuntu Installer 应用，用来安装 Ubuntu 系统和切换到 Ubuntu 系统
- Android 系统上：一个 SuperUser 超级用户管理器，用来为 Ubuntu 安装器授予权限
- Ubuntu 系统上：一个 Ubuntu Dual Boot 应用，用来启动到 Android 系统
- 尚不支持在 Ubuntu 系统下的更新，但可以通过 Android 下的应用程序来进行系统更新

## 必要条件

安装双系统启动，你需要：

- **一台Nexus 4 手机** (其他 [支持的 Nexus 手机][1] 理论上也能安装，但是现在还没有经过测试。)
- 手机安装 **Android 4.4.2 或者更高的系统版本** ，基于原厂固件或者 CyanogenMod 和 AOSP 的固件。
- 手机上需要有 **2.7GB 剩余存储空间** 用来安装Ubuntu。
- 桌面电脑上需要运行 **ADB 工具** 
- 手机应该 **解锁 bootloader 并打开 USB 调试选项**。按照安装步骤1到3来实现。如果你的手机已经解锁过 bootloader 并且打开了 USB 调试选项了，这一步可以[跳过>][2]。


### 步骤 1 - 桌面电脑设置

为了连接手机并刷机，在电脑桌面上依照以下几步操作。

**设置Touch开发者预览工具（Touch Developer Preview Tools）的 PPA**

这些 PPA 是一个迷你库，其中包含安装过程中需要的一些额外软件。以下描述如何去启用和使用它。

这些 PPA 的包含工具和依赖库支持各个 Ubuntu 发行版，包括 12.04, 12.10, 13.04, 13.10 和 14.04等。 将以下的源地址列表加入  `/etc/apt/sources.list`  文件中来添加 Ubuntu Touch PPA。

在你的机器上按 `Ctrl+Alt+T` 开启终端窗口，运行以下命令。

	sudo add-apt-repository ppa:phablet-team/tools

在 Ubuntu 12.04系统上，还需要运行以下命令：

	sudo add-apt-repository ppa:ubuntu-sdk-team/ppa

然后运行：

	sudo apt-get update
	sudo apt-get install ubuntu-device-flash


### 步骤 1.5 - 备份Android(可选)

- 确认开启开发者模式。点击 `设置 -> 关于手机 -> 版本号` (点击七次)
- 确认开启 USB 调试模式。点击 `设置 -> 开发者选项 -> USB 调试`
- 在你的电脑上执行（译注：自然这是在Linux下，如Ubuntu里面执行的）

		$ adb backup -apk -shared -all

这样就将你的操作系统、应用程序和所有的数据备份为 backup.ab 文件了。以后在重新刷回 android 系统（或root、解锁等）的时候可以使用 `$ adb restore backup.ab` 命令恢复你所有的数据。

### 步骤 2 - 手机解锁

如果手机已经解锁，那么跳过步骤 3。以下几步将擦除手机上所有的个人数据。

1. 关机，同时按住手机的开机键+音量上+音量下开机。
2. 手机将开机到bootloader界面。
3. 使用 USB 数据线将手机和电脑连接。
4. 在电脑上按 `Ctrl+Alt+T` 打开一个终端。 键入 `sudo fastboot oem unlock` 并回车。
5. 在手机上，接受解锁条款。
6. 按开手机开机键开机。(屏幕上 Start 的箭头所向)

**恢复手机出厂设置**

如果解锁 bootloader 后不断重启的话... 可以使用以下方法解决：

1. 在重启的过程中，同时按住 电源键+音量上+音量下 使得手机重返 fastboot 模式。
2. 在 fastboot 模式下，使用音量键选择到 Recovery 选项后，按下开机键选中。
3. 在 Recovery 模式下(Android 机器人 背景是个红色三角) 同时按住音量上键和开机键进入stock recovery 模式。再次强调，不要按住按钮不放，只是同时按他们。保证你按了正确的音量按钮。应该是右边的音量按钮的向上键。
4. 一旦进入 Recovery 模式，恢复出厂设置并清空数据，然后重启平板，现在应该可以看到欢迎屏幕了。

### 步骤 3 - 初始化手机指南

按照以下步骤初始化手机

1. 如果没有启动，启动手机进 Android 系统
2. 启用手机的 USB 调试模式
	- 在冰激凌三明治 (版本 4.0) 上打开 USB 调试(`设置 > 系统 > 开发者选项 > USB 调试`)
	- 在果冻豆 (版本 4.1 和 4.2) 上打开 USB 调试，需要进 `设置, 关于 [手机|平板]` 菜单且点击版本号7次才能进入开发者选项。
	- 在 4.2.2, (`设置 > 关于` > 点击版本号7次激活开发者选项菜单)
	- 在其他版本的 Android 系统中，你通过 `设置 > 开发者选项 > USB 调试`来启用 USB 调试模式。您也需要接受手机上的主机密钥。
	- 在工作站中 -> `adb kill-server; adb start-server`
3. 将手机和电脑通过USB数据线连接起来。
	- 根据 Android 版本的不同，会弹出一个主机密匙的框，需要确认才能和电脑通信。
	- 注意，`adb devices` 命令不应该显示为手机 'offline' 。如果显示手机离线，在超级用户模式下运行adb(`sudo adb kill-server; sudo adb start-server`)，然后将手机再次连接。
	- 在某些情况下，手机仍然显示为离线，如果USB连接模式为 'MTP' (一些手机或版本的Android的默认模式)的话，就不会弹出主机密匙提示对话框。取消所有的USB连接模式选项的勾选(`设置 -> 存储 -> 菜单 -> USB连接 -> MTP, PTP`)也许能解决adb连接问题。
4. 记下现有手机镜像版本号，Android 系统，恢复系统时使用。可以使用 `设置 > 关于手机 > 版本号码` 查看版本号。

最新版的 Nexus 10s 开启开发者模式后并没有完全启动。如果是这种情况的话，启动到 bootloader 后运行 "`fastboot -w`" 然后进入下一步。

## 双系统启动安装和更新说明<a name="Installation" ></a>

双系统新安装和升级在这部分过程实际上是相同的。

### 在 Android 系统中安装 Ubuntu 安装器

注意：如果手机中有一个以前版本的 Ubuntu 双启动，更新前请首先使用 Android 应用程序卸载掉 Ubuntu 系统。推荐保存用户数据，只卸载掉基本的系统。

1. 在电脑上下载双系统安装脚本到你的家目录。http://humpolec.ubuntu.com/latest/dualboot.sh
2. 使用 `Ctrl+Alt+T` 组合键打开电脑终端。
3. 运行以下命令赋予安装脚本可执行权限。

		chmod +x dualboot.sh

4. 保证你的手机
	- 正常启动进入 Android 用户界面
	- 启用 USB 调试选项
	- 已经解锁了 bootloader
5. 使用 USB 数据线连接手机和电脑
6. 在终端里运行以下命令安装双系统启动：

		./dualboot.sh

安装完成后，手机会重启数次。完成后，系统会启动到 Android 系统，你可以在手机的应用程序里面找到双启动应用程序 (“Ubuntu Dual Boot”) 。

或者，可以使用安装脚本的另一个替代方法，[可以参考安装手册 >][3]。

现在按照以下说明在 Android 下安装 Ubuntu。

## Android 下安装 Ubuntu

注意：Ubuntu 安装需要手机上具有2.7GB以上的剩余内存空间。

1. 如果需要，也可以在手机和电脑USB连接状态下，终端运行以下命令来释放空间。(接受手机上的授权询问)

		adb shell "su sh rm -rf /cache/*"

2. 在手机上，点击 apps 按钮打开 app 列表
3. 查看列表找到 **Ubuntu Dual Boot** 图标并启动它
4. 应用程序启动后按 **Choose channel to install** 并选择一个频道下载(推荐 **utopic** 频道)，请确保您勾选了“bootstrap”选项
5. 下载完成后需要授权 SU 权限给应用程序。提示授权的时候，选择 **Grant** 按钮
6. 按 **Reboot to Ubuntu** 按钮重启手机进入Ubuntu
7. 标准手机重启过程后会启动到Android系统中

注意：

- Ubuntu 安装器支持所有手机平板刷机工具（phablet-flash）支持的频道
- 选择了一个 Ubuntu 频道后，**bootstrap** 复选框可以让你选择清空 Ubuntu 的用户数据，如果不选中的话，用户数据将一直保留。第一次安装的话，选不选是没什么区别的
- 选中一个 Ubuntu 频道后，取消 **latest version** 复选框后可以选择一个特定版本号的镜像，否则，默认安装最新的镜像。
- 如果在安装过程下载镜像过程中，手机锁屏或者 Ubuntu 安装器在后台运行的话，安装按钮会变成  **Resume install** (恢复安装)。点击这个按钮会恢复到超级权限提示前的状态。

## 其他需要注意的

### 更新到最新的 Ubuntu 镜像

根据双启动的经验：

- 安装新版本的 Ubuntu 需要使用 Android 上的双启动应用程序
- 下载新版本的 Ubuntu 可以在 Android 或者 Ubuntu 下进行

这实际上意味着可以有两种不同的方式更新 Ubuntu 镜像（译注：此处与前文不一致，究竟是否可在Ubuntu下更新，译者没有做过实验，可能已经支持了。）：

- **如果在android系统下**，使用双启动应用程序更新 Ubuntu ，需要选择菜单选项中的 "Uninstall Ubuntu" ，然后应用程序会询问你是否保留 Ubuntu 用户数据。如果你想保留数据、通讯录、应用程序、图片、背景设置等，这些数据将会完整保留。另外，每次新版本的 Ubuntu 发布后，将会收到 Android 通知：
	- 对于稳定频道，应用每2天推送一次更新通知
	- 对于推荐频道，应用每10小时推送一次更新通知
- **如果你使用的是 Ubuntu**, 使用系统设置中的标准更新机制下载新版镜像，但是不要选择安装，下载完毕后，重新启动到 Android 系统中，启动双启动应用程序，程序会恢复更新。完成后，你可以再次切换到 Ubuntu系统中。

要升级 Ubuntu 到最新版本，在 android 下的 Ubuntu 双启动应用程序中，卸载 Ubuntu 后，可以按照同样的安装步骤去下载新版本的 Ubuntu。

### 双系统安装器参考命令<a name="#DualBootInstallerReference"></a>

大多数情况下，不带参数运行自动模式安装脚本就足够了。

dualboot.sh

- 自动模式：监测[超级用户][6]应用程序是否需要安装，并更新双系统安装应用程序。

dualboot.sh full

- 完整模式：安装[超级用户][6]和双系统启动 Android 应用程序

dualboot.sh update

- 更新模式：安装或者更新 Android 下的双系统启动应用程序

dualboot.sh channel $CHANNEL

- 边载（Sideload）模式：通过指定的 Ubuntu 频道 ($CHANNEL) 下载最新的镜像到手机。命令启动 android 双系统应用程序并继续使用边载文件进行安装。

dualboot.sh push ubuntu.tar.xz device.tar.xz version.tar.xz

- 边载推送模式：将下载参数推送给双系统启动应用程序，作为参数启动双系统安装器进行安装。

多个手机同时连到电脑上的时候，脚本还提供指定手机ID 的参数。手机ID为脚本的第一个参数。如果不指定手机ID的话，默认为第一个连接的手机。

	dualboot.sh <device-id> channel devel-customized

### 使用自定义镜像服务器

如果你的手机不在官方支持列表中，需要使用第三方移植镜像服务器，你可以将自定义镜像服务器地址作为参数来使用双启动应用程序。这么办的话，打开终端，连接手机到电脑，运行以下命令(替换 $CUSTOM\_SERVER\_URL 为自定义服务器地址)：

	adb shell "su sh 'cd /data/data/com.canonical.ubuntu.installer/files/ && echo $CUSTOM_SERVER_URL > custom_server &&  chmod 777 custom_server'"

下次启动双启动应用程序的时候，默认将使用自定义服务器地址而不是官方地址了。

## 异常处理

如果出现问题，安装双启动后无法进入 Android 和 Ubuntu 系统的话，你可以使用原始启动和恢复镜像恢复手机到最初状态。只有 recovery 分区被双启动修改了，当然你可以刷回原有的启动分区。

1. 下载手机的 Android 固件到你的PC上。
2. 使用快捷键 `Ctrl+Alt+T` 打开终端
3. 解压固件 tar 包并 cd 到其目录
4. 运行以下命令以重启手机到 bootloader

		adb reboot bootloader

5. 进入 bootloader 后，运行以下命令刷回启动分区：

		fastboot flash boot boot.img

6. 不要退出 bootloader ，运行以下命令刷回 recovery 分区：

		fastboot flash recovery recovery.img

7. 刷机完毕后，重启你的手机应该就可以进入 Android 系统了：

    	fastboot reboot

## 致谢

双启动项目和其他 Ubuntu 项目一样都是开源的，你可以参与此项目，使得他更加完美！

- [Bug 报告 >][4]
- [贡献代码 >][5]

## FAQ

### 双启动如何工作？

基于 Android 的手机有一系列不同用途的分区。这些分区包括 **/boot**, **/recovery**, **/system** 和 **/data** 等。

- **boot** 分区是 bootloader 正常启动的时候载入的。这个分区的启动镜像是由一个内核和ramdisk程序组成的。简而言之，bootloader 解压启动镜像，创建一个内存盘后将镜像考入，最后使用 **初始化进程** 启动内核。
- **recovery** 分区包含有恢复镜像，它只是一个不同的启动镜像。它也含有一个内核和内存盘程序，但是初始化可执行程序被换成了内存盘中的二进制的 recovery 程序。
- **system** 分区含有所有的只读系统文件 (除了内存盘中的)供初始化进程载入。
- **data** 分区是供系统写入用户数据的可读写分区。

Ubuntu 以稍微不同的方式使用这些分区

- **boot** 和 **recovery** 分区的作用和 Android 中一样。
- **system 镜像** 含有在 [LXC][8] 中执行的 Android 部分的程序。
- **data** 分区下的 **/data/ubuntu/** 目录含有Ubuntu系统

为了保证用户可以返回 Android 原来的系统，Android 系统的启动镜像是不允许修改的，因为原始内核必须保存。**所以使用 recovery 分区去启动Ubuntu**

### 双启动可以运行在那个版本的 Android 系统下？

- 普通 Android 或 AOSP 4.4.2 或更高版本。
- CyanogenMod (基于 Android 4.4.2 或更高版本).

### 双启动可以运行在那些手机上？

双启动通过测试可以运行在以下手机中：

- Nexus 4
- Nexus 7
- Nexus 10

### 双启动支持那些已发布版本的 Ubuntu？

双启动支持的所有手机平板刷机工具（phablet-flash）支持的系统。

### Android 和 Ubuntu 如何共享用户数据分区？

用户数据分区也放在 Ubuntu 系统镜像 /data/system.img, 大约有2GB。

Ubuntu swap 文件在用户数据分区 /data/SWAP.img (大约540MB)。

Ubuntu 的用户和系统数据也可以在以下目录找到：

- /data/user-data
- /data/system-data

Android 数据分区的使用方式不变。

### 安装双启动后是否无法启动进入 recovery？

安装双启动后，recovery 分区被 Ubuntu 启动镜像占用。这意味着启动到 recovery 模式下，就启动了Ubuntu 。

使用 recovery 的功能会在未来发布。不过当卸载掉 Ubuntu 镜像后，Ubuntu Install 应用会恢复原始的 recovery 分区(普通的 Android 或 CWM)。

### 如果用双启动替换掉 recovery 分区的话，是否还可以更新 Android 系统？

可以，使用双启动应用程序中的 "准备更新安卓" 选项。这会将原始 Android recovery 分区恢复，为 Android 系统更新做准备。这显然会删除 recovery 分区中安装的 Ubuntu 系统，但是使用双系统应用程序可以在 Android 系统更新后很容易重新安装。

任何情况下，你都可以卸载双启动并恢复原始的 recovery 分区。

### 我可以卸载双启动吗？

可以，使用 Android 版本双启动应用程序卸载 Ubuntu 后，原有的 recovery 分区数据会恢复到安装前的状态。

卸载 Ubuntu 的同时也会删除 Ubuntu 系统镜像和交换文件。如果需要，Ubuntu 用户数据也可以被删除。

### 双启动应用程序安装了一个超级用户应用，我可以使用一个第三方的超级用户应用代替它吗？

当然可以了！提供的 [超级用户][6] 应用只是为了那些没有安装它的用户的。

然而，需要注意一点：项目测试中只测试使用了来自 [CyanogenMod][7] 版本或者 dualboot.sh 脚本安装的超级用户应用。但是只要你使用和测试中用的类似的应用的话，一般也不会有问题的。

### 安装 Ubuntu 中，我是否可以删除用户数据后切换频道？

可以，但是有些东西没有测试过，所以有些应用也许无法正常工作。这个问题也存在于切换版本的情况。

### 我能否设置默认启动 Ubuntu 而将 Android 启动移动到 recovery 分区？

目前为止交换默认启动操作系统是不可行的。但是如果有需求的话我们会想办法支持的。

### 为什么使用 recovery 分区启动 Ubuntu 系统而不是使用一个 Android 和 Ubuntu 结合的镜像来启动？

最开始设计双启动的时候原则就是不和某个特定版本和类型的 Android 系统捆绑，留给用户自己选择的权利。所以就没有改动 Android 启动镜像和内核。

最后我们选择利用 recovery 分区启动 Ubuntu，并在需要的时候就恢复到其原始状态。

### 我已经安装了一个 CWM recovery 而且知道如何使用，我可否使用 zip 文件手动刷机？

绝对可以，我们提供的 dualboot.sh 是为了使得安装应用和 recovery 更容易。如果你想手动安装recovery 也是可以的。参看 dualboot.sh 脚本的源码来操作。

### 为什么 Ubuntu 安装器需要使用 recovery 安装到 system 分区里？

Ubuntu 安装器需要安装为 Android （预置的）系统应用。 和用户安装在用户分区的应用不一样，系统应用始终活动在系统分区中，保证可以获取第三方软件可以获取的的最高的权限。

其实 Ubuntu 安装器需要获取的权限只有两个：**缓存分区写入权限**，用来下载 Ubuntu 安装文件；和**电源管理**，用来重启系统。

--------------------------------------------------------------------------------

via: https://wiki.ubuntu.com/Touch/DualBootInstallation

译者：[shipsw](https://github.com/shipsw) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[0]:https://wiki.ubuntu.com/Touch/DualBootInstallation
[1]:https://wiki.ubuntu.com/Touch/Devices#Working_with_phablet-flash
[2]:#Installation
[3]:#DualBootInstallerReference
[4]:https://bugs.launchpad.net/humpolec/+filebug
[5]:https://code.launchpad.net/humpolec
[6]:https://wiki.ubuntu.com/SuperUser
[7]:https://wiki.ubuntu.com/CyanogenMod
[8]:http://www.ibm.com/developerworks/cn/linux/l-lxc-containers/
