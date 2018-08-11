如何在 Linux 中使用一个命令升级所有软件
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/topgrade-720x340.png)

众所周知，让我们的 Linux 系统保持最新状态会用到多种包管理器。比如说，在 Ubuntu 中，你无法使用 `sudo apt update` 和 `sudo apt upgrade` 命令升级所有软件。此命令仅升级使用 APT 包管理器安装的应用程序。你有可能使用 `cargo`、[pip][1]、`npm`、`snap` 、`flatpak` 或 [Linuxbrew][2] 包管理器安装了其他软件。你需要使用相应的包管理器才能使它们全部更新。

再也不用这样了！跟 `topgrade` 打个招呼，这是一个可以一次性升级系统中所有软件的工具。

你无需运行每个包管理器来更新包。这个 `topgrade` 工具通过检测已安装的软件包、工具、插件并运行相应的软件包管理器来更新 Linux 中的所有软件，用一条命令解决了这个问题。它是自由而开源的，使用 **rust 语言**编写。它支持 GNU/Linux 和 Mac OS X.

### 在 Linux 中使用一个命令升级所有软件

`topgrade` 存在于 AUR 中。因此，你可以在任何基于 Arch 的系统中使用 [Yay][3] 助手程序安装它。

```
$ yay -S topgrade
```

在其他 Linux 发行版上，你可以使用 `cargo` 包管理器安装 `topgrade`。要安装 cargo 包管理器，请参阅以下链接：

- [在 Linux 安装 rust 语言][12]

然后，运行以下命令来安装 `topgrade`。

```
$ cargo install topgrade
```

安装完成后，运行 `topgrade` 以升级 Linux 系统中的所有软件。

```
$ topgrade
```

一旦调用了 `topgrade`，它将逐个执行以下任务。如有必要，系统会要求输入 root/sudo 用户密码。

1、 运行系统的包管理器：

  * Arch：运行 `yay` 或者回退到 [pacman][4]
  * CentOS/RHEL：运行 `yum upgrade`
  * Fedora ：运行 `dnf upgrade`
  * Debian/Ubuntu：运行 `apt update` 和 `apt dist-upgrade`
  * Linux/macOS：运行 `brew update` 和 `brew upgrade`

2、 检查 Git 是否跟踪了以下路径。如果有，则拉取它们：

  * `~/.emacs.d` （无论你使用 Spacemacs 还是自定义配置都应该可用）
  * `~/.zshrc`
  * `~/.oh-my-zsh`
  * `~/.tmux`
  * `~/.config/fish/config.fish`
  * 自定义路径

3、 Unix：运行 `zplug` 更新

4、 Unix：使用 TPM 升级 `tmux` 插件

5、 运行 `cargo install-update`

6、 升级 Emacs 包

7、 升级 Vim 包。对以下插件框架均可用：

  * NeoBundle
  * [Vundle][5]
  * Plug

8、 升级 [npm][6] 全局安装的包

9、 升级 Atom 包

10、 升级 [Flatpak][7] 包

11、 升级 [snap][8] 包

12、 Linux：运行 `fwupdmgr` 显示固件升级。 （仅查看​​。实际不会执行升级）

13、 运行自定义命令。

最后，`topgrade` 将运行 `needrestart` 以重新启动所有服务。在 Mac OS X 中，它会升级 App Store 程序。

我的 Ubuntu 18.04 LTS 测试环境的示例输出：

![][10]

好处是如果一个任务失败，它将自动运行下一个任务并完成所有其他后续任务。最后，它将显示摘要，其中包含运行的任务数量，成功的数量和失败的数量等详细信息。

![][11]

**建议阅读：**

就个人而言，我喜欢创建一个像 `topgrade` 程序的想法，并使用一个命令升级使用各种包管理器安装的所有软件。我希望你也觉得它有用。还有更多的好东西。敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-upgrade-everything-using-a-single-command-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/manage-python-packages-using-pip/
[2]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[3]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]:https://www.ostechnix.com/getting-started-pacman/
[5]:https://www.ostechnix.com/manage-vim-plugins-using-vundle-linux/
[6]:https://www.ostechnix.com/manage-nodejs-packages-using-npm/
[7]:https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/
[8]:https://www.ostechnix.com/install-snap-packages-arch-linux-fedora/
[9]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]:http://www.ostechnix.com/wp-content/uploads/2018/06/topgrade-1.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/06/topgrade-2.png
[12]:https://www.ostechnix.com/install-rust-programming-language-in-linux/