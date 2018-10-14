ndm：NPM 的桌面 GUI 程序
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/ndm-3-720x340.png)

NPM 是 **N**ode **P**ackage **M**anager （node 包管理器）的缩写，它是用于安装 NodeJS 软件包或模块的命令行软件包管理器。我们发布过一个指南描述了如何[使用 NPM 管理 NodeJS 包][1]。你可能已经注意到，使用 Npm 管理 NodeJS 包或模块并不是什么大问题。但是，如果你不习惯用 CLI 的方式，这有一个名为 **NDM** 的桌面 GUI 程序，它可用于管理 NodeJS 程序/模块。 NDM，代表 **N**PM **D**esktop **M**anager （npm 桌面管理器），是 NPM 的自由开源图形前端，它允许我们通过简单图形桌面安装、更新、删除 NodeJS 包。

在这个简短的教程中，我们将了解 Linux 中的 Ndm。

### 安装 NDM

NDM 在 AUR 中可用，因此你可以在 Arch Linux 及其衍生版（如 Antergos 和 Manjaro Linux）上使用任何 AUR 助手程序安装。

使用 [Pacaur][2]：

```
$ pacaur -S ndm
```

使用 [Packer][3]：

```
$ packer -S ndm
```

使用 [Trizen][4]：

```
$ trizen -S ndm
```

使用 [Yay][5]：

```
$ yay -S ndm
```

使用 [Yaourt][6]：

```
$ yaourt -S ndm
```

在基于 RHEL 的系统（如 CentOS）上，运行以下命令以安装 NDM。

```
$ echo "[fury] name=ndm repository baseurl=https://repo.fury.io/720kb/ enabled=1 gpgcheck=0" | sudo tee /etc/yum.repos.d/ndm.repo && sudo yum update &&
```

在 Debian、Ubuntu、Linux Mint：

```
$ echo "deb [trusted=yes] https://apt.fury.io/720kb/ /" | sudo tee /etc/apt/sources.list.d/ndm.list && sudo apt-get update && sudo apt-get install ndm
```

也可以使用 **Linuxbrew** 安装 NDM。首先，按照以下链接中的说明安装 Linuxbrew。

安装 Linuxbrew 后，可以使用以下命令安装 NDM：

```
$ brew update
$ brew install ndm
```

在其他 Linux 发行版上，进入 [NDM 发布页面][7]，下载最新版本，自行编译和安装。

### NDM 使用

从菜单或使用应用启动器启动 NDM。这就是 NDM 的默认界面。

![][9]

在这里你可以本地或全局安装 NodeJS 包/模块。

#### 本地安装 NodeJS 包

要在本地安装软件包，首先通过单击主屏幕上的 “Add projects” 按钮选择项目目录，然后选择要保留项目文件的目录。例如，我选择了一个名为 “demo” 的目录作为我的项目目录。

单击项目目录（即 demo），然后单击 “Add packages” 按钮。

![][10]

输入要安装的软件包名称，然后单击 “Install” 按钮。

![][11]

安装后，软件包将列在项目目录下。只需单击该目录即可在本地查看已安装软件包的列表。

![][12]

同样，你可以创建单独的项目目录并在其中安装 NodeJS 模块。要查看项目中已安装模块的列表，请单击项目目录，右侧将显示软件包。

#### 全局安装 NodeJS 包

要全局安装 NodeJS 包，请单击主界面左侧的 “Globals” 按钮。然后，单击 “Add packages” 按钮，输入包的名称并单击 “Install” 按钮。

#### 管理包

单击任何已安装的包，不将在顶部看到各种选项，例如：

1. 版本（查看已安装的版本），
2. 最新（安装最新版本），
3. 更新（更新当前选定的包），
4. 卸载（删除所选包）等。

![][13]

NDM 还有两个选项，即 “Update npm” 用于将 node 包管理器更新成最新可用版本， 而 “Doctor” 会运行一组检查以确保你的 npm 安装有所需的功能管理你的包/模块。

### 总结

NDM 使安装、更新、删除 NodeJS 包的过程更加容易！你无需记住执行这些任务的命令。NDM 让我们在简单的图形界面中点击几下鼠标即可完成所有操作。对于那些懒得输入命令的人来说，NDM 是管理 NodeJS 包的完美伴侣。

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ndm-a-desktop-gui-application-for-npm/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/manage-nodejs-packages-using-npm/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[5]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:https://github.com/720kb/ndm/releases
[8]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[9]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-1.png
[10]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-5-1.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-6.png
[12]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-7.png
[13]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-8.png
