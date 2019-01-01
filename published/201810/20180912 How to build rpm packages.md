如何构建 RPM 包
======

> 节省跨多个主机安装文件和脚本的时间和精力。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1)

自20多年前我开始使用 Linux 以来，我已经使用过基于 rpm 的软件包管理器在 Red Hat 和 Fedora Linux 系统上安装软件。我使用过 `rpm` 程序本身，还有 `yum` 和 `dnf` ，用于在我的 Linux 主机上安装和更新软件包，`dnf` 是 `yum` 的一个近亲。 `yum` 和 `dnf` 工具是 `rpm` 实用程序的包装器，它提供了其他功能，例如查找和安装包依赖项的功能。

多年来，我创建了许多 Bash 脚本，其中一些脚本具有单独的配置文件，我希望在大多数新计算机和虚拟机上安装这些脚本。这也能解决安装所有这些软件包需要花费大量时间的难题，因此我决定通过创建一个 rpm 软件包来自动执行该过程，我可以将其复制到目标主机并将所有这些文件安装在适当的位置。虽然 `rpm` 工具以前用于构建 rpm 包，但该功能已被删除，并且创建了一个新工具来构建新的 rpm。

当我开始这个项目时，我发现很少有关于创建 rpm 包的信息，但我找到了一本书，名为《Maximum RPM》，这本书才帮我弄明白了。这本书现在已经过时了，我发现的绝大多数信息都是如此。它也已经绝版，用过的副本也需要花费数百美元。[Maximum RPM][1] 的在线版本是免费提供的，并保持最新。该 [RPM 网站][2]还有其他网站的链接，这些网站上有很多关于 rpm 的文档。其他的信息往往是简短的，显然都是假设你已经对该过程有了很多了解。

此外，我发现的每个文档都假定代码需要在开发环境中从源代码编译。我不是开发人员。我是一个系统管理员，我们系统管理员有不同的需求，因为我们不需要或者我们不应该为了管理任务而去编译代码；我们应该使用 shell 脚本。所以我们没有源代码，因为它需要被编译成二进制可执行文件。我们拥有的源代码也应该是可执行的。

在大多数情况下，此项目应作为非 root 用户执行。 rpm 包永远不应该由 root 用户构建，而只能由非特权普通用户构建。我将指出哪些部分应该以 root 身份执行，哪些部分应由非 root，非特权用户执行。

### 准备

首先，打开一个终端会话，然后 `su` 到 root 用户。 请务必使用 `-` 选项以确保启用完整的 root 环境。 我不认为系统管理员应该使用 `sudo` 来执行任何管理任务。 在我的个人博客文章中可以找出为什么：[真正的系统管理员不要使用 sudo][3]。

```
[student@testvm1 ~]$ su -
Password:
[root@testvm1 ~]#
```

创建可用于此项目的普通用户 student，并为该用户设置密码。

```
[root@testvm1 ~]# useradd -c "Student User" student
[root@testvm1 ~]# passwd student
Changing password for user student.
New password: <Enter the password>
Retype new password: <Enter the password>
passwd: all authentication tokens updated successfully.
[root@testvm1 ~]#
```

构建 rpm 包需要 `rpm-build` 包，该包可能尚未安装。 现在以 root 身份安装它。 请注意，此命令还将安装多个依赖项。 数量可能会有所不同，具体取决于主机上已安装的软件包； 它在我的测试虚拟机上总共安装了 17 个软件包，这是非常小的。

```
dnf install -y rpm-build
```

除非另有明确指示，否则本项目的剩余部分应以普通用户用户 student 来执行。 打开另一个终端会话并使用 `su` 切换到该用户以执行其余步骤。 使用以下命令从 GitHub 下载我准备好的开发目录结构 utils.tar 这个<ruby>tar 包<rt>tarball</rt></ruby>（LCTT 译注：tarball 是以 tar 命令来打包和压缩的文件的统称）：

