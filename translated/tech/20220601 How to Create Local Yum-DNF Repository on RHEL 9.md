[#]: subject: "How to Create Local Yum/DNF Repository on RHEL 9"
[#]: via: "https://www.linuxtechi.com/create-local-yum-dnf-repository-rhel/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 RHEL 9 上创建本地 Yum/DNF 仓库
======
你好，技术人员，最近红帽发布了最新的操作系统 RHEL 9，RHEL 9 满足了混合云的所有要求。它可以安装在物理服务器、虚拟机和容器镜像中。

当我们没有订阅的时候，想安装软件包来做 POC，那么设置本地的 yum 或 dnf 仓库将是很方便的。

在本指南中，我们将介绍如何在 RHEL 9 上使用 DVD 或 ISO 文件一步一步地创建本地 yum/dnf 资源库。

创建本地 yum/dnf 资源库的先决条件:

* 最小化安装 RHEL 9 系统
* 具有管理权限的 sudo 用户
* RHEL 9 DVD 或 ISO 文件

### 1）挂载 RHEL 9 ISO 文件或 DVD

我们假设 RHEL 9 iso 文件已经被复制到系统中。运行下面的挂载命令，将 ISO 文件挂载到 /opt/repo 文件夹。

```
$ sudo mkdir /var/repo
$ sudo mount -o loop rhel-baseos-9.0-x86_64-dvd.iso /var/repo/
```

![Mount-RHEL9-ISO-File-Command][1]

如果是 dvd，运行：

```
$ sudo mount /dev/sr0 /var/repo/
```

### 2）在 “/etc/yum.repos.d/” 目录中创建仓库文件

在 /etc/yum.repos.d/ 目录下创建一个名为 “rhel9-local.repo” 的仓库文件，内容如下：

```
$ sudo vi /etc/yum.repos.d/rhel9-local.repo
[Local-BaseOS]
name=Red Hat Enterprise Linux 9 - BaseOS
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///var/repo//BaseOS/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

[Local-AppStream]
name=Red Hat Enterprise Linux 9 - AppStream
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///var/repo//AppStream/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
```

保存并关闭该文件。

![RHEL8-Local-Repo-File][2]

### 3）刷新 yum/dnf 和订阅管理器的缓存

执行以下命令来清理 yum 或 dnf 和订阅管理器的缓存。

```
$ sudo dnf clean all
$ sudo subscription-manager clean
```

![DNF-Subscription-Manager-Clean][3]

在上面的输出中，我们得到一个警告信息 “This system is not registered with an entitlement”（系统没有注册权限）。所以，为了抑制这个警告信息，编辑文件 “/etc/yum/pluginconf.d/subscription-manager.conf”，将参数 “enabled=1” 改为 “enabled=0”。

```
$ sudo vi /etc/yum/pluginconf.d/subscription-manager.conf
```

![Disable-Subscription-Parameter-RHEL-9][4]

保存并退出该文件。

### 4）使用本地仓库安装软件包

现在我们都准备好测试我们的本地仓库了。运行下面的命令来查看配置仓库。

```
$ sudo dnf repolist
```

输出：

![DNF-Repolist-RHEL-9][5]

现在，试试用 dnf 命令通过上面配置的本地仓库安装软件包。

```
$ sudo dnf install nfs-utils
```

输出：

![Install-RPM-Package-via-local-repo-rhel9][6]

![Package-Installation-Completion-RHEL9-DNF-Command][7]

完美，上述输出证实了 nfs-utils 包及其依赖项已经通过本地配置的 yum 或 dnf 仓库成功安装。

这就是本指南的全部内容。我希望你觉得它有参考价值。请在下面的评论区发表你的疑问和反馈。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/create-local-yum-dnf-repository-rhel/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Mount-RHEL9-ISO-File-Command.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/06/RHEL8-Local-Repo-File.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/06/DNF-Subscription-Manager-Clean.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Disable-Subscription-Parameter-RHEL-9.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/06/DNF-Repolist-RHEL-9.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Install-RPM-Package-via-local-repo-rhel9.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Package-Installation-Completion-RHEL9-DNF-Command.png
