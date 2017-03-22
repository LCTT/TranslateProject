ELRepo - Enterprise Linux （RHEL、CentOS 及 SL）的社区仓库
============================================================

如果你正在使用 Enterprise Linux 发行版（Red Hat Enterprise Linux 或其衍生产品，如 CentOS 或 Scientific Linux），并且需要对特定硬件或新硬件支持，那么你找对地方了。

在本文中，我们将讨论如何启用 ELRepo 仓库，该软件源包含文件系统驱动以及网络摄像头驱动程序等等（支持显卡、网卡、声音设备甚至[新内核][1]）

### 在 Enterprise Linux 中启用 ELRepo

虽然 ELRepo 是第三方仓库，但它有 Freenode（#elrepo）上的一个活跃社区以及用户邮件列表的良好支持。

如果你仍然对在软件源中添加一个独立的仓库表示担心，请注意 CentOS 已在它的 wiki（[参见此处][2]）将它列为是可靠的。如果你仍然有疑虑，请随时在评论中提问！

需要注意的是 ELRepo 不仅提供对 Enterprise Linux 7 提供支持，还支持以前的版本。考虑到 CentOS 5 在本月底（2017 年 3 月）结束支持（EOL），这可能看起来并不是一件很大的事，但请记住，CentOS 6 的 EOL 不会早于 2020 年 3 月之前。

不管你用的 EL 是何版本，在实际启用时需要先导入 GPG 密钥：

```
# rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
```

**在 EL5 中启用 ELRepo：**

```
# rpm -Uvh http://www.elrepo.org/elrepo-release-5-5.el5.elrepo.noarch.rpm
```

**在 EL6 中启用 ELRepo：**

```
# rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm
```

**在 EL7 中启用 ELRepo：**

```
# rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
```

这篇文章只会覆盖 EL7，在接下来的小节中分享几个例子。

### 理解 ELRepo 频道

为了更好地组织仓库中的软件，ELRepo 共分为 4 个独立频道：

* elrepo 是主频道，默认情况下启用。它不包含正式发行版中的包。
* elrepo-extras 包含可以替代发行版提供的软件包。默认情况下不启用。为了避免混淆，当需要从该仓库中安装或更新软件包时，可以通过以下方式临时启用该频道（将软件包替换为实际软件包名称）：`# yum --enablerepo=elrepo-extras install package`
* elrepo-testing 提供将放入主频道中，但是仍在测试中的软件包。
* elrepo-kernel 提供长期及稳定的主线内核，它们已经特别为 EL 配置过。

默认情况下，elrepo-testing 和 elrepo-kernel 都被禁用，如果我们[需要从中安装或更新软件包][3]，可以像 elrepo-extras 那样启用它们。

要列出每个频道中的可用软件包，请运行以下命令之一：

```
# yum --disablerepo="*" --enablerepo="elrepo" list available
# yum --disablerepo="*" --enablerepo="elrepo-extras" list available
# yum --disablerepo="*" --enablerepo="elrepo-testing" list available
# yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
```

下面的图片说明了第一个例子：

[
 ![List ELRepo Available Packages](http://www.tecmint.com/wp-content/uploads/2017/03/List-ELRepo-Available-Packages.png) 
][4]

*列出 ELRepo 可用的软件包*

##### 总结

本篇文章中，我们已经解释 ELRepo 是什么，以及你从如何将它们添加到你的软件源。

如果你对本文有任何问题或意见，请随时在评论栏中联系我们。我们期待你的回音！

--------------------------------------------------------------------------------

作者简介：

Gabriel Cánepa - 一位来自阿根廷圣路易斯梅塞德斯镇 (Villa Mercedes, San Luis, Argentina) 的 GNU/Linux 系统管理员，Web 开发者。就职于一家世界领先级的消费品公司，乐于在每天的工作中能使用 FOSS 工具来提高生产力。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/enable-elrepo-in-rhel-centos-scientific-linux/

作者：[Gabriel Cánepa][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/install-upgrade-kernel-version-in-centos-7/
[2]:https://wiki.centos.org/AdditionalResources/Repositories
[3]:http://www.tecmint.com/auto-install-security-patches-updates-on-centos-rhel/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/List-ELRepo-Available-Packages.png
[5]:http://www.tecmint.com/author/gacanepa/
[6]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:http://www.tecmint.com/free-linux-shell-scripting-books/