```
wget https://github.com/opensourceway/how-to-rpm/raw/master/utils.tar
```

此 tar 包包含将由最终 `rpm` 程序安装的所有文件和 Bash 脚本。 还有一个完整的 spec 文件，你可以使用它来构建 rpm。 我们将详细介绍 spec 文件的每个部分。

作为普通学生 student，使用你的家目录作为当前工作目录（`pwd`），解压缩 tar 包。

```
[student@testvm1 ~]$ cd ; tar -xvf utils.tar
```

使用 `tree` 命令验证 `~/development` 的目录结构和包含的文件，如下所示：

```
[student@testvm1 ~]$ tree development/
development/
├── license
│   ├── Copyright.and.GPL.Notice.txt
│   └── GPL_LICENSE.txt
├── scripts
│   ├── create_motd
│   ├── die
│   ├── mymotd
│   └── sysdata
└── spec
    └── utils.spec

3 directories, 7 files
[student@testvm1 ~]$
```

`mymotd` 脚本创建一个发送到标准输出的“当日消息”数据流。 `create_motd` 脚本运行 `mymotd` 脚本并将输出重定向到 `/etc/motd` 文件。 此文件用于向使用 SSH 远程登录的用户显示每日消息。

`die` 脚本是我自己的脚本，它将 `kill` 命令包装在一些代码中，这些代码可以找到与指定字符串匹配的运行程序并将其终止。 它使用 `kill -9` 来确保 `kill` 命令一定会执行。

`sysdata` 脚本可以显示有关计算机硬件，还有已安装的 Linux 版本，所有已安装的软件包以及硬盘驱动器元数据等数万行数据。 我用它来记录某个时间点的主机状态。 我以后可以用它作为参考。 我曾经这样做是为了维护我为客户安装的主机记录。

你可能需要将这些文件和目录的所有权更改为 `student:student` 。 如有必要，使用以下命令执行此操作：

```
chown -R student:student development
```

此文件树中的大多数文件和目录将通过你在此项目期间创建的 rpm 包安装在 Fedora 系统上。

### 创建构建目录结构

`rpmbuild` 命令需要非常特定的目录结构。 你必须自己创建此目录结构，因为没有提供自动方式。 在家目录中创建以下目录结构：

```
~ ─ rpmbuild
    ├── RPMS
    │   └── noarch
    ├── SOURCES
    ├── SPECS
    └── SRPMS
```

我们不会创建 `rpmbuild/RPMS/X86_64` 目录，因为它是特定于体系结构编译的 64 位二进制文件。 我们有 shell 脚本，不是特定于体系结构的。 实际上，我们也不会使用 `SRPMS` 目录，它将包含编译器的源文件。

### 检查 spec 文件

每个 spec 文件都有许多部分，其中一些部分可能会被忽视或省略，取决于 rpm 构建的具体情况。 这个特定的 spec 文件不是工作所需的最小文件的示例，但它是一个包含不需要编译的文件的中等复杂 spec 文件的很好例子。 如果需要编译，它将在 `%build` 部分中执行，该部分在此 spec 文件中省略掉了，因为它不是必需的。

#### 前言

这是 spec 文件中唯一没有标签的部分。 它包含运行命令 `rpm -qi [Package Name]` 时看到的大部分信息。 每个数据都是一行，由标签和标签值的文本数据组成。

```
###############################################################################
# Spec file for utils
################################################################################
# Configured to be built by user student or other non-root user
################################################################################
#
Summary: Utility scripts for testing RPM creation
Name: utils
Version: 1.0.0
Release: 1
License: GPL
URL: http://www.both.org
Group: System
Packager: David Both
Requires: bash
Requires: screen
Requires: mc
Requires: dmidecode
BuildRoot: ~/rpmbuild/

# Build with the following syntax:
# rpmbuild --target noarch -bb utils.spec
```

`rpmbuild` 程序会忽略注释行。我总是喜欢在本节中添加注释，其中包含创建包所需的 `rpmbuild` 命令的确切语法。

