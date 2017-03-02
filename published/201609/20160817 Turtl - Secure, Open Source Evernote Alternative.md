Turtl：安全、开源的 Evernote 替代品
=============================

Turtl 是一个安全、开源的 Evernote 替代品，在Linux、Windows、Mac 和 Android 等系统上都能使用。iOS版本仍在开发当中，Firefox 和 Chrome 也有扩展程序可以使用。

![](https://3.bp.blogspot.com/-cNoUUjaU4A0/V7MFKCasZJI/AAAAAAAAYTk/r7oWe-z_HB87hDvlKLViiiHUMfagnC6LQCLcB/s400/turtl-desktop-linux.png)

这个产品仍在测试阶段，它能够让你把你的笔记（便签编辑器支持 Markdown）、网站书签、密码、文档、图片等单独放在一个隐秘地方。

笔记可以按模块组织起来，支持嵌套，也可以和其他 Turtl 用户分享。

![](https://2.bp.blogspot.com/-G-Ln3T1c2QA/V7MFmrqkukI/AAAAAAAAYTs/dXMPEB9MPREicixlEJlQVqg9SFjBX1pwgCLcB/s400/turtl-boards.png)

你可以给你的笔记打上标签。Turtl 通过创建时间、最后修改时间或者标签来找你的笔记。

这个是便签编辑器（文件便签）：

![](https://1.bp.blogspot.com/-8cNHV69iCWM/V7MFX7sBlMI/AAAAAAAAYTo/ZUVTYwiCSy8uzrVKdf6NcsQZlHtylIyvgCEw/s400/turtl-edit-note.png)

那么安全性如何呢？Turtl 会在保存数据之前加密，使用的是一个加密密钥，而密码并不保存在服务器上。只有你和你想要分享的人能获取数据。你可以从[这里][1]获得更多关于 Turtl 安全和加密的信息。

更新（感谢 Dimitry！）：根据[错误反馈][2]，Turtl 有个严重的安全性问题。Turtl 允许创建多个相同用户名的账号，却只使用密码来区分它们。希望能马上修复这个问题。

Turtl 团队提供了一个托管服务来同步你的记录，它是完全免费的，”除非你的文件足够大，或者你需要更好的服务”，在我写这篇文章的时候这个高级服务还不能用。

并且你也不一定要用这个托管服务，因为就像其桌面应用和手机应用一样，这个自托管服务器也是一个自由、开源的软件，所以你可以自己搭建一个 [Turtl 服务器][3]。

Turtl 没有像 Evernote 那么多的功能，但它在它的[计划][4]中也有一些新的功能，比如：支持导入/导出文本和Evernote 格式的数据、原生支持 PDF 阅读器、界面锁定等。

不得不提醒的是，每次启动都要输入密码，虽然安全，但有时候实在是麻烦。

###下载 Turtl

[下载 Turtl 应用][5]（二进制文件支持 Linux （32位/64位）、Windows 64 位、Mac 64位、Android，以及 Chrome 和Firefox 浏览器插件）

**更新**：Turtl 用了一个新的服务器，注销然后在登录框的下面选择高级设置，把 Turtl 服务器设置为 "https://api.turtlapp.com/v2"（没有引号）。

下载源代码（桌面应用、移动应用和服务器）、反馈问题等，参见 Turtl 的 [GitHub][6] 项目站点。

Arch Linux 用户可以通过 [AUR][7] 来安装 Turtl。

要在 Linux 上安装，把安装包解压后运行 install.sh，安装之前请确保 ~/.local/share/applications 目录存在，若不存在请自行创建：

```
mkdir -p ~/.local/share/applications
```

注意：如果使用 sudo 命令安装，那么只有 root 用户才能使用。所以，要么不用 sudo 命令安装，要么在安装完成后修改权限。你可以参考[AUR 软件包的设置][8]来了解如何修改权限。

使用如下命令把 Turtl 安装到 ~/turtl 文件夹下（假定你已经把安装包解压在你的家目录下了）：

````
~/turtl-*/install.sh ~/turtl
```

可以使用 ~/.turtl 代替 ~/turtl 把 Turtl 安装到你的家目录的隐藏文件夹下。你也可以用些小技巧把它隐藏起来。

如果 Turtl 没有在你的 Unity Dash 上显示出来，请注销/登录以重启会话。

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/08/turtl-secure-open-source-evernote.html

作者：[Andrew][a]
译者：[chisper](https://github.com/chisper)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.webupd8.org/p/about.html
[1]: https://turtl.it/docs/security/
[2]: https://github.com/turtl/api/issues/20
[3]: https://turtl.it/docs/server/
[4]: https://trello.com/b/yIQGkHia/turtl-product-dev
[5]: https://turtl.it/download/
[6]: https://github.com/turtl
[7]: https://aur.archlinux.org/packages/turtl/
[8]: https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=turtl
[9]: https://turtlapp.com/
