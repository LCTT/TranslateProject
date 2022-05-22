[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12845-1.html)
[#]: subject: (Using Fedora 33 with Microsoft’s WSL2)
[#]: via: (https://fedoramagazine.org/wsl-fedora-33/)
[#]: author: (Jim Perrin https://fedoramagazine.org/author/jperrin/)

通过微软的 WSL2 使用 Fedora 33
======

![][1]

如果你像我一样，你可能会发现自己因为各种原因而运行 Windows，无论是因为工作还是游戏。当然，你可以在虚拟机或容器中运行 Fedora，但这些并不像 Windows 的 Linux 子系统（WSL）那样容易融合到普通的 Windows 体验中。通过 WSL 使用 Fedora 可以让你将这两种环境融合在一起，创造一个奇妙的开发环境。

### 先决条件

为了达成这一目标，你需要一些基本条件。你应该运行 Windows 10，并且已经安装了 WSL2。如果没有，请查看[微软文档说明][4]，完成后再回来这里。微软建议为了简单起见，将 WSL2 设置为发行版的默认设置。本指南假设你已经这样做了。

接下来，你将需要一些解压 xz 压缩文件的方法。你可以用另一个基于 WSL 的发行版来解压，或者使用 [7zip][5]。

### 下载 Fedora 33 rootfs

由于 Fedora 并没有提供实际的 rootfs 存档，所以我们将借用一个用于生成 Dockerhub 容器镜像的存档。你需要从 fedora-cloud 的 GitHub 仓库下载该 [tar.xz 文件][6] 。一旦你有了这个 tar.xz 文件，解压它，但不要展开 tar 包。你会得到一个类似 `fedora-33-时间标签.tar` 的文件。有了这个文件，你就可以构建镜像了。

### 组合 WSL Fedora 的构建版本

我喜欢使用 `c:\distros` 目录，但你可以选择几乎任何你想要的位置。无论你选择什么目录，在你导入该构建版本之前，确保其顶层路径存在。现在打开一个 CMD 或 Powershell 提示符，因为是时候导入了：

```
wsl.exe --import Fedora-33 c:\distros\Fedora-33 $HOME\Downloads\fedora-33.tar
```

你会看到 Fedora-33 显示在 WSL 的列表当中：

```
PS C:\Users\jperrin> wsl.exe -l -v
  NAME                   STATE           VERSION
  Fedora-33                 Stopped         2
```

下面，你就可以开始在 WSL 中摆弄 Fedora 了，但我们还需要做一些事情来使它真正成为一个有用的 WSL 发行版。

```
wsl -d Fedora-33
```

这将以 root 用户的身份启动 Fedora 的 WSL 实例。下面，你将安装一些核心包并设置一个新的默认用户。你还需要配置 `sudo`，否则你将无法在以后需要安装其他东西时轻松提升权限。

```
dnf update
dnf install wget curl sudo ncurses dnf-plugins-core dnf-utils passwd findutils
```

`wslutilites` 使用 `curl` 和 `wget` 来实现与 VS Code 的集成，所以它们很有用。由于你需要使用 COPR 仓库，你需要增加 `dnf` 功能。

### 添加你的用户

现在是时候添加你的用户，并将其设置为默认用户。

```
useradd -G wheel 用户名
passwd 用户名
```

现在，你已经创建了你的用户名，并添加了密码，确保它们可以工作。退出 WSL 实例，并再次启动它，这次指定用户名。你还要测试 `sudo`，并检查你的 uid。

```
wsl -d Fedora-33 -u 用户名
$id -u
1000
$ sudo cat /etc/shadow
```

假设一切正常，你现在已经准备好在 Windows 中为你的 Fedora 环境设置默认用户。要做到这一点，请退出 WSL 实例并回到 Powershell 中。这个 Powershell 单行代码可以正确配置你的用户：

```
Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\\*\ DistributionName | Where-Object -Property DistributionName -eq Fedora-33  | Set-ItemProperty -Name DefaultUid -Value 1000
```

现在你应该可以再次启动 WSL，而不需要指定就可以成为自己的用户而不是 root。

### 自定义！

至此，你已经有了可以在 WSL 中运行的基本 Fedora 33 环境，但它还没有 Windows 集成的部分。如果你想要这个，有一个 COPR 仓库可以启用。如果你选择添加这部分，你就可以直接在 shell 里面运行 Windows 应用，也可以轻松地将你的 Linux 环境与 VS Code 集成。需要注意的是，COPR 并没有得到 Fedora 基础架构的官方支持。使用该软件包，风险自担。

```
dnf copr enable trustywolf/wslu
```

现在你可以去配置终端、设置一个 Python 开发环境，或者其它你想使用 Fedora 33 的方式。享受吧！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/wsl-fedora-33/

作者：[Jim Perrin][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jperrin/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/wsl-fedora33-816x345.jpg
[2]: https://unsplash.com/@matthias_heil?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/windows?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[5]: https://www.7-zip.org/download.html
[6]: https://github.com/fedora-cloud/docker-brew-fedora/tree/33/x86_64