`Summary` 标签是包的简短描述。 

`Name`、`Version` 和 `Release` 标签用于创建 rpm 文件的名称，如 `utils-1.00-1.rpm`。通过增加发行版号码和版本号，你可以创建 rpm 包去更新旧版本的。

`License` 标签定义了发布包的许可证。我总是使用 GPL 的一个变体。指定许可证对于澄清包中包含的软件是开源的这一事实非常重要。这也是我将 `License` 和 `GPL` 语句包含在将要安装的文件中的原因。

`URL` 通常是项目或项目所有者的网页。在这种情况下，它是我的个人网页。

`Group` 标签很有趣，通常用于 GUI 应用程序。 `Group` 标签的值决定了应用程序菜单中的哪一组图标将包含此包中可执行文件的图标。与 `Icon` 标签（我们此处未使用）一起使用时，`Group` 标签允许在应用程序菜单结构中添加用于启动程序的图标和所需信息。

`Packager` 标签用于指定负责维护和创建包的人员或组织。

`Requires` 语句定义此 rpm 包的依赖项。每个都是包名。如果其中一个指定的软件包不存在，DNF 安装实用程序将尝试在 `/etc/yum.repos.d` 中定义的某个已定义的存储库中找到它，如果存在则安装它。如果 DNF 找不到一个或多个所需的包，它将抛出一个错误，指出哪些包丢失并终止。

`BuildRoot` 行指定顶级目录，`rpmbuild` 工具将在其中找到 spec 文件，并在构建包时在其中创建临时目录。完成的包将存储在我们之前指定的 `noarch` 子目录中。

注释显示了构建此程序包的命令语法，包括定义了目标体系结构的 `–target noarch` 选项。因为这些是 Bash 脚本，所以它们与特定的 CPU 架构无关。如果省略此选项，则构建将选用正在执行构建的 CPU 的体系结构。

`rpmbuild` 程序可以针对许多不同的体系结构，并且使用 `--target` 选项允许我们在不同的体系结构主机上构建特定体系结构的包，其具有与执行构建的体系结构不同的体系结构。所以我可以在 x86_64 主机上构建一个用于 i686 架构的软件包，反之亦然。

如果你有自己的网站，请将打包者的名称更改为你自己的网站。

#### 描述部分（`%description`）

spec 文件的 `%description` 部分包含 rpm 包的描述。 它可以很短，也可以包含许多信息。 我们的 `%description` 部分相当简洁。

```
%description
A collection of utility scripts for testing RPM creation.
```

#### 准备部分（`%prep`）

`%prep` 部分是在构建过程中执行的第一个脚本。 在安装程序包期间不会执行此脚本。

这个脚本只是一个 Bash shell 脚本。 它准备构建目录，根据需要创建用于构建的目录，并将相应的文件复制到各自的目录中。 这将包括作为构建的一部分的完整编译所需的源代码。

`$RPM_BUILD_ROOT` 目录表示已安装系统的根目录。 在 `$RPM_BUILD_ROOT` 目录中创建的目录是真实文件系统中的绝对路径，例如 `/user/local/share/utils`、`/usr/local/bin` 等。

对于我们的包，我们没有预编译源，因为我们的所有程序都是 Bash 脚本。 因此，我们只需将这些脚本和其他文件复制到已安装系统的目录中。

```
%prep
################################################################################
# Create the build tree and copy the files from the development directories    #
# into the build tree.                                                         #
################################################################################
echo "BUILDROOT = $RPM_BUILD_ROOT"
mkdir -p $RPM_BUILD_ROOT/usr/local/bin/
mkdir -p $RPM_BUILD_ROOT/usr/local/share/utils

cp /home/student/development/utils/scripts/* $RPM_BUILD_ROOT/usr/local/bin
cp /home/student/development/utils/license/* $RPM_BUILD_ROOT/usr/local/share/utils
cp /home/student/development/utils/spec/* $RPM_BUILD_ROOT/usr/local/share/utils

exit
```

