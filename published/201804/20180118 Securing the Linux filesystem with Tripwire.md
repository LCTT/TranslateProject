使用 Tripwire 保护 Linux 文件系统
======

> 如果恶意软件或其情况改变了你的文件系统，Linux 完整性检查工具会提示你。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/file_system.jpg?itok=pzCrX1Kc)

尽管 Linux 被认为是最安全的操作系统（排在 Windows 和 MacOS 之前），但它仍然容易受到 rootkit 和其他恶意软件的影响。因此，Linux 用户需要知道如何保护他们的服务器或个人电脑免遭破坏，他们需要采取的第一步就是保护文件系统。

在本文中，我们将看看 [Tripwire][1]，这是保护 Linux 文件系统的绝佳工具。Tripwire 是一个完整性检查工具，使得系统管理员、安全工程师和其他人能够检测系统文件的变更。虽然它不是唯一的选择（[AIDE][2] 和 [Samhain][3] 提供类似功能），但 Tripwire 可以说是 Linux 系统文件中最常用的完整性检查程序，并在 GPLv2 许可证下开源。

### Tripwire 如何工作

了解 Tripwire 如何运行对了解 Tripwire 在安装后会做什么有所帮助。Tripwire 主要由两个部分组成：策略和数据库。策略列出了完整性检查器应该生成快照的所有文件和目录，还创建了用于识别对目录和文件更改违规的规则。数据库由 Tripwire 生成的快照组成。

Tripwire 还有一个配置文件，它指定数据库、策略文件和 Tripwire 可执行文件的位置。它还提供两个加密密钥 —— 站点密钥和本地密钥 —— 以保护重要文件免遭篡改。站点密钥保护策略和配置文件，而本地密钥保护数据库和生成的报告。

Tripwire 会定期将目录和文件与数据库中的快照进行比较并报告所有的更改。

### 安装 Tripwire

要 Tripwire，我们需要先下载并安装它。Tripwire 适用于几乎所有的 Linux 发行版。你可以从 [Sourceforge][4] 下载一个开源版本，并如下根据你的 Linux 版本进行安装。

Debian 和 Ubuntu 用户可以使用 `apt-get` 直接从仓库安装 Tripwire。非 root 用户应该输入 `sudo` 命令通过 `apt-get` 安装 Tripwire。

```
sudo apt-get update
sudo  apt-get install tripwire  
```

CentOS 和其他基于 RPM 的发行版使用类似的过程。为了最佳实践，请在安装新软件包（如 Tripwire）之前更新仓库。命令 `yum install epel-release` 意思是我们想要安装额外的存储库。 （`epel` 代表 Extra Packages for Enterprise Linux。）

```
yum update
yum install epel-release
yum install tripwire  
```

此命令会在安装中运行让 Tripwire 有效运行所需的配置。另外，它会在安装过程中询问你是否使用密码。你可以两个选择都选择 “Yes”。

另外，如果需要构建配置文件，请选择 “Yes”。选择并确认站点密钥和本地密钥的密码。（建议使用复杂的密码，例如 `Il0ve0pens0urce` 这样的。）

### 建立并初始化 Tripwire 数据库

接下来，按照以下步骤初始化 Tripwire 数据库：

```
tripwire --init
```

你需要提供本地密钥密码才能运行这些命令。

### 使用 Tripwire 进行基本的完整性检查

你可以使用以下命令让 Tripwire 检查你的文件或目录是否已被修改。Tripwire 将文件和目录与数据库中的初始快照进行比较的能力依赖于你在活动策略中创建的规则。

```
tripwire  --check  
```

你还可以将 `-check` 命令限制为特定的文件或目录，如下所示：

```
tripwire   --check   /usr/tmp  
```

另外，如果你需要使用 Tripwire 的 `-check` 命令的更多帮助，该命令能够查阅 Tripwire 的手册：

```
tripwire  --check  --help  
```

### 使用 Tripwire 生成报告

要轻松生成每日系统完整性报告，请使用以下命令创建一个 crontab 任务：

```
crontab -e
```

之后，你可以编辑此文件（使用你选择的文本编辑器）来引入由 cron 运行的任务。例如，你可以使用以下命令设置一个 cron 任务，在每天的 5:40 将 Tripwire 的报告发送到你的邮箱：

```
40 5  *  *  *  usr/sbin/tripwire   --check
```

无论你决定使用 Tripwire 还是其他具有类似功能的完整性检查程序，关键问题都是确保你有解决方案来保护 Linux 文件系统的安全。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/securing-linux-filesystem-tripwire

作者：[Michael Kwaku Aboagye][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/revoks
[1]:https://www.tripwire.com/
[2]:http://aide.sourceforge.net/
[3]:http://www.la-samhna.de/samhain/
[4]:http://sourceforge.net/projects/tripwire
