[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10789-1.html)
[#]: subject: (How to Install MySQL in Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-mysql-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

怎样在 Ubuntu Linux 上安装 MySQL
======

> 本教程教你如何在基于 Ubuntu 的 Linux 发行版上安装 MySQL。对于首次使用的用户，你将会学习到如何验证你的安装和第一次怎样去连接 MySQL。

[MySQL][1] 是一个典型的数据库管理系统。它被用于许多技术栈中，包括流行的  [LAMP][2] （Linux、Apache、MySQL、PHP）技术栈。它已经被证实了其稳定性。另一个让 MySQL 受欢迎的原因是它是开源的。

MySQL 是关系型数据库（基本上是表格数据）。以这种方式它很容易去存储、组织和访问数据。它使用SQL（结构化查询语言）来管理数据。

这这篇文章中，我将向你展示如何在 Ubuntu 18.04 安装和使用 MySQL 8.0。让我们一起来看看吧！

### 在 Ubuntu 上安装 MySQL

![][3]

我将会介绍两种在 Ubuntu 18.04 上安装 MySQL 的方法：

  1. 从 Ubuntu 仓库上安装 MySQL。非常简单，但不是最新版（5.7）
  2. 从官方仓库安装 MySQL。你将额外增加一些步处理过程，但不用担心。你将会拥有最新版的MySQL（8.0）

有必要的时候，我将会提供屏幕截图去引导你。但这篇文章中的大部分步骤，我将直接在终端（默认热键： `CTRL+ALT+T`）输入命令。别害怕！

#### 方法 1、从 Ubuntu 仓库安装 MySQL

首先，输入下列命令确保你的仓库已经被更新：

```
sudo apt update
```

现在，安装 MySQL 5.7，简单输入下列命令：

```
sudo apt install mysql-server -y
```

就是这样！简单且高效。

#### 方法 2、使用官方仓库安装 MySQL

虽然这个方法多了一些步骤，但我将逐一介绍，并尝试写下清晰的笔记。

首先浏览 MySQL 官方网站的[下载页面][4]。

![][5]

在这里，选择 DEB 软件包，点击“Download”链接。

![][6]

滑到有关于 Oracle 网站信息的底部，右键 “No thanks, just start my download.”，然后选择 “Copy link location”。

现在回到终端，我们将使用 [Curl][7] 命令去下载这个软件包：

```
curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
```

`https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb` 是我刚刚从网页上复制的链接。根据当前的 MySQL 版本，它有可能不同。让我们使用 `dpkg` 去开始安装 MySQL：

```
sudo dpkg -i mysql-apt-config*
```

更新你的仓库：

```
sudo apt update
```

要实际安装 MySQL，我们将使用像第一个方法中同样的命令来安装：

```
sudo apt install mysql-server -y
```

这样做会在你的终端中打开包配置的提示。使用向下箭头选择“Ok”选项。

![][8]

点击回车。这应该会提示你输入密码：这是在为 MySQL 设置 root 密码。不要与 [Ubuntu 的 root 密码混淆][9]。

![][10]

输入密码然后点击 Tab 键去选择“Ok“。点击回车键，你将重新输入密码。操作完之后，再次键入 Tab 去选择 “Ok”。按下回车键。

![][11]

将会展示一些关于 MySQL Server 的配置信息。再次按下 Tab 去选择 “Ok” 和按下回车键：

![][12]

这里你需要去选择默认验证插件。确保选择了“Use Strong Password Encryption”。按下 Tab 键和回车键。

就是这样！你已经成功地安装了 MySQL。

#### 验证你的 MySQL 安装

要验证 MySQL 已经正确安装，使用下列命令：

```
sudo systemctl status mysql.service
```

这将展示一些关于 MySQL 服务的信息：

![][13]

你应该在那里看到 “Active: active (running)”。如果你没有看到，使用下列命令去开始这个服务：

```
sudo systemctl start mysql.service
```

#### 配置/保护 MySQL

对于刚安装的 MySQL，你应该运行它提供的安全相关的更新命令。就是：

```
sudo mysql_secure_installation
```

这样做首先会询问你是否想使用 “<ruby>密码有效强度<rt>validate password component</rt></ruby>”。如果你想使用它，你将必须选择一个最小密码强度（0 – 低，1 – 中，2 – 高）。你将无法输入任何不遵守所选规则的密码。如果你没有使用强密码的习惯（本应该使用），这可能会配上用场。如果你认为它可能有帮助，那你就键入 `y` 或者 `Y`，按下回车键，然后为你的密码选择一个强度等级和输入一个你想使用的密码。如果成功，你将继续强化过程；否则你将重新输入一个密码。

但是，如果你不想要此功能（我不会），只需按回车或任何其他键即可跳过使用它。

对于其他选项，我建议开启它们（对于每一步输入 `y` 或者 `Y` 和按下回车）。它们（依序）是：“<ruby>移除匿名用户<rt>remove anonymous user</rt></ruby>”，“<ruby>禁止 root 远程登录<rt>disallow root login remotely</rt></ruby>”，“<ruby>移除测试数据库及其访问<rt>remove test database and access to it</rt></ruby>”。“<ruby>重新载入权限表<rt>reload privilege tables now</rt></ruby>”。

#### 链接与断开 MySQL Server

为了运行 SQL 查询，你首先必须使用 MySQL 连到服务器并在 MySQL 提示符使用。

执行此操作的命令是：

```
mysql -h host_name -u user -p
```

* `-h` 用来指定一个主机名（如果这个服务被安装到其他机器上，那么会有用；如果没有，忽略它）
* `-u` 指定登录的用户
* `-p` 指定你想输入的密码.

虽然出于安全原因不建议，但是你可以在命令行最右边的 `-p` 后直接输入密码。例如，如果用户`test_user` 的密码是 `1234`，那么你可以在你使用的机器上尝试去连接，你可以这样使用：

```
mysql -u test_user -p1234
```

如果你成功输入了必要的参数，你将会收到由 MySQL shell 提示符提供的欢迎（`mysql >`）：

![][14]

要从服务端断开连接和离开 MySQL 提示符，输入：

```
QUIT
```

输入 `quit` （MySQL 不区分大小写）或者 `\q` 也能工作。按下回车退出。

你使用简单的命令也能输出关于版本的信息：

```
sudo mysqladmin -u root version -p
```

如果你想看命令行选项列表，使用：

```
mysql --help
```

#### 卸载 MySQL

如果您决定要使用较新版本或只是想停止使用 MySQL。

首先，关闭服务：

```
sudo systemctl stop mysql.service && sudo systemctl disable mysql.service
```

确保你备份了你的数据库，以防你之后想使用它们。你可以通过运行下列命令卸载 MySQL：

```
sudo apt purge mysql*
```

清理依赖：

```
sudo apt autoremove
```

### 小结

在这篇文章中，我已经介绍如何在 Ubuntu Linux 上安装 Mysql。我很高兴如果这篇文章能帮助到那些正为此挣扎的用户或者刚刚开始的用户。

如果你发现这篇文章是一个很有用的资源，在评论里告诉我们。你为了什么使用 MySQL? 我们渴望收到你的任何反馈、印象和建议。感谢阅读，并毫不犹豫地尝试这个很棒的工具！

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-mysql-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[arrowfeng](https://github.com/arrowfeng)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://www.mysql.com/
[2]: https://en.wikipedia.org/wiki/LAMP_(software_bundle)
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/install-mysql-ubuntu.png?resize=800%2C450&ssl=1
[4]: https://dev.mysql.com/downloads/repo/apt/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_apt_download_page.jpg?fit=800%2C280&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_deb_download_link.jpg?fit=800%2C507&ssl=1
[7]: https://linuxhandbook.com/curl-command-examples/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_package_configuration_ok.jpg?fit=800%2C587&ssl=1
[9]: https://itsfoss.com/change-password-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_enter_password.jpg?fit=800%2C583&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_information_on_configuring.jpg?fit=800%2C581&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_default_authentication_plugin.jpg?fit=800%2C586&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_service_information.jpg?fit=800%2C402&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_shell_prompt-2.jpg?fit=800%2C423&ssl=1
