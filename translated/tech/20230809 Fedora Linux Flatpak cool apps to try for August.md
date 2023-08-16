[#]: subject: "Fedora Linux Flatpak cool apps to try for August"
[#]: via: "https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-august/"
[#]: author: "Eduard Lucena https://fedoramagazine.org/author/x3mboy/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Linux Flatpak 八月份值得尝试的酷炫应用
======

![][1]

照片由 [Joanna Kosinska][2] 在 [Unsplash][3] 上发布（[已编辑]）

本文介绍了 Flathub 中可用的项目以及安装说明。

[Flathub][4] 是获取和分发适用于所有 Linux 的应用的地方。它由 Flatpak 提供支持，允许 Flathub 应用在几乎任何 Linux 发行版上运行。

请阅读 “[Flatpak 入门][5]”。为了启用 flathub 作为你的 flatpak 提供商，请使用 [flatpak 站点][6]上的说明。

### Authenticator

[Authenticator][7] 是一个简单的应用，可让你生成双因素身份验证代码。它有一个非常简单和优雅的界面，支持很多算法和方法。它的一些特点是：

  * 基于时间/基于计数器/Steam 方法支持
  * SHA-1/SHA-256/SHA-512 算法支持
  * 使用相机或截图扫描二维码
  * 使用密码锁定应用
  * 从已知应用备份/恢复到 FreeOTP+、Aegis（加密/纯文本）和 OTP、Google Authenticator



你可以通过单击站点上的安装按钮或手动使用以下命令来安装 “Authenticator”：

```

    flatpak install flathub com.belmoussaoui.Authenticator

```

### Secrets

[Secrets][8] 是一个与 GNOME 集成的密码管理器。它易于使用并使用 KeyPass 文件格式。它的一些特点是：

  * 支持的加密算法：
     * AES 256 位
     * Twofish 256 位
     * ChaCha20 256 位
  * 支持的衍生算法：
     * Argon2 KDBX4
     * Argon2id KDBX4
     * AES-KDF KDBX 3.1
  * 创建或导入 KeePass safe
  * 将附件添加到你的加密数据库
  * 生成高强度加密的密码
  * 快速搜索你喜爱的条目
  * 不活动时自动锁定数据库
  * 支持双因素认证


你可以通过单击站点上的安装按钮或手动使用以下命令来安装 “Secrets”：

```

    flatpak install flathub org.gnome.World.Secrets

```

### Flatsweep

[Flatsweep][9] 是一个简单的应用，用于在 Flatpak 卸载后删除残留文件。它使用 GTK4 和 Libadwaita 提供一致的用户界面，与 GNOME 很好地集成，但你可以在任何桌面环境中使用它。

你可以通过单击站点上的安装按钮或手动使用以下命令来安装 “Flatsweep”：

```

    flatpak install flathub io.github.giantpinkrobots.flatsweep

```

### Solanum

Solanum 是一款使用[番茄工作法][10]的时间跟踪应用。它使用 GTK4，其界面与 GNOME 很好地集成。

你可以通过单击站点上的安装按钮或手动使用以下命令来安装 “Solanum”：

```

    flatpak install flathub org.gnome.Solanum

```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-august/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/08/flatpak_cool_app_august-816x345.jpg
[2]: https://unsplash.com/@joannakosinska?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/photos/mjC9apK53a8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://flathub.org
[5]: https://fedoramagazine.org/getting-started-flatpak/
[6]: https://flatpak.org/setup/Fedora
[7]: https://flathub.org/apps/com.belmoussaoui.Authenticator
[8]: https://flathub.org/apps/org.gnome.World.Secrets
[9]: https://flathub.org/apps/io.github.giantpinkrobots.flatsweep
[10]: https://en.wikipedia.org/wiki/Pomodoro_Technique
