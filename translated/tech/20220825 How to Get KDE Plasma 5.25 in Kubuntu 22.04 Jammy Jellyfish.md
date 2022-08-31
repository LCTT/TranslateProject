[#]: subject: "How to Get KDE Plasma 5.25 in Kubuntu 22.04 Jammy Jellyfish"
[#]: via: "https://www.debugpoint.com/kde-plasma-5-25-kubuntu-22-04/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Kubuntu 22.04 Jammy Jellyfish 中获取 KDE Plasma 5.25
======
KDE 开发人员现在启用了流行的反向移植 PPA，并对 KDE Plasma 5.25 进行了必要的更新，你现在可以将其安装在 Kubuntu 22.04 Jammy Jellyfish 中。下面是方法。

KDE Plasma 5.25 于 2022 年 6 月 14 日几天前发布，其中包含一些惊人的更新。在此版本中，你将获得**动态强调色**、改进的登录头像、**浮动面板**以及我们在[功能亮点文章][1] 中介绍的许多功能。

但是，如果你正在运行早在 2022 年 4 月发布的 [Kubuntu 22.04 Jammy Jellyfish][2]，那么你将拥有带有 KDE Framework 5.92 的 KDE Plasma 5.24。

你可能正在等待享受稳定的 Kubuntu 22.04 版本中的新功能，现在可以通过著名的反向移植 PPA 在 Kubuntu 22.04 中安装它。

### 如何在 Kubuntu 22.04 中安装 KDE Plasma 5.25

这是使用最新的 KDE Plasma 5.25 升级 Kubuntu 22.04 的方法。

#### GUI 方式

如果你对 KDE 的软件应用 Discover 感到满意，请打开该应用。然后进入 Settings > Sources 并添加 PPA `ppa:kubuntu-ppa/backports-extra`。然后单击更新。

#### 终端方法（推荐）

我建议你打开一个终端并进行此升级以更快地执行和安装。

* 打开 Konsole 并运行以下命令以添加[反向移植 PPA][3]。

```
sudo add-apt-repository ppa:kubuntu-ppa/backports-extra
```

![Upgrade Kubuntu 22.04 with KDE Plasma 5.25][4]

* 现在，通过运行以下命令刷新包列表。然后验证 5.25 包是否可用。

```
sudo apt update
```

```
apt list --upgradable | grep 5.25
```

![KDE Plasma 5.25 packages are available now][5]

最后，运行最后一个命令来启动升级。

```
sudo apt full-upgrade
```

总共下载大约 200 MB 的软件包。根据你的互联网连接速度，整个过程大约需要 10 分钟。

上述命令完成后，重新启动系统。

重启后，你应该会在 Kubuntu 22.04 LTS 中看到新的 KDE Plasma 5.25。

![KDE Plasma 5.25 in Kubuntu 22.04 LTS][6]

### 其他反向移植 PPA

请注意，[其他反向移植 PPA][7] `ppa:kubuntu-ppa/backports` 目前有 Plasma 5.24。因此，请勿使用与上面不同的 PPA。我不确定这个 PPA 是否会得到这个更新。

```
sudo add-apt-repository ppa:kubuntu-ppa/backports // 不要使用这个
```

### 如何卸载

在任何时候，如果你想回到 KDE Plasma 桌面的原始版本，那么你可以安装 ppa-purge 并删除 PPA，然后刷新包。

打开终端，依次执行以下命令。

```
sudo apt install ppa-purge
sudo ppa-purge ppa:kubuntu-ppa/backports-extra
sudo apt update
```

完成上述命令后，重启系统。

### 结束语

这就是全部了。一个漂亮而简单的步骤，将 Jammy Jellyfish 中的 KDE Plasma 升级到 Plasma 5.25。我希望你升级顺利。

如果您遇到任何错误，请在评论栏告诉我。

干杯。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/kde-plasma-5-25-kubuntu-22-04/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/kde-plasma-5-25/
[2]: https://www.debugpoint.com/kubuntu-22-04-lts/
[3]: https://launchpad.net/~kubuntu-ppa/+archive/ubuntu/backports-extra
[4]: https://www.debugpoint.com/wp-content/uploads/2022/08/Upgrade-Kubuntu-22.04-with-KDE-Plasma-5.25.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/08/KDE-Plasma-5.25-packages-are-available-now.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/08/KDE-Plasma-5.25-in-Kubuntu-22.04-LTS-1024x575.jpg
[7]: https://launchpad.net/~kubuntu-ppa/+archive/ubuntu/backports
