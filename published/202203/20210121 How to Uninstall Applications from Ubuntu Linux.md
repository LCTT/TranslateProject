[#]: collector: (lujun9972)
[#]: translator: (amagicboy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14398-1.html)
[#]: subject: (How to Uninstall Applications from Ubuntu Linux)
[#]: via: (https://itsfoss.com/uninstall-programs-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

初级：Ubuntu 中怎么卸载 Linux 应用
=======

![](https://img.linux.net.cn/data/attachment/album/202203/26/151617chxhdszd0lcpcpkz.jpg)

不再使用某个应用程序了？删除它吧。

卸载不再使用的应用是 [最简单释放磁盘空间的方法][1] ，而且可以使系统保持整洁。

在此篇入门教程中，我会介绍几种不同在 Ubuntu 上卸载应用程序的方法。

在 Ubuntu 中有几种方法 [安装应用][2] ，同意也有以下几种方法卸载应用：

- 从 Ubuntu <ruby>软件中心<rt>Software Center</rt></ruby> 卸载应用（桌面用户）
- 用 `apt remove` 命令卸载应用
- 用命令行中删除 Snap 应用（中级到高级用户）    

让我们来一个一个了解这些方法。
  
### 方法 1：用 Ubuntu 软件中心卸载应用

在左侧栏或者菜单中找到 Ubuntu <ruby>软件中心<rt>Software Center</rt></ruby>，打开它。

![][3]

在 <ruby>已安装<rt>Installed</rt></ruby> 栏中列出了已安装的应用。

![][4]

如果你要找的应用不在 <ruby>已安装<rt>Installed</rt></ruby> 栏中，可以使用搜索查找应用。

![][5]

打开已经安装的应用，有一个 <ruby>移除<rt>Remove</rt></ruby> 选项，点击它。

![][6]

这会请求输入账户密码，输入后应用会在几秒内删除。

### 方法2：  Ubuntu 命令行卸载应用

安装应用时使用 `apt-get install` 或者 `apt install` 。
卸载应用时使用 `apt-get remove` 或者 `apt remove` ，而不是 `apt-get uninstall` 。

按照以下方式使用命令：

```
sudo apt remove program_name
```

执行此操作会请求你的账户密码。当输入密码时，屏幕上不会有提示。输入完后按下回车。

待删除的应用不会立刻被删除。你需要确认。当询问你的确认时，请输入回车或者按下 `Y`：

![][7]

请在命令行中输入准确的包的名字，不然会出现 “[不能找到软件包的错误][8]” 错误 。

不要担心记不住具体的应用名字，你可以使用超级有用的 Tab 补全应用名称。 Tab 是你必须知道的 [Linux 命令行技巧][9] 之一。

你只需要输入想要卸载应用的前几个字母，然后按下 `tab` ，会提示以这几个字母开头的已安装应用程序。

找到要卸载的应用名称，输入完整的应用名称然后卸载。

![][10]

如果不知道具体的应用名称或者开头字母，你可以 [列出 Ubuntu 中所有已安装的包][11] ，然后查找符合你记忆的应用名称。

比如，下图的命令会列出所有已安装的应用名称中包含 ‘my’ 的应用，不仅仅是以 ‘my’ 开头的应用。

```
apt list --installed | grep -i my
```

![][12]

这非常酷炫对不对？在 Ubuntu 中使用卸载命令时请注意应用名。

#### 补充：使用 apt purge 卸载应用（进阶用户）

当在 Ubuntu 中卸载应用时，应用程序会被卸载，但是会留下细小的、修改过的用户配置文件。这些文件是故意被留下的，因为当你再次安装同样的应用时，会使用这些遗留的配置文件。

如果你想完全卸载应用，你可以使用 `apt purge` 命令代替 `apt remove` 命令，或者在 `apt remove` 命令后再使用它。

```
sudo apt purge program_name
```

注意 `apt purge` 令不会删除保存在用户目录下的数据或者配置文件。

### 方法3： Ubuntu 中卸载 Snap 应用

前面的几种方式可用于使用 `apt` 命令、<ruby>软件中心<rt>Software Center</rt></ruby>或者直接使用 deb 文件安装的应用。

Ubuntu 也推出了一个名为 [Snap][13] 的包管理系统。在<ruby>软件中心<rt>Software Center</rt></ruby>中的大部分应用都是 Snap 包格式。

你可以使用 <ruby>软件中心<rt>Software Center</rt></ruby> 轻松地卸载这些应用，也可以使用命令行卸载。

列出所有已经安装的 Snap 包名字：

```
snap list
```

![][14]

选择你想要卸载的应用，然后卸载，这不会要求你确认是否删除。

```
sudo snap remove package_name
```

### 妙招：用一个神奇的命令清理系统

到此你已经学会怎么卸载应用，现在使用一个简单的命令清理卸载残留，比如不再用到的依赖或 Linux 内核头文件。

在终端输入如下命令：

```
sudo apt autoremove
```

这条命令很安全，而且会释放几百 MB 的磁盘空间。

### 总结

本文一共介绍了三种卸载应用的方法，包括通过图形界面卸载、命令行卸载，以便你了解所有方式。

希望此篇教程对 Ubuntu 初学者有所帮助，欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/uninstall-programs-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[amagicowboy](https://github.com/amagicboy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/free-up-space-ubuntu-linux/
[2]: https://itsfoss.com/remove-install-software-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/06/ubuntu_software_applications_menu.jpg?resize=800%2C390&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/installed-apps-ubuntu.png?resize=800%2C455&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/search-installed-apps-ubuntu.png?resize=800%2C455&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/remove-applications-ubuntu.png?resize=800%2C487&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/apt-remove-program-ubuntu.png?resize=768%2C424&ssl=1
[8]: https://itsfoss.com/unable-to-locate-package-error-ubuntu/
[9]: https://itsfoss.com/linux-command-tricks/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/remove-package-ubuntu-linux.png?resize=768%2C424&ssl=1
[11]: https://itsfoss.com/list-installed-packages-ubuntu/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/search-list-installed-apps-ubuntu.png?resize=768%2C424&ssl=1
[13]: https://itsfoss.com/install-snap-linux/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/list-snap-remove.png?resize=800%2C407&ssl=1
