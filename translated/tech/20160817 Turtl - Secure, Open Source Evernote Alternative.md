Turtl:安全、开源的Evernote替代品

Turtl是一个安全、开源的Evernote替代品，在Linux, Windows, Mac, and Android等系统上都能使用。iOS版本仍在开发当中，Firefox和Chrome也有扩展程序可以使用。

![](https://3.bp.blogspot.com/-cNoUUjaU4A0/V7MFKCasZJI/AAAAAAAAYTk/r7oWe-z_HB87hDvlKLViiiHUMfagnC6LQCLcB/s400/turtl-desktop-linux.png)

这个产品仍在测试阶段，能够让你把你的笔记，网站书签，密码，文档，图片单独放在一个隐秘地方。

笔记可以按模块组织起来，支持嵌套，也可以和其他Turtl用户分享。

![](https://2.bp.blogspot.com/-G-Ln3T1c2QA/V7MFmrqkukI/AAAAAAAAYTs/dXMPEB9MPREicixlEJlQVqg9SFjBX1pwgCLcB/s400/turtl-boards.png)

给你的笔记打上标签，这样Turtl就会通过创建时间，最后修改时间或者标签来找你的笔记。

这个是文本编辑器：

![](https://1.bp.blogspot.com/-8cNHV69iCWM/V7MFX7sBlMI/AAAAAAAAYTo/ZUVTYwiCSy8uzrVKdf6NcsQZlHtylIyvgCEw/s400/turtl-edit-note.png)

那么安全性如何呢？Turtl会在保存数据之前加密，。只有你和你想要分享的人能获取数据。你可以从这获得跟多关于Turtl安全和加密的信息[HERE][1]。

更新（感谢Dimitry！）：根据错误反馈[bug report][2]，Turtl有个严重的安全性问题。Turtl允许同一个用户名创建多个账号，却只使用密码来区分它们。希望能马上修复这个问题。

Turtl团队提供了一个主机服务来同步你的记录，它是完全免费的，”直到你的文件足够大，或者你需要更好的服务”，在我写这篇文章的时候这个服务还不能用。

并且你也不一定要用这个服务，因为它是一个免费，开源的软件，所以你可以自己搭建一个[Turtl server][3]。

Turtl没有像Evernote那么多的功能，但它也有一些新的功能[roadmap][4]，比如：支持导入/导出文本，Evernote格式的数据，支持PDF，界面锁定等。

不得不提醒的是，每次启动都要输入密码，虽然安全，但有时候实在是麻烦。

###下载Turtl

[Download Turtl application][5]  （Linux二进制文件-32bit or 64bit,Windows 64bit,Mac 64bit,Android,Chrome和Firefox浏览器插件）

**更新**：Turtl用了一个新的服务器，注销然后在登陆框的下面选择高级设置，把Turtl服务器设置为"https://api.turtlapp.com/v2"（没有引号）。

下载源代码，反馈问题等，参见Turtl的GitHub[GitHub][6]。

在Linux上安装，把安装包解压后运行install.sh，安装之前请确保~/.local/share/applications目录存在，若不存在请自行创建：

```
mkdir -p ~/.local/share/applications
```

注意：如果使用sudo命令安装那么只有root用户才能使用。所以，要么不用sudo命令安装，要么在安装完成后修改权限。你可以在这里[package][8]参考如何修改权限。

使用如下命令把Turtl安装到~/turtl文件夹下（假定你已经把安装包解压在你家目录下了）：

````
~/turtl-*/install.sh ~/turtl
```

可以使用~/.turtl代替~/turtl把Turtl安装到你家目录的隐藏文件夹下。你也可以用些小技巧把它隐藏起来。

如果Turtl没有在你的Unity Dash上显示出来，请注销/登陆以重启会话。

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/08/turtl-secure-open-source-evernote.html

作者：[Andrew ][a]
译者：[chisper](https://github.com/chisper)
校对：[校对者ID](https://github.com/校对者ID)

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
