Ubunsys：面向 Ubuntu 资深用户的一个高级系统配置工具
======

![](https://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-4-1-720x340.png)


**Ubunsys** 是一个面向 Ubuntu 及其衍生版的基于 Qt 的高级系统工具。高级用户可以使用命令行轻松完成大多数配置。不过为了以防万一某天，你突然不想用命令行了，就可以用 Ubnusys 这个程序来配置你的系统或其衍生系统，如 Linux Mint、Elementary OS 等。Ubunsys 可用来修改系统配置，安装、删除、更新包和旧内核，启用或禁用 `sudo` 权限，安装主线内核，更新软件安装源，清理垃圾文件，将你的 Ubuntu 系统升级到最新版本等等。以上提到的所有功能都可以通过鼠标点击完成。你不需要再依赖于命令行模式，下面是你能用 Ubunsys 做到的事：

  * 安装、删除、更新包
  * 更新和升级软件源
  *  安装主线内核
  *  删除旧的和不再使用的内核
  *  系统整体更新
  *  将系统升级到下一个可用的版本
  *  将系统升级到最新的开发版本
  * 清理系统垃圾文件
  *  在不输入密码的情况下启用或者禁用 `sudo` 权限
  * 当你在终端输入密码时使 `sudo` 密码可见
  *  启用或禁用系统休眠
  *  启用或禁用防火墙 
  *  打开、备份和导入 `sources.list.d` 和 `sudoers` 文件
  *  显示或者隐藏启动项
  *  启用或禁用登录音效
  *  配置双启动
  *  启用或禁用锁屏
  *  智能系统更新
  *  使用脚本管理器更新/一次性执行脚本
  * 从 `git` 执行常规用户安装脚本
  *  检查系统完整性和缺失的 GPG 密钥
  *  修复网络
  *  修复已破损的包
  *  还有更多功能在开发中

**重要提示：** Ubunsys 不适用于 Ubuntu 新手。它很危险并且仍然不是稳定版。它可能会使你的系统崩溃。如果你刚接触 Ubuntu 不久，不要使用。但如果你真的很好奇这个应用能做什么，仔细浏览每一个选项，并确定自己能承担风险。在使用这一应用之前记着备份你自己的重要数据。

### 安装 Ubunsys

Ubunsys 开发者制作了一个 PPA 来简化安装过程，Ubunsys 现在可以在 Ubuntu 16.04 LTS、 Ubuntu 17.04 64 位版本上使用。

逐条执行下面的命令，将 Ubunsys 的 PPA 添加进去，并安装它。

```
sudo add-apt-repository ppa:adgellida/ubunsys
sudo apt-get update
sudo apt-get install ubunsys
```

如果 PPA 无法使用，你可以在[发布页面][1]根据你自己当前系统，选择正确的安装包，直接下载并安装 Ubunsys。

### 用途

一旦安装完成，从菜单栏启动 Ubunsys。下图是 Ubunsys 主界面。

![][3]

你可以看到，Ubunsys 有四个主要部分，分别是 Packages、Tweaks、System 和 Repair。在每一个标签项下面都有一个或多个子标签项以对应不同的操作。

**Packages**

这一部分允许你安装、删除和更新包。

![][4]

**Tweaks**

在这一部分，我们可以对系统进行多种调整，例如：

  * 打开、备份和导入 `sources.list.d` 和 `sudoers` 文件；
  * 配置双启动；
  * 启用或禁用登录音效、防火墙、锁屏、系统休眠、`sudo` 权限（在不需要密码的情况下）同时你还可以针对某一用户启用或禁用 `sudo` 权限（在不需要密码的情况下）；
  * 在终端中输入密码时可见（禁用星号）。

![][5]

**System**

这一部分被进一步分成 3 个部分，每个都是针对某一特定用户类型。

**Normal user** 这一标签下的选项可以：

  * 更新、升级包和软件源
  * 清理系统
  * 执行常规用户安装脚本

**Advanced user** 这一标签下的选项可以：

* 清理旧的/无用的内核
* 安装主线内核
* 智能包更新
* 升级系统

**Developer** 这一部分可以将系统升级到最新的开发版本。

![][6]

**Repair**

这是 Ubunsys 的第四个也是最后一个部分。正如名字所示，这一部分能让我们修复我们的系统、网络、缺失的 GPG 密钥，和已经缺失的包。

![][7]

正如你所见，Ubunsys 可以在几次点击下就能完成诸如系统配置、系统维护和软件维护之类的任务。你不需要一直依赖于终端。Ubunsys 能帮你完成任何高级任务。再次声明，我警告你，这个应用不适合新手，而且它并不稳定。所以当你使用的时候，能会出现 bug 或者系统崩溃。在仔细研究过每一个选项的影响之后再使用它。

谢谢阅读！

### 参考资源

- [Ubunsys GitHub Repository][8]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ubunsys-advanced-system-configuration-utility-ubuntu-power-users/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/adgellida/ubunsys/releases
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-2.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-5.png
[6]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-9.png
[7]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-11.png
[8]:https://github.com/adgellida/ubunsys