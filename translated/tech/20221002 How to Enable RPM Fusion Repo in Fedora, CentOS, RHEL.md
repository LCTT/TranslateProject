[#]: subject: "How to Enable RPM Fusion Repo in Fedora, CentOS, RHEL"
[#]: via: "https://www.debugpoint.com/enable-rpm-fusion-fedora-rhel-centos/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Fedora、CentOS、RHEL 中启用 RPM Fusion 仓库
======
本指南解释了在 Fedora Linux 发行版中启用第三方软件仓库 RPM Fusion 的步骤。

[RPM Fusion][1] 软件仓库是一个社区维护的软件仓库，它为 Fedora Linux 提供额外的软件包，这些软件包不是由 Fedora 官方团队分发，例如 DVD 播放、媒体播放、来自 GNOME 和 KDE 的软件等。这是因为许可、其他法律原因和特定国家/地区的软件规范。

RPM Fusion 为 Red Hat Enterprise Linux 以及 Fedora 提供了 .rpm 包。

本指南介绍了在 Fedora Linux 中启用 RPM Fusion 仓库所需的步骤。本指南适用于所有 Fedora 发行版本。

这在所有当前支持的 Fedora 版本（35、36 和 37）中进行了测试。

![RPM Fusion][2]

### 如何在 Fedora Linux、RHEL、CentOS 中启用 RPM Fusion 仓库

RPM Fusion 有两种版本的仓库：自由和非自由。

顾名思义，自由版包含软件包的自由版本，非自由版包含封闭源代码和“非商业”开源软件的编译软件包。

在继续之前，首先检查你是否安装了 RPM fusion。打开终端并运行以下命令。

```
dnf repolist | grep rpmfusion
```


如果安装了 RPM，你应该会看到如下所示的消息。就不用下面的步骤。如果未安装，你可以继续执行以下步骤。

![RPM Fusion 已安装][3]

打开终端并根据你的操作系统版本运行以下命令。请注意，这些命令包含自由和非自由版本。如果你愿意，你可以在运行时省略下面的任何一个。

#### Fedora

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

#### 带 rpm-ostree 的 Silverblue

```
sudo rpm-ostree install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

```
sudo rpm-ostree install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

#### RHEL 8

```
sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```

```
sudo dnf install --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
```

```
sudo dnf install --nogpgcheckhttps://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
```

```
sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-$(uname -m)-rpms"
```

#### CentOS 8

```
sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```

```
sudo dnf install --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
```

```
sudo dnf install --nogpgcheckhttps://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
```

```
sudo dnf config-manager --enable PowerTools
```

### 附加说明

* RPM Fusion 还提供帮助用户安装来自 GNOME 软件或 KDE Discover 的软件包。要在 Fedora 中启用它，请运行以下命令。

```
sudo dnf groupupdate core
```

* 你还可以通过以下命令启用 RPM Fusion 来使用 gstreamer 和其他多媒体播放包来播放媒体文件。

```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```

```
sudo dnf groupupdate sound-and-video
```

* 启用 RPM Fusion 以使用 libdvdcss 播放 DVD。

```
sudo dnf install rpmfusion-free-release-taintedsudo dnf install libdvdcss
```

* 通过以下命令启用 RPM Fusion 以启用非 FLOSS 硬件包。

```
sudo dnf install rpmfusion-nonfree-release-taintedsudo dnf install *-firmware
```

运行命令后，如果你使用的是 Fedora 或 CentOS/RHEL，请在重启前运行以下命令。

```
sudo dnf check-updatesudo dnf update
```

### 如何使用 dnf 删除仓库

如果要删除仓库，请按照以下步骤操作。

首先，使用以下命令查看添加到 Fedora 系统的仓库列表。

```
dnf repolist
```

![dnf 仓库列表][4]

如你所见，添加了 rpmfusion 自由和非自由仓库。要通过 dnf 删除它，你需要使用以下命令准确知道仓库文件名。

```
rpm -qa 'rpmfusion*'
```

这将列出仓库的确切名称。在示例中，它们是 “rpmfusion-free-release”。

![从 Fedora 中移除 rpmfusion][5]

现在你可以简单地运行以下命令来删除它。

```
sudo dnf remove rpmfusion-free-release
```

你可以重复上面的例子从 Fedora 中删除 rpmfusion，也可以使用它从系统中删除任何其他仓库。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/enable-rpm-fusion-fedora-rhel-centos/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://rpmfusion.org/
[2]: https://www.debugpoint.com/wp-content/uploads/2020/07/rpmfusion.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2020/07/RPM-Fusion-Already-Installed-.png
[4]: https://www.debugpoint.com/wp-content/uploads/2020/07/dnf-repolist.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2020/07/remove-rpmfusion-from-fedora.jpg