请注意，本节末尾的 `exit` 语句是必需的。

#### 文件部分（`%files`）

spec 文件的 `%files` 这一部分定义了要安装的文件及其在目录树中的位置。 它还指定了要安装的每个文件的文件属性（`%attr`）以及所有者和组所有者。 文件权限和所有权是可选的，但我建议明确设置它们以消除这些属性在安装时不正确或不明确的任何可能性。 如果目录尚不存在，则会在安装期间根据需要创建目录。

```
%files
%attr(0744, root, root) /usr/local/bin/*
%attr(0644, root, root) /usr/local/share/utils/*
```

#### 安装前（`%pre`）

在我们的实验室项目的 spec 文件中，此部分为空。 这应该放置那些需要 rpm 中的文件安装前执行的脚本。

#### 安装后（`%post`）

spec 文件的这一部分是另一个 Bash 脚本。 这个在文件安装后运行。 此部分几乎可以是你需要或想要的任何内容，包括创建文件、运行系统命令以及重新启动服务以在进行配置更改后重新初始化它们。 我们的 rpm 包的 `%post` 脚本执行其中一些任务。

```
%post
################################################################################
# Set up MOTD scripts                                                          #
################################################################################
cd /etc
# Save the old MOTD if it exists
if [ -e motd ]
then
   cp motd motd.orig
fi
# If not there already, Add link to create_motd to cron.daily
cd /etc/cron.daily
if [ ! -e create_motd ]
then
   ln -s /usr/local/bin/create_motd
fi
# create the MOTD for the first time
/usr/local/bin/mymotd > /etc/motd
```

此脚本中包含的注释应明确其用途。

#### 卸载后（`%postun`）

此部分包含将在卸载 rpm 软件包后运行的脚本。 使用 `rpm` 或 `dnf` 删除包会删除文件部分中列出的所有文件，但它不会删除安装后部分创建的文件或链接，因此我们需要在本节中处理。

此脚本通常由清理任务组成，只是清除以前由 `rpm` 安装的文件，但 rpm 本身无法完成清除。 对于我们的包，它包括删除 `%post` 脚本创建的链接并恢复 motd 文件的已保存原件。

```
%postun
# remove installed files and links
rm /etc/cron.daily/create_motd

# Restore the original MOTD if it was backed up
if [ -e /etc/motd.orig ]
then
   mv -f /etc/motd.orig /etc/motd
fi
```

#### 清理（`%clean`）

这个 Bash 脚本在 rpm 构建过程之后开始清理。 下面 `%clean` 部分中的两行删除了 `rpm-build` 命令创建的构建目录。 在许多情况下，可能还需要额外的清理。

```
%clean
rm -rf $RPM_BUILD_ROOT/usr/local/bin
rm -rf $RPM_BUILD_ROOT/usr/local/share/utils
```

#### 变更日志（`%changelog`）

此可选的文本部分包含 rpm 及其包含的文件的变更列表。最新的变更记录在本部分顶部。

```
%changelog
* Wed Aug 29 2018 Your Name <Youremail@yourdomain.com>
  - The original package includes several useful scripts. it is
    primarily intended to be used to illustrate the process of
    building an RPM.
```

使用你自己的姓名和电子邮件地址替换标题行中的数据。

### 构建 rpm

spec 文件必须位于 `rpmbuild` 目录树的 `SPECS` 目录中。 我发现最简单的方法是创建一个指向该目录中实际 spec 文件的链接，以便可以在开发目录中对其进行编辑，而无需将其复制到 `SPECS` 目录。 将 `SPECS` 目录设为当前工作目录，然后创建链接。

```
cd ~/rpmbuild/SPECS/
ln -s ~/development/spec/utils.spec
```

运行以下命令以构建 rpm。 如果没有错误发生，只需要花一点时间来创建 rpm。

```
rpmbuild --target noarch -bb utils.spec
```

检查 `~/rpmbuild/RPMS/noarch` 目录以验证新的 rpm 是否存在。

```
[student@testvm1 ~]$ cd rpmbuild/RPMS/noarch/
[student@testvm1 noarch]$ ll
total 24
-rw-rw-r--. 1 student student 24364 Aug 30 10:00 utils-1.0.0-1.noarch.rpm
[student@testvm1 noarch]$
```

### 测试 rpm

以 root 用户身份安装 rpm 以验证它是否正确安装并且文件是否安装在正确的目录中。 rpm 的确切名称将取决于你在前言部分中标签的值，但如果你使用了示例中的值，则 rpm 名称将如下面的示例命令所示：

```
[root@testvm1 ~]# cd /home/student/rpmbuild/RPMS/noarch/
[root@testvm1 noarch]# ll
total 24
-rw-rw-r--. 1 student student 24364 Aug 30 10:00 utils-1.0.0-1.noarch.rpm
[root@testvm1 noarch]# rpm -ivh utils-1.0.0-1.noarch.rpm
Preparing...                          ################################# [100%]
Updating / installing...
   1:utils-1.0.0-1                    ################################# [100%]
```

检查 `/usr/local/bin` 以确保新文件存在。 你还应验证是否已创建 `/etc/cron.daily` 中的 `create_motd` 链接。

使用 `rpm -q --changelog utils` 命令查看更改日志。 使用 `rpm -ql utils` 命令（在 `ql` 中为小写 `L` ）查看程序包安装的文件。

```
[root@testvm1 noarch]# rpm -q --changelog utils
* Wed Aug 29 2018 Your Name <Youremail@yourdomain.com>
- The original package includes several useful scripts. it is
    primarily intended to be used to illustrate the process of
    building an RPM.

[root@testvm1 noarch]# rpm -ql utils
/usr/local/bin/create_motd
/usr/local/bin/die
/usr/local/bin/mymotd
/usr/local/bin/sysdata
/usr/local/share/utils/Copyright.and.GPL.Notice.txt
/usr/local/share/utils/GPL_LICENSE.txt
/usr/local/share/utils/utils.spec
[root@testvm1 noarch]#
```

删除包。

```
rpm -e utils
```

### 试验

现在，你将更改 spec 文件以要求一个不存在的包。 这将模拟无法满足的依赖关系。 在现有依赖行下立即添加以下行：

```
Requires: badrequire
```

构建包并尝试安装它。 显示什么消息？

我们使用 `rpm` 命令来安装和删除 `utils` 包。 尝试使用 `yum` 或 `dnf` 安装软件包。 你必须与程序包位于同一目录中，或指定程序包的完整路径才能使其正常工作。

### 总结

在这篇对创建 rpm 包的基础知识的概览中，我们没有涉及很多标签和很多部分。 下面列出的资源可以提供更多信息。 构建 rpm 包并不困难；你只需要正确的信息。 我希望这对你有所帮助——我花了几个月的时间来自己解决问题。

我们没有涵盖源代码构建，但如果你是开发人员，那么从这一点开始应该是一个简单的步骤。

创建 rpm 包是另一种成为懒惰系统管理员的好方法，可以节省时间和精力。 它提供了一种简单的方法来分发和安装那些我们作为系统管理员需要在许多主机上安装的脚本和其他文件。

### 资料

- Edward C. Baily，《Maximum RPM》，Sams 出版于 2000 年，ISBN 0-672-31105-4
- Edward C. Baily，《[Maximum RPM][1]》，更新在线版本
- [RPM 文档][4]：此网页列出了 rpm 的大多数可用在线文档。 它包括许多其他网站的链接和有关 rpm 的信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/how-build-rpm-packages

作者：[David Both][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[1]: http://ftp.rpm.org/max-rpm/
[2]: http://rpm.org/index.html
[3]: http://www.both.org/?p=960
[4]: http://rpm.org/documentation.html
